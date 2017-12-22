<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="SInfo.aspx.cs" Inherits="SInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="padding:0px 15px 15px 15px">
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
                    <div>
                        <img src='images/store/<%# Eval("img") %>.jpg' />
                    </div>
                    <table class="table">
                        <tr>
                            <td>統一編號</td>
                            <td>
                                <asp:Label ID="lbTaxID" runat="server" Text='<%# Eval("taxID") %>' /></td>
                        </tr>
                        <tr>
                            <td>店家名稱</td>
                            <td>
                                <asp:Label ID="lbStoreName" runat="server" Text='<%# Bind("storeName") %>' /></td>
                        </tr>
                        <tr>
                            <td>電話</td>
                            <td>
                                <asp:TextBox ID="txtTel" runat="server" Text='<%# Bind("tel") %>' CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>金流帳戶</td>
                            <td>
                                <asp:TextBox ID="txtMoneyAccount" runat="server" Text='<%# Bind("moneyAccount") %>' CssClass="form-control" /></td>
                        </tr>
                        <tr>
                            <td>店家圖片</td>
                            <td>
                                <asp:FileUpload ID="fulImg" runat="server" CssClass="form-control" />
                            </td>
                        </tr>
                    </table>

                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                </EditItemTemplate>

                <ItemTemplate>
                    <div>
                        <img src='images/store/<%# Eval("img") %>.jpg' width="300" />
                    </div>
                    <table class="table">
                        <tr>
                            <td>統一編號</td>
                            <td>
                                <asp:Label ID="lbTaxID" runat="server" Text='<%# Eval("taxID") %>' /></td>
                        </tr>
                        <tr>
                            <td>店家名稱</td>
                            <td>
                                <asp:Label ID="lbStoreName" runat="server" Text='<%# Bind("storeName") %>' /></td>
                        </tr>
                        <tr>
                            <td>電話</td>
                            <td>
                                <asp:Label ID="lbTel" runat="server" Text='<%# Bind("tel") %>' /></td>
                        </tr>
                        <tr>
                            <td>金流帳戶</td>
                            <td>
                                <asp:Label ID="lbMoneyAccount" runat="server" Text='<%# Bind("moneyAccount") %>' /></td>
                        </tr>
                    </table>
                    <asp:Button ID="Edit" runat="server" Text="修改資料" CommandName="Edit" CssClass="btn btn-danger" />
                    <input id="btnShow" type="button" value="修改密碼" class="btn btn-success" />
                </ItemTemplate>
            </asp:FormView>
        </div>

        <div id="PasswordTable" style="width:300px">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table class="table">
                        <tr>
                            <td>新密碼</td>
                            <td>
                                <asp:TextBox ID="txtNewPassword" runat="server" Text="" CssClass="form-control" TextMode="Password" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNewPassword" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valPassword"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>密碼確認</td>
                            <td>
                                <asp:TextBox ID="txtPasswordconfirm" runat="server" Text="" CssClass="form-control" TextMode="Password" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPasswordconfirm" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic" ValidationGroup="valPassword"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" ControlToValidate="txtPasswordconfirm" ControlToCompare="txtNewPassword" runat="server" ErrorMessage="密碼不符" ForeColor="Red" Display="Dynamic" ValidationGroup="valPassword"></asp:CompareValidator>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnUpdate" runat="server" Text="確認送出" OnClick="btnUpdate_Click" CssClass="btn btn-primary" ValidationGroup="valPassword" />
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lbPasswordInfo" runat="server" Text=""></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

    <script src="Scripts/jquery-3.2.1.min.js"></script>
    <script>
        $('#PasswordTable').hide();
        $('#btnShow').click(function () {
            if ($('#btnShow').val() == '修改密碼') {
                $('#PasswordTable').show(500, function () {
                    $('#btnShow').val('取消修改');
                    $('#btnShow').removeClass('btn-success');
                    $('#btnShow').addClass('btn btn-default');
                });
            }
            else {
                $('#PasswordTable').hide(500, function () {
                    $('#btnShow').val('修改密碼');
                    $('#btnShow').removeClass('btn-default');
                    $('#btnShow').addClass('btn btn-success');
                });
            }
        })


    </script>
</asp:Content>
