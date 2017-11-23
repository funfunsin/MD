<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LOGIN.aspx.cs" Inherits="LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/MyStyle.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a id="menu-toggle" class="navbar-toggle">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <a class="navbar-brand" href="SBulletin.aspx">免等後台系統</a>
        </div>
    </nav>

    <div class="container" style="position:relative; top:80px">
        <fieldset>
            <legend>店家登入</legend>
            <table id="logintable" class="table">
                <tbody>
                    <tr>
                        <td class="text-right">
                            <label for="txtTaxID">統一編號：</label></td>
                        <td>
                            <asp:TextBox ID="txtTaxID" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtTaxID" runat="server" ErrorMessage="必填欄位" ForeColor="Red" Display="Dynamic" ValidationGroup="valLogin"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtTaxID" runat="server" ValidationExpression="[0-9]{8}" ErrorMessage="統一編號為八碼數字" ForeColor="Red" Display="Dynamic" ValidationGroup="valLogin"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="text-right">
                            <label for="txtPassword">密碼：</label></td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" runat="server" ErrorMessage="必填欄位" ForeColor="Red" Display="Dynamic" ValidationGroup="valLogin"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="text-center">
                            <asp:Button ID="btnLogin" runat="server" Text="登入" CssClass="btn btn-primary" OnClick="btnLogin_Click" ValidationGroup="valLogin" />
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <asp:Label ID="lblInfo1" runat="server" Text="還未成為會員?  "></asp:Label>
                    <asp:LinkButton ID="lkbtnRegister" runat="server" PostBackUrl="~/ADD.aspx">註冊商家</asp:LinkButton>
                </tfoot>
            </table>

            <asp:Label ID="lblInfo" runat="server" CssClass="alert-danger"></asp:Label>
        </fieldset>
    </div>
    </form>
    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</body>
</html>
