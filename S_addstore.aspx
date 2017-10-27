<%@ Page Language="C#" AutoEventWireup="true" CodeFile="S_addstore.aspx.cs" Inherits="S_addstore1" %>

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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" 
                SelectCommand="SELECT * FROM [store]" 
                InsertCommand="insert into store value (@taxID,@storeName,@tel,@password,@foodcourtNo)">
                <InsertParameters>
                    <asp:ControlParameter Name="taxID" ControlID="txttaxID" Type="Int16" />
                    <asp:ControlParameter Name="storeName" ControlID="txtstoreName" Type="String" />
                    <asp:ControlParameter Name="tel" ControlID="txttel" Type="Int16"/>
                    <asp:ControlParameter Name="password" ControlID="txtpassword" Type="Int16" />
                    <asp:ControlParameter Name="foodcourtNo" ControlID="foodcourtNo" Type="Char" />
                </InsertParameters>

            </asp:SqlDataSource>

            <table style="width:300px">

                <tr>
                    <td>*</td>
                    <td>隸屬美食街</td>
                    <td>
                        <asp:DropDownList ID="foodcourtNo" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="foodcourtNo" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>統一編號</td>
                    <td>
                        <asp:TextBox ID="txttaxID" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txttaxID" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>店名</td>
                    <td>
                        <asp:TextBox ID="txtstoreName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtstoreName" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td> </td>
                    <td>電話</td>
                    <td>
                        <asp:TextBox ID="txttel" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>密碼</td>
                    <td>
                        <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="txtpassword" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>*</td>
                    <td>密碼確認</td>
                    <td>
                        <asp:TextBox ID="txtpasswordconfirm" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtpasswordconfirm" runat="server" ErrorMessage="必填" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button ID="btn_send" runat="server" Text="送出" />
                        <input id="Reset1" type="reset" value="重設" />
                    </td>
                </tr>

            </table>

        </div>
    </form>
</body>
</html>
