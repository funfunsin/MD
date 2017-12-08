<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="SOrder.aspx.cs" Inherits="SOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

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
        SelectCommand="select distinct orderList.orderNo,orderList.customerID,orderList.orderTime,orderList.total,orderList.takeTime from orderList inner join orderContains on orderList.orderNo=orderContains.orderNo inner join meal on orderContains.mealNo=meal.mealNo where taxID=@taxID and taken=1 and (convert(date,orderList.orderTime) between @BeginTime and @EndTime)">
        <SelectParameters>
            <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
            <asp:ControlParameter ControlID="txtBeginTime" Name="BeginTime" Type="String" />
            <asp:ControlParameter ControlID="txtEndTime" Name="EndTime" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:GridView ID="grv" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="orderNo" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="orderNo" HeaderText="訂單編號" ReadOnly="True" SortExpression="orderNo" />
            <asp:BoundField DataField="customerID" HeaderText="顧客ID" SortExpression="customerID" />
            <asp:BoundField DataField="orderTime" HeaderText="訂單成立時間" SortExpression="orderTime" />
            <asp:BoundField DataField="total" HeaderText="總金額" SortExpression="total" />
            <asp:BoundField DataField="takeTime" HeaderText="取餐時間" SortExpression="takeTime" />
            <asp:CommandField ShowSelectButton="True" HeaderText="詳細資料" />
        </Columns>
    </asp:GridView>


</asp:Content>

