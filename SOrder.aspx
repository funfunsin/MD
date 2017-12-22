<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="SOrder.aspx.cs" Inherits="SOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding:0px 15px 15px 15px">
        <%--自訂選擇區間--%>
        <asp:Label ID="lbTime" runat="server" Text="選擇時間區間："></asp:Label>
        起始時間<asp:TextBox ID="txtBeginTime" runat="server" Text="" OnTextChanged="txtBeginTime_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:LinkButton ID="lkBeginTime" runat="server" OnClick="lkBeginTime_Click"><span class="glyphicon glyphicon-calendar"></span></asp:LinkButton>
        <asp:Calendar ID="CalendarBegin" runat="server" Visible="false" OnSelectionChanged="CalendarBegin_SelectionChanged"></asp:Calendar>

        ~ 結束時間<asp:TextBox ID="txtEndTime" runat="server" Text="" OnTextChanged="txtEndTime_TextChanged" AutoPostBack="true"></asp:TextBox>
        <asp:LinkButton ID="lkEndTime" runat="server" OnClick="lkEndTime_Click"><span class="glyphicon glyphicon-calendar"></span></asp:LinkButton>
        <asp:Calendar ID="CalendarEnd" runat="server" Visible="false" OnSelectionChanged="CalendarEnd_SelectionChanged"></asp:Calendar>
        <hr />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
            SelectCommand="select distinct orderList.orderNo,orderList.customerID,orderList.orderTime,orderList.total from orderList inner join orderContains on orderList.orderNo=orderContains.orderNo inner join meal on orderContains.mealNo=meal.mealNo where taxID=@taxID and taken=1 and (convert(date,orderList.orderTime) between @BeginTime and @EndTime)">
            <SelectParameters>
                <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
                <asp:ControlParameter ControlID="txtBeginTime" Name="BeginTime" Type="String" />
                <asp:ControlParameter ControlID="txtEndTime" Name="EndTime" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
            SelectCommand="SELECT orderContains.orderNo, meal.mealName, orderContains.quantity, meal.price, orderContains.waitingTime, orderContains.finished FROM meal INNER JOIN orderContains ON meal.mealNo = orderContains.mealNo where orderNo=@orderNo">
            <SelectParameters>
                <asp:ControlParameter ControlID="grv" Name="orderNo" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:GridView ID="grv" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="orderNo" CssClass="table table-bordered" OnRowCommand="grv_RowCommand">
            <Columns>
                <asp:BoundField DataField="orderNo" HeaderText="訂單編號" ReadOnly="True" SortExpression="orderNo" />
                <asp:BoundField DataField="customerID" HeaderText="顧客ID" SortExpression="customerID" />
                <asp:BoundField DataField="orderTime" HeaderText="訂單成立時間" SortExpression="orderTime" />
                <asp:TemplateField HeaderText="總金額" SortExpression="total">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("total","{0:C0}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="詳細資料">
                    <ItemTemplate>
                        <asp:Button runat="server" CommandName="select" Text="選擇" CausesValidation="false" CssClass="btn btn-primary"></asp:Button>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <div class="modal" id="detail">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3 class="text-center"><span class="glyphicon glyphicon-search" style="color: #90A4AE"></span>訂單詳細資料</h3>
                    </div>
                    <div class="modal-body">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table table-bordered">
                            <Columns>
                                <%--<asp:BoundField DataField="orderNo" HeaderText="訂單編號" SortExpression="orderNo" />--%>
                                <asp:BoundField DataField="mealName" HeaderText="餐點名稱" SortExpression="mealName" />
                                <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity" />
                                <asp:TemplateField HeaderText="金額" SortExpression="price">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("price","{0:C0}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="waitingTime" HeaderText="等待時間" SortExpression="waitingTime" />
                                <asp:CheckBoxField DataField="finished" HeaderText="製作狀態" SortExpression="finished" />
                            </Columns>
                        </asp:GridView>
                        <div class="modal-footer">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

