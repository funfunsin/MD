<%@ Page Title="" Language="C#" MasterPageFile="~/SMasterPage.master" AutoEventWireup="true" CodeFile="Smenu.aspx.cs" Inherits="Smenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString %>"
        SelectCommand="Select * FROM [meal] where taxID=@taxID and enabled=1 "
        UpdateCommand="Update [meal] set price=@price, mealTime=@mealTime, img=@img where mealNo=@mealNo"
        DeleteCommand="update [meal] set enabled=0 where mealNo=@mealNo">
        <SelectParameters>
            <asp:SessionParameter SessionField="taxID" Name="taxID" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="padding:0px 15px 15px 15px">
        <asp:LinkButton ID="lkbAddmeal" CssClass="btn btn-success" runat="server" data-toggle="modal" data-target="#Addmeal">
        <span class="glyphicon glyphicon-plus" style="color:white; font-size:16px;"></span> 新增餐點
        </asp:LinkButton>
        <hr />

        <div class="modal" id="Addmeal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button class="close" data-dismiss="modal">&times;</button>
                        <h2 class="text-center">餐點新增</h2>
                    </div>
                    <div class="modal-body">
                        <div>
                            <asp:Label ID="lbMealNo" runat="server" Text="餐點編號："></asp:Label>
                            <asp:TextBox ID="txtMealNo" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
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
                            <asp:FileUpload ID="fulImg" runat="server" CssClass="form-control" />
                            <%--<asp:TextBox ID="txtImg" runat="server" CssClass="form-control"></asp:TextBox>--%>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <asp:Button ID="btnAddmeal" runat="server" Text="新增" CssClass="btn btn-primary" OnClick="btnAddmeal_Click" />
                        <input id="Reset1" type="reset" value="取消" class="btn btn-default" data-dismiss="modal" />
                    </div>
                </div>
            </div>

        </div>

        <%--目前不提供菜單修改--%>
        <asp:GridView ID="grvMenu" runat="server" CssClass="table table-bordered" OnRowDataBound="grvMenu_RowDataBound"
            DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="mealNo">
            <Columns>
                <asp:BoundField DataField="mealNo" HeaderText="餐點編號" ReadOnly="True" SortExpression="mealNo" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>

                <asp:BoundField DataField="mealName" HeaderText="餐點名稱" ReadOnly="True" SortExpression="mealName" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:BoundField>

                <asp:TemplateField HeaderText="餐點價格" SortExpression="price" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPrice" runat="server" Text='<%# Bind("price","{0:C0}") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("price","{0:C0}") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="製作時間" SortExpression="mealTime" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMealTime" runat="server" Text='<%# Bind("mealTime") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("mealTime") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="餐點圖片" SortExpression="img" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                    <EditItemTemplate>
                        <img src='images/meal/<%# Eval("img") %>.png' height="50" /><br />
                        <asp:FileUpload ID="fulImg" runat="server" />
                        <asp:TextBox ID="txtImg" runat="server" Text='<%# Bind("img") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <img src='images/meal/<%# Eval("img") %>.png' height="120" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:CommandField ButtonType="Button" ControlStyle-CssClass="btn btn-danger" HeaderText="管理" ShowDeleteButton="True" ItemStyle-Width="80px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" DeleteText="下架"></asp:CommandField>
            </Columns>

        </asp:GridView>
    </div>
</asp:Content>

