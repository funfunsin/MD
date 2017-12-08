<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LOGIN.aspx.cs" Inherits="LOGIN" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/MyStyle.css" rel="stylesheet" />
    <style>
        body {
            font-family: Arial,微軟正黑體;
            font-size: 16px;
            background-color: #f4f7f7;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">
                <a class="navbar-toggle" data-toggle="modal" data-target="#Mail" title="聯絡我們">
                    <span class="glyphicon glyphicon-envelope"></span>
                </a>
                <a class="navbar-toggle" data-toggle="modal" data-target="#Addstore" title="註冊商家">
                    <span class="glyphicon glyphicon-registration-mark" style="color: #F7B633"></span>
                </a>
                <a class="navbar-brand" href="SBulletin.aspx" title="回首頁"><span>免等後台系統</span></a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav navbar-right">
                    <li><a data-toggle="modal" data-target="#Addstore">註冊商家</a></li>
                    <li><a data-toggle="modal" data-target="#Mail">聯絡我們</a></li>
                </ul>
            </div>
        </nav>

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
            SelectCommand="SELECT * FROM [store]"
            InsertCommand="insert into store values (@taxID,@storeName,@img,@tel,@password,@moneyAccount,@foodcourtNo,1)">
            <InsertParameters>
                <asp:ControlParameter Name="taxID" ControlID="txtAddTaxID" Type="String" />
                <asp:ControlParameter Name="storeName" ControlID="txtStoreName" Type="String" />
                <asp:ControlParameter Name="img" ControlID="txtAddTaxID" Type="String" />
                <asp:ControlParameter Name="tel" ControlID="txtTel" Type="String" />
                <asp:ControlParameter Name="password" ControlID="txtNewPassword" Type="String" />
                <asp:ControlParameter Name="moneyAccount" ControlID="txtMoneyAccount" Type="String" />
                <asp:ControlParameter Name="foodcourtNo" ControlID="txtFoodcourtNo" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>

        <%--登入--%>
        <div class="container" style="position: relative; top: 80px">
            <fieldset>
                <legend><span class="glyphicon glyphicon-log-in" style="color: black"></span>店家登入</legend>
                <table id="logintable" class="table">
                    <tbody>
                        <tr>
                            <td class="text-right" style="width: 120px">
                                <label for="txtTaxID">統一編號：</label></td>
                            <td>
                                <asp:TextBox ID="txtTaxID" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtTaxID" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Static" ValidationGroup="valLogin"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="txtTaxID" runat="server" ValidationExpression="[0-9]{8}" ErrorMessage="統一編號為八碼數字" ForeColor="Red" Display="Static" ValidationGroup="valLogin"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">
                                <label for="txtPassword">密碼：</label></td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Static" ValidationGroup="valLogin"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="text-center">
                                <asp:Button ID="btnLogin" runat="server" Text="登入" CssClass="btn btn-primary" OnClick="btnLogin_Click" ValidationGroup="valLogin" />
                            </td>
                        </tr>
                    </tbody>
                </table>

                <asp:Label ID="lblInfo" runat="server" CssClass="alert-danger"></asp:Label>
            </fieldset>
        </div>

        <%--註冊商家--%>
        <div class="modal" id="Addstore">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3 class="text-center"><span class="glyphicon glyphicon-registration-mark" style="color: #F7B633"></span>註冊店家</h3>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                            <ContentTemplate>
                                <div>
                                    <asp:Label ID="Label1" runat="server" Text="隸屬美食街"></asp:Label>
                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                        <ContentTemplate>
                                            <asp:TextBox ID="txtFoodcourtNo" runat="server" Visible="false"></asp:TextBox>
                                            <asp:DropDownList ID="ddlfoodcourtName" runat="server" OnSelectedIndexChanged="ddlfoodcourtName_SelectedIndexChanged" CssClass="form-control" AutoPostBack="true">
                                            </asp:DropDownList>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Label ID="Label2" runat="server" Text="統一編號"></asp:Label>
                                            <asp:Label ID="lbInfo" runat="server"></asp:Label>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtAddTaxID" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Static" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                                            <%--<asp:CustomValidator ID="CustomValidator1" ControlToValidate="txtAddTaxID" ClientValidationFunction="taxIDCheck" runat="server" ErrorMessage="統一編號不正確" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>--%>
                                            <%--要再補統一編號的驗證 & 統一編號是否重複--%>
                                            <asp:TextBox ID="txtAddTaxID" runat="server" CssClass="form-control" OnTextChanged="txtAddTaxID_TextChanged" AutoPostBack="true"></asp:TextBox>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                                <div>
                                    <asp:Label ID="Label3" runat="server" Text="店名"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtStoreName" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Static" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtStoreName" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Label ID="Label4" runat="server" Text="店家圖片"></asp:Label>
                                    <asp:FileUpload ID="fulImg" runat="server" CssClass="form-control" />
                                </div>
                                <div>
                                    <asp:Label ID="Label8" runat="server" Text="電話"></asp:Label>
                                    <asp:TextBox ID="txtTel" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Label ID="Label5" runat="server" Text="金流帳戶"></asp:Label>
                                    <asp:TextBox ID="txtMoneyAccount" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Label ID="Label6" runat="server" Text="密碼"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtNewPassword" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Label ID="Label7" runat="server" Text="密碼確認"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtPasswordconfirm" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtPasswordconfirm" ControlToCompare="txtNewPassword" runat="server" ErrorMessage="密碼不符" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:CompareValidator>
                                    <asp:TextBox ID="txtPasswordconfirm" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="btnSend" runat="server" Text="送出" OnClick="btnSend_Click" CssClass="btn btn-primary" ValidationGroup="valSend" />
                                    <%--<asp:Button ID="Reset1" runat="server" Text="重設" class="btn btn-default" OnClick="Reset1_Click" />--%>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>

        <%--聯絡我們--%>
        <div class="modal" id="Mail">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h3 class="text-center"><span class="glyphicon glyphicon-envelope" style="color: #90A4AE"></span>聯絡我們</h3>
                    </div>
                    <div class="modal-body">
                        <div>
                            <asp:Label ID="lbName" runat="server" Text="請輸入您的姓名"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtName" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valMail"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lbEmail" runat="server" Text="請輸入您的Email信箱"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtEmail" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valMail"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div>
                            <asp:Label ID="lbContent" runat="server" Text="請輸入您的內容"></asp:Label>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtContent" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valMail"></asp:RequiredFieldValidator>
                            <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" Height="150px"></asp:TextBox>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnMail" runat="server" Text="送出" CssClass="btn btn-primary" ValidationGroup="valMail" OnClick="btnMail_Click" />
                            <input id="Reset2" type="reset" value="重設" class="btn btn-default" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script>
        var path = $(this);
        var contW = path.width();
        $(window).resize(function () {
            var path = $(this);
            var contW = path.width();
            if (contW >= 767) {
                $('.navbar-brand').text('免等後台系統');
                $('.navbar-brand').removeClass('glyphicon glyphicon-home');
            } else {
                $('.navbar-brand').text('');
                $('.navbar-brand').addClass('glyphicon glyphicon-home');
            }
        });
        if (contW >= 767) {
            $('.navbar-brand').text('免等後台系統');
            $('.navbar-brand').removeClass('glyphicon glyphicon-home');
        } else {
            $('.navbar-brand').text('');
            $('.navbar-brand').addClass('glyphicon glyphicon-home');
        }
    </script>
</body>
</html>
