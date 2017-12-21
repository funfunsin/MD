<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="STodayOrder.aspx.cs" Inherits="STodayOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <%--要加上目前排隊人數--%>
    <%--要判斷訂單時間是否為當日  --%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="select orderContains.orderNo,orderTime,meal.mealName,orderContains.quantity,orderContains.finished,orderContains.mealNo from orderContains inner join meal on orderContains.mealNo=meal.mealNo inner join orderList on orderContains.orderNo=orderList.orderNo where taxID=@taxID and finished=0 and enabled=1"
        DeleteCommand="update orderContains set finished=1 where orderNo=@orderNo and mealNo=@mealNo">
        <SelectParameters>
            <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="select orderContains.orderNo,orderTime,meal.mealName,orderContains.quantity,orderContains.finished,orderContains.mealNo from orderContains inner join meal on orderContains.mealNo=meal.mealNo inner join orderList on orderContains.orderNo=orderList.orderNo where taxID=@taxID and finished=1 and enabled=1"
        DeleteCommand="update orderContains set finished=0 where orderNo=@orderNo and mealNo=@mealNo">
        <SelectParameters>
            <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="select distinct orderList.orderNo,orderList.customerID,orderList.orderTime,orderList.total from orderList inner join orderContains on orderList.orderNo=orderContains.orderNo inner join meal on orderContains.mealNo=meal.mealNo where taxID=@taxID and taken=1">
        <SelectParameters>
            <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="SELECT orderContains.orderNo, meal.mealName, orderContains.quantity, meal.price, orderContains.waitingTime, orderContains.finished FROM meal INNER JOIN orderContains ON meal.mealNo = orderContains.mealNo where orderNo=@orderNo">
        <SelectParameters>
            <asp:ControlParameter ControlID="grTaken" Name="orderNo" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h2><span class="glyphicon glyphicon-hourglass" style="font-size: inherit"></span>等候製作</h2>
    <asp:GridView ID="grvWaite" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-bordered" DataKeyNames="orderNo,mealNo"
        OnRowCommand="grvWaite_RowCommand" ShowHeaderWhenEmpty="True" EmptyDataText="目前無等候製作之餐點">
        <Columns>
            <asp:BoundField DataField="orderNo" HeaderText="訂單編號" SortExpression="orderNo" />
            <asp:BoundField DataField="orderTime" HeaderText="訂單成立時間" SortExpression="orderTime" />
            <asp:BoundField DataField="mealName" HeaderText="餐點名稱" SortExpression="mealName" />
            <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-danger" HeaderText="製作狀態" ShowDeleteButton="True" ItemStyle-Width="80px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" DeleteText="製作中">
                <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px"></ItemStyle>
            </asp:CommandField>
        </Columns>
    </asp:GridView>

    <hr />

    <h2><span class="glyphicon glyphicon-save" style="font-size: inherit"></span>製作完成</h2>
    <asp:GridView ID="grvFinish" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table table-bordered" DataKeyNames="orderNo,mealNo"
        OnRowCommand="grvFinish_RowCommand" ShowHeaderWhenEmpty="true" EmptyDataText="目前無製作完成及等候取餐之餐點">
        <Columns>
            <asp:BoundField DataField="orderNo" HeaderText="訂單編號" SortExpression="orderNo" />
            <asp:BoundField DataField="orderTime" HeaderText="訂單成立時間" SortExpression="orderTime" />
            <asp:BoundField DataField="mealName" HeaderText="餐點名稱" SortExpression="mealName" />
            <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-success" HeaderText="製作狀態" ShowDeleteButton="True" ItemStyle-Width="80px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" DeleteText="製作完成"></asp:CommandField>
        </Columns>
    </asp:GridView>

    <hr />

    <h2><span class="glyphicon glyphicon-check" style="font-size: inherit"></span>今日已取餐</h2>
    <asp:GridView ID="grTaken" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False" DataKeyNames="orderNo" CssClass="table table-bordered" OnRowCommand="grTaken_RowCommand">
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
                    <asp:LinkButton runat="server" CommandName="select" Text="選擇" CausesValidation="false"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

    <div class="modal" id="detail">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal">&times;</button>
                    <h3 class="text-center"><span class="glyphicon glyphicon-search" style="color: #90A4AE"></span>詳細資料</h3>
                </div>
                <div class="modal-body">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" CssClass="table table-bordered">
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

</asp:Content>

