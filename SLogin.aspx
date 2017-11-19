<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="SLogin.aspx.cs" Inherits="SLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="container" style="width: 80%">
        <fieldset>
            <legend>abcde店家後台登入</legend>
            <table id="logintable" style="width: 80%" class="table">
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
                    <asp:LinkButton ID="lkbtnRegister" runat="server" PostBackUrl="~/Saddstore.aspx">註冊商家</asp:LinkButton>
                </tfoot>
            </table>

            <asp:Label ID="lblInfo" runat="server" CssClass="alert-danger"></asp:Label>
        </fieldset>

    </div>

</asp:Content>

