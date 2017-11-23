<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="Xaddmenu.aspx.cs" Inherits="Saddmenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" 
        SelectCommand="SELECT * FROM [meal]" 
        InsertCommand="insert into meal values (@mealNo,@mealName,@price,@mealTime,@taxID)"> 
        <InsertParameters>
            <asp:ControlParameter Name="mealNo" ControlID="txtMealNo" Type="String" />
            <asp:ControlParameter Name="mealName" ControlID="txtMealName" Type="String" />
            <asp:ControlParameter Name="price" ControlID="txtPrice" Type="String" />
            <asp:ControlParameter Name="mealTime" ControlID="txtMealTime" Type="String" />
            <asp:ControlParameter Name="taxID" ControlID="lbTaxID" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <div class="container">
        <table style="width:80%">
            <tr>
                <td>美食街</td>
                <td>
                    <asp:Label ID="lbFoodcourtName" runat="server" Text='<%=Session["foodcourtName"].ToString()%>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>店名</td>
                <td>
                    <asp:Label ID="lbStoreName" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lbTaxID" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <%--系統預設的流水號--%>
                <td>餐點編號</td>
                <td>
                    <asp:TextBox ID="txtMealNo" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>餐點名稱</td>
                <td>
                    <asp:TextBox ID="txtMealName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtMealName" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>餐點價格</td>
                <td>
                    <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>元
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtPrice" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>製作時間</td>
                <td>
                    <asp:TextBox ID="txtMealTime" runat="server"></asp:TextBox>分
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtMealTime" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSend" runat="server" Text="送出" OnClick="btnSend_Click" />
                </td>
            </tr>

        </table>
    </div>

</asp:Content>

