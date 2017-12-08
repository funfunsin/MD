<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="SInfo.aspx.cs" Inherits="SInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
            SelectCommand="SELECT * FROM [store] where taxID=@taxID and enabled=1" 
            UpdateCommand="Update [store] set tel=@tel, moneyAccount=@moneyAccount where taxID=@taxID">
            <SelectParameters>
                <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div>
            <asp:FormView ID="StoreData" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="taxID" OnItemCommand="StoreData_ItemCommand">
                <EditItemTemplate>
                    <div><img src='images/store/<%# Eval("img") %>.jpg' /></div>
                    <table class="table">
                        <tr>
                            <td>統一編號</td>
                            <td><asp:Label ID="lbTaxID" runat="server" Text='<%# Eval("taxID") %>'  /></td>
                        </tr>
                        <tr>
                            <td>店家名稱</td>
                            <td><asp:Label ID="lbStoreName" runat="server" Text='<%# Bind("storeName") %>'/></td>
                        </tr>
                        <tr>
                            <td>電話</td>
                            <td><asp:TextBox ID="txtTel" runat="server" Text='<%# Bind("tel") %>'  CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>金流帳戶</td>
                            <td><asp:TextBox ID="txtMoneyAccount" runat="server" Text='<%# Bind("moneyAccount") %>'  CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>店家圖片</td>
                            <td>
                                <asp:FileUpload ID="fulImg" runat="server" CssClass="form-control" />
                            </td>
                        </tr>
<%--                        <tr>
                            <td>新密碼</td>
                            <td><asp:TextBox ID="passwordTextBox" runat="server" Text="" /></td>
                        </tr>
                        <tr>
                            <td>密碼確認</td>
                            <td><asp:TextBox ID="TextBox5" runat="server" Text="" /></td>
                        </tr>--%>
                    </table>


<%--                  password:<asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />--%>

                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>

                <ItemTemplate>
                    <div><img src='images/store/<%# Eval("img") %>.jpg' /></div>
                    <table class="table">
                        <tr>
                            <td>統一編號</td>
                            <td><asp:Label ID="lbTaxID" runat="server" Text='<%# Eval("taxID") %>' /></td>
                        </tr>
                        <tr>
                            <td>店家名稱</td>
                            <td><asp:Label ID="lbStoreName" runat="server" Text='<%# Bind("storeName") %>' /></td>
                        </tr>
                        <tr>
                            <td>電話</td>
                            <td><asp:Label ID="lbTel" runat="server" Text='<%# Bind("tel") %>' /></td>
                        </tr>
                        <tr>
                            <td>金流帳戶</td>
                            <td><asp:Label ID="lbMoneyAccount" runat="server" Text='<%# Bind("moneyAccount") %>' /></td>
                        </tr>
                    </table>
                    <asp:Button ID="Edit" runat="server" Text="修改資料" CommandName="Edit" CssClass="btn btn-danger" />

                    <%--password:<asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />--%>
                </ItemTemplate>
            </asp:FormView>
        </div>


    </div>
</asp:Content>
