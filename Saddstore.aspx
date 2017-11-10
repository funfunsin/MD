<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="Saddstore.aspx.cs" Inherits="Saddstore" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
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

        <table style="width: 80%">

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
                    <asp:TextBox ID="txtTaxID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtTaxID" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valSend"></asp:RequiredFieldValidator>
                    <%--要再補統一編號的驗證 & 統一編號是否重複--%>
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

</asp:Content>

