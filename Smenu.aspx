<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="Smenu.aspx.cs" Inherits="Smenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #ContentPlaceHolder1_GridView1 th {
            text-align: center;
            background-color: #373636;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label ID="lbtaxID" runat="server" Text="" Visible="false"></asp:Label>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="SELECT * FROM [meal] where taxID=@taxID "
        UpdateCommand="Update [meal] set mealName=@mealName, price=@price, mealTime=@mealTime, img=@img,Product_Status=@Product_Status where mealNo=@mealNo">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbtaxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:LinkButton ID="lkbAddmenu" CssClass="btn btn-danger" runat="server" data-toggle="modal" data-target="#Addmenu">
        <span class="glyphicon glyphicon-plus"></span> 新增餐點
    </asp:LinkButton>

    <div class="modal" id="Addmenu">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h2 class="text-center">餐點新增</h2>
                </div>
                <div class="modal-body">
                    <div>
                        <asp:Label ID="lbMealNo" runat="server" Text="餐點編號："></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lbMealName" runat="server" Text="餐點名稱："></asp:Label>
                        <asp:TextBox ID="txtMealName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lbPrice" runat="server" Text="餐點價格："></asp:Label>
                        <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lbMealTime" runat="server" Text="製作時間："></asp:Label>
                        <asp:TextBox ID="txtMealTime" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div>
                        <asp:Label ID="lbImg" runat="server" Text="餐點圖片："></asp:Label>
                        <asp:TextBox ID="txtImg" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnAddmenu" runat="server" Text="新增" CssClass="btn btn-primary" />
                    <input id="Reset1" type="reset" value="取消" class="btn btn-default" data-dismiss="modal" />
                </div>
            </div>
        </div>

    </div>

    <asp:GridView ID="grvMenu" runat="server" CssClass="table table-bordered " OnRowCommand="grvMenu_RowCommand"
        DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="mealNo">
        <Columns>
            <asp:BoundField DataField="mealNo" HeaderText="餐點編號" ReadOnly="True" SortExpression="mealNo" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" />

            <asp:TemplateField HeaderText="餐點名稱" SortExpression="mealName" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                <EditItemTemplate>
                    <asp:TextBox ID="txtMealName" runat="server" Text='<%# Bind("mealName") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("mealName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="餐點價格" SortExpression="price" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                <EditItemTemplate>
                    <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("price") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("price") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="製作時間" SortExpression="mealTime" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                <EditItemTemplate>
                    <asp:TextBox ID="txtMealTime" runat="server" Text='<%# Bind("mealTime") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("mealTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="餐點圖片" SortExpression="img" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                <EditItemTemplate>
                    <img src='images/meal/<%# Eval("img") %>.jpg' height="50" /><br />
                    <asp:FileUpload ID="fulImg" runat="server" />
                    <%--<asp:TextBox ID="txtImg" runat="server" Text='<%# Bind("img") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <img src='images/meal/<%# Eval("img") %>.jpg' height="120" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="上架狀態" SortExpression="Product_Status" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                <EditItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Product_Status") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("Product_Status") %>' Enabled="false" />
                </ItemTemplate>
            </asp:TemplateField>

            <asp:CommandField HeaderText="管理" ShowDeleteButton="True" ShowEditButton="True" ItemStyle-Width="80px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                <ItemStyle Width="80px"></ItemStyle>
            </asp:CommandField>
        </Columns>

    </asp:GridView>

</asp:Content>

