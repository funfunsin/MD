<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S_logoin.aspx.cs" Inherits="S_logoin1" %>

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
        <table style="width:400px">
            <%--<thead>店家後台登入</thead>--%>
            <tr>
                <td>統一編號:</td>
                <td>
                    <asp:TextBox ID="taxID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="taxID" runat="server" ErrorMessage="必填欄位" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="taxID" runat="server" ValidationExpression="[0-9]{8}" ErrorMessage="統一編號為八碼數字" ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>密碼:</td>
                <td>
                    <asp:TextBox ID="password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="password" runat="server" ErrorMessage="必填欄位" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btn_login" runat="server" Text="登入" />
                </td>
            </tr>
        </table>


        
        
    
    </div>
    </form>
</body>
</html>
