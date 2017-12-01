<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:TextBox ID="thedate" runat="server"></asp:TextBox>

    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.min.js"></script>
    <script>
        $(function () {
            $('#thedate').datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });
    </script>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" SelectCommand="SELECT * FROM [orderList]"></asp:SqlDataSource>
    <%--https://www.youtube.com/watch?v=RoTQWrs0bJs--%>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="orderNo" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="orderNo" HeaderText="orderNo" ReadOnly="True" SortExpression="orderNo" />
            <asp:BoundField DataField="orderTime" HeaderText="orderTime" SortExpression="orderTime" />
            <asp:TemplateField HeaderText="詳細資料">
                <ItemTemplate>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("orderNo") %>' />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="orderNo,mealNo" DataSourceID="SqlDataSource1" EmptyDataText="沒有資料錄可顯示。">
                        <Columns>
                            <asp:BoundField DataField="orderNo" HeaderText="orderNo" ReadOnly="True" SortExpression="orderNo" />
                            <asp:BoundField DataField="mealNo" HeaderText="mealNo" ReadOnly="True" SortExpression="mealNo" />
                            <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />
                            <asp:BoundField DataField="waitingTime" HeaderText="waitingTime" SortExpression="waitingTime" />
                            <asp:CheckBoxField DataField="finished" HeaderText="finished" SortExpression="finished" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
                        DeleteCommand="DELETE FROM [orderContains] WHERE [orderNo] = @orderNo AND [mealNo] = @mealNo"
                        InsertCommand="INSERT INTO [orderContains] ([orderNo], [mealNo], [quantity], [waitingTime], [finished]) VALUES (@orderNo, @mealNo, @quantity, @waitingTime, @finished)"
                        SelectCommand="SELECT [orderNo], [mealNo], [quantity], [waitingTime], [finished] FROM [orderContains] WHERE ([orderNo] = @orderNo)"
                        UpdateCommand="UPDATE [orderContains] SET [quantity] = @quantity, [waitingTime] = @waitingTime, [finished] = @finished WHERE [orderNo] = @orderNo AND [mealNo] = @mealNo">
                        <DeleteParameters>
                            <asp:Parameter Name="orderNo" Type="String" />
                            <asp:Parameter Name="mealNo" Type="String" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="orderNo" Type="String" />
                            <asp:Parameter Name="mealNo" Type="String" />
                            <asp:Parameter Name="quantity" Type="Int32" />
                            <asp:Parameter Name="waitingTime" Type="Int32" />
                            <asp:Parameter Name="finished" Type="Boolean" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HiddenField1" Name="orderNo" PropertyName="Value" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="quantity" Type="Int32" />
                            <asp:Parameter Name="waitingTime" Type="Int32" />
                            <asp:Parameter Name="finished" Type="Boolean" />
                            <asp:Parameter Name="orderNo" Type="String" />
                            <asp:Parameter Name="mealNo" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

