<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ADD.aspx.cs" Inherits="ADD" %>

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

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="SELECT * FROM [store]"
        InsertCommand="insert into store values (@taxID,@storeName,@tel,@password,@moneyAccount,@foodcourtNo)">
        <InsertParameters>
            <asp:ControlParameter Name="taxID" ControlID="txtTaxID" Type="String" />
            <asp:ControlParameter Name="storeName" ControlID="txtStoreName" Type="String" />
            <asp:ControlParameter Name="tel" ControlID="txtTel" Type="String" />
            <asp:ControlParameter Name="password" ControlID="txtPassword" Type="String" />
            <asp:ControlParameter Name="moneyAccount" ControlID="txtMoneyAccount" Type="String" />
            <asp:ControlParameter Name="foodcourtNo" ControlID="txtFoodcourtNo" Type="String" />
        </InsertParameters>

    </asp:SqlDataSource>

    <div class="container" style="position:relative; top:80px">
        <table>

            <tr>
                <td>*</td>
                <td>隸屬美食街</td>
                <td>
                    <asp:TextBox ID="txtFoodcourtNo" runat="server" Visible="false"></asp:TextBox>
                    <asp:DropDownList ID="ddlfoodcourtName" runat="server" OnSelectedIndexChanged="ddlfoodcourtName_SelectedIndexChanged" AutoPostBack="true">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="ddlfoodcourtName" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>*</td>
                <td>統一編號</td>
                <td>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <%--<asp:TextBox ID="txtTaxID" runat="server" OnTextChanged="txtTaxID_TextChanged" AutoPostBack="true"></asp:TextBox>--%>
                            <asp:TextBox ID="txtTaxID" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtTaxID" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtTaxID" ClientValidationFunction="taxIDCheck" runat="server" ErrorMessage="統一編號不正確" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                            <asp:Label ID="lbInfo" runat="server" Text=""></asp:Label>
                            <%--要再補統一編號的驗證 & 統一編號是否重複--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>*</td>
                <td>店名</td>
                <td>
                    <asp:TextBox ID="txtStoreName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtStoreName" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>電話</td>
                <td>
                    <asp:TextBox ID="txtTel" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>*</td>
                <td>金流帳戶</td>
                <td>
                    <asp:TextBox ID="txtMoneyAccount" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>*</td>
                <td>密碼</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtPassword" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>*</td>
                <td>密碼確認</td>
                <td>
                    <asp:TextBox ID="txtPasswordconfirm" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtPasswordconfirm" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtPasswordconfirm" ControlToCompare="txtPassword" runat="server" ErrorMessage="密碼不符" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="btnSend" runat="server" Text="送出" OnClick="btnSend_Click" CssClass="btn btn-primary" ValidationGroup="valSend" />
                    <input id="Reset1" type="reset" value="重設" class="btn btn-default" />
                    <asp:Button ID="btnBack" runat="server" Text="回上一頁" OnClick="btnBack_Click" CssClass="btn btn-danger" />
                </td>
            </tr>

        </table>
    </div>
    </form>
    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</body>
</html>
