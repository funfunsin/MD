<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="STodayOrder.aspx.cs" Inherits="STodayOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lbtaxID" runat="server" Text="" Visible="false"></asp:Label>

    <%--要加上目前排隊人數--%>
    <%--要判斷訂單時間是否為當日  --%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="select orderContains.orderNo,orderTime,meal.mealName,orderContains.quantity,orderContains.finished,orderContains.mealNo from orderContains inner join meal on orderContains.mealNo=meal.mealNo inner join orderList on orderContains.orderNo=orderList.orderNo where taxID=@taxID and finished=0 and enabled=1"
        DeleteCommand="update orderContains set finished=1 where orderNo=@orderNo and mealNo=@mealNo">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbtaxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="select orderContains.orderNo,orderTime,meal.mealName,orderContains.quantity,orderContains.finished,orderContains.mealNo from orderContains inner join meal on orderContains.mealNo=meal.mealNo inner join orderList on orderContains.orderNo=orderList.orderNo where taxID=@taxID and finished=1 and enabled=1"
        DeleteCommand="update orderContains set finished=0 where orderNo=@orderNo and mealNo=@mealNo">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbtaxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="select distinct orderList.orderNo,orderList.customerID,orderList.orderTime,orderList.total,orderList.takeTime from orderList inner join orderContains on orderList.orderNo=orderContains.orderNo inner join meal on orderContains.mealNo=meal.mealNo where taxID=@taxID and taken=1">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbtaxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <h2>等候製作</h2>
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

    <h2>製作完成</h2>
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

    <h2>今日已取餐</h2>
    <asp:GridView ID="grTaken" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False" DataKeyNames="orderNo" CssClass="table table-bordered">
        <Columns>
            <asp:BoundField DataField="orderNo" HeaderText="訂單編號" ReadOnly="True" SortExpression="orderNo" />
            <asp:BoundField DataField="customerID" HeaderText="顧客ID" SortExpression="customerID" />
            <asp:BoundField DataField="orderTime" HeaderText="訂單成立時間" SortExpression="orderTime" />
            <asp:BoundField DataField="total" HeaderText="總金額" SortExpression="total" />
            <asp:BoundField DataField="takeTime" HeaderText="取餐時間" SortExpression="takeTime" />
            <asp:CommandField ShowSelectButton="True" HeaderText="詳細資料" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>

