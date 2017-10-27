<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S_addmenu.aspx.cs" Inherits="S_addmenu1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width:300px">
                <tr>
                    <%--顯示屬於哪個美食街,但不能選擇--%>
                    <td>美食街</td>
                    <td>
                        <asp:DropDownList ID="foodcourtNo" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <%--顯示店名,但不能選擇--%>
                    <td>店名</td>
                    <td>
                        <asp:TextBox ID="storeName" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <%--系統預設的流水號--%>
                    <td>餐點編號</td>
                    <td>
                        <asp:TextBox ID="mealNo" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>餐點名稱</td>
                    <td>
                        <asp:TextBox ID="mealName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="mealName" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>餐點價格</td>
                    <td>
                        <asp:TextBox ID="price" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="price" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>製作時間</td>
                    <td>
                        <asp:TextBox ID="mealTime" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="mealTime" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_send" runat="server" Text="送出" />
                    </td>
                </tr>

            </table>

        </div>
    </form>
</body>
</html>
