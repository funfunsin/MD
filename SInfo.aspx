<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="SInfo.aspx.cs" Inherits="SInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <asp:Label ID="lbtaxID" runat="server" Text="" Visible="false"></asp:Label>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
            SelectCommand="SELECT * FROM [store] where taxID=@taxID and enabled=1">
            <SelectParameters>
                <asp:ControlParameter ControlID="lbtaxID" Name="taxID" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div>
            <asp:FormView ID="StoreData" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="taxID">
                <EditItemTemplate>
                    <div><img src='images/store/<%# Eval("img") %>.jpg' /></div>
                    <table class="table">
                        <tr>
                            <td>隸屬美食街</td>
                            <td><asp:Label ID="foodcourtNoLabel" runat="server" Text='<%# Bind("foodcourtNo") %>' /></td>
                        </tr>
                        <tr>
                            <td>統一編號</td>
                            <td><asp:Label ID="taxIDLabel" runat="server" Text='<%# Eval("taxID") %>' /></td>
                        </tr>
                        <tr>
                            <td>店家名稱</td>
                            <td><asp:Label ID="storeNameLabel" runat="server" Text='<%# Bind("storeName") %>' /></td>
                        </tr>
                        <tr>
                            <td>電話</td>
                            <td><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("tel") %>' /></td>
                        </tr>
                        <tr>
                            <td>金流帳戶</td>
                            <td><asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("moneyAccount") %>' /></td>
                        </tr>
                        <tr>
                            <td>店家圖片</td>
                            <td><asp:TextBox ID="imgTextBox" runat="server" Text='<%# Bind("img") %>' /></td>
                        </tr>
                        <tr>
                            <td>新密碼</td>
                            <td><asp:TextBox ID="passwordTextBox" runat="server" Text="" /></td>
                        </tr>
                        <tr>
                            <td>密碼確認</td>
                            <td><asp:TextBox ID="TextBox5" runat="server" Text="" /></td>
                        </tr>
                    </table>


<%--                    img:<asp:TextBox ID="imgTextBox" runat="server" Text='<%# Bind("img") %>' />
                    password:<asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />--%>

                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>

                <ItemTemplate>
                    <div><img src='images/store/<%# Eval("img") %>.jpg' /></div>
                    <table class="table">
                        <tr>
                            <td>隸屬美食街</td>
                            <td><asp:Label ID="foodcourtNoLabel" runat="server" Text='<%# Bind("foodcourtNo") %>' /></td>
                        </tr>
                        <tr>
                            <td>統一編號</td>
                            <td><asp:Label ID="taxIDLabel" runat="server" Text='<%# Eval("taxID") %>' /></td>
                        </tr>
                        <tr>
                            <td>店家名稱</td>
                            <td><asp:Label ID="storeNameLabel" runat="server" Text='<%# Bind("storeName") %>' /></td>
                        </tr>
                        <tr>
                            <td>電話</td>
                            <td><asp:Label ID="telLabel" runat="server" Text='<%# Bind("tel") %>' /></td>
                        </tr>
                        <tr>
                            <td>金流帳戶</td>
                            <td><asp:Label ID="moneyAccountLabel" runat="server" Text='<%# Bind("moneyAccount") %>' /></td>
                        </tr>
                    </table>
                    <asp:Button ID="Button1" runat="server" Text="修改資料" CommandName="Edit" CssClass="btn btn-danger" />

                    <%--password:<asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />--%>
                </ItemTemplate>
            </asp:FormView>
        </div>


    </div>
</asp:Content>

