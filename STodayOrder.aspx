<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="STodayOrder.aspx.cs" Inherits="STodayOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lbtaxID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" 
        SelectCommand="select orderContains.orderNo,orderTime,meal.mealName,orderContains.quantity,orderContains.finished,orderContains.mealNo from orderContains inner join meal on orderContains.mealNo=meal.mealNo inner join orderList on orderContains.orderNo=orderList.orderNo where taxID=@taxID and finished=0" 
        DeleteCommand="update orderContains set finished=1 where orderNo=@orderNo and mealNo=@mealNo">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbtaxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" 
        SelectCommand="select orderContains.orderNo,orderTime,meal.mealName,orderContains.quantity,orderContains.finished,orderContains.mealNo from orderContains inner join meal on orderContains.mealNo=meal.mealNo inner join orderList on orderContains.orderNo=orderList.orderNo where taxID=@taxID and finished=1"
        DeleteCommand="update orderContains set finished=0 where orderNo=@orderNo and mealNo=@mealNo">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbtaxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" 
        SelectCommand="SELECT * FROM [orderList]"></asp:SqlDataSource>

    <h2>等後製作</h2>
    <asp:GridView ID="grvFinish" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="table table-bordered" DataKeyNames="orderNo,mealNo" OnRowCommand="grvFinish_RowCommand">
        <Columns>
            <asp:BoundField DataField="orderNo" HeaderText="訂單編號" SortExpression="orderNo" />
            <asp:BoundField DataField="orderTime" HeaderText="訂單成立時間" SortExpression="orderTime" />
            <asp:BoundField DataField="mealName" HeaderText="餐點名稱" SortExpression="mealName" />
            <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-danger" HeaderText="製作狀態" ShowDeleteButton="True" ItemStyle-Width="80px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" DeleteText="製作中">
            </asp:CommandField>
        </Columns>
    </asp:GridView>

    <hr />
    <h2>製作完成</h2>
    <asp:GridView ID="grvFinished" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" CssClass="table table-bordered" DataKeyNames="orderNo,mealNo">
        <Columns>
            <asp:BoundField DataField="orderNo" HeaderText="訂單編號" SortExpression="orderNo" />
            <asp:BoundField DataField="orderTime" HeaderText="訂單成立時間" SortExpression="orderTime" />
            <asp:BoundField DataField="mealName" HeaderText="餐點名稱" SortExpression="mealName" />
            <asp:BoundField DataField="quantity" HeaderText="數量" SortExpression="quantity" />
            <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-success" HeaderText="製作狀態" ShowDeleteButton="True" ItemStyle-Width="80px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" DeleteText="製作完成">
            </asp:CommandField>
        </Columns>
    </asp:GridView>

    <hr />
    <h2>今日已取餐</h2>
    <asp:GridView ID="grTaken" runat="server" DataSourceID="SqlDataSource3" AutoGenerateColumns="False" DataKeyNames="orderNo" CssClass="table table-bordered">
    </asp:GridView>

</asp:Content>

