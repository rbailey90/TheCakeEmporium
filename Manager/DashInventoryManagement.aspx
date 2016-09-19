<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DashInventoryManagement.aspx.cs" Inherits="Manager_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
        .auto-style1 {
            width: 102px;
        }
        .auto-style2 {
            width: 225px;
        }
        .auto-style3 {
            width: 102px;
            height: 20px;
        }
        .auto-style4 {
            width: 225px;
            height: 20px;
        }
        .auto-style5 {
            height: 20px;
        }
        .auto-style9 {
            width: 229px;
        }
        .auto-style10 {
            height: 20px;
            width: 229px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/dashboard.css" rel="stylesheet" />
<div class="dataBox">
      <row class="DashboardHeader">
        <h3>Site Manager</h3>
    </row>
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="../Manager/Dashboard.aspx">Customer Orders <span class="sr-only">(current)</span></a></li>
            <li><a href="../Manager/Phonebook.aspx">Customer Info</a></li>
            <li><a href="../Manager/CustomerComments.aspx">Customer Comments</a></li>
            <li></li>
            <li></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="../Manager/Deals.aspx">Current Deals</a></li>
            <li class="active"><a href="../Manager/DashInventoryManagement.aspx">Inventory Manager</a></li>
            <li><a href="../Manager/DashAnalytics.aspx">Site Stats</a></li>
            <li></li>
            <li></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li></li>
            <li></li>
            <li></li>
          </ul>
        </div>
<div>
<h4 class="sub-header text-center">Inventory Management</h4>
          <div class="table-responsive dataArea">
    <asp:Label ID="lblError" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource1" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="ID" ReadOnly="True" SortExpression="ProductId" >
            <HeaderStyle CssClass="productHead" HorizontalAlign="Center" />
            <ItemStyle CssClass="productNameField" Width="15px" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle CssClass="productHead" HorizontalAlign="Center" />
                <ItemStyle CssClass="productNameField" />
            </asp:TemplateField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" ItemStyle-CssClass="productNameField">
            <HeaderStyle CssClass="productHead" HorizontalAlign="Center" />
<ItemStyle CssClass="productNameField"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" ItemStyle-CssClass="productNameField">
            <HeaderStyle CssClass="productHead" HorizontalAlign="Center" />
<ItemStyle CssClass="productNameField"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="UnitPrice" DataFormatString="{0:C}" ItemStyle-CssClass="productNameField">
            <HeaderStyle CssClass="productHead" HorizontalAlign="Center" />
<ItemStyle CssClass="productNameField" HorizontalAlign="Center" Width="80px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="OnHand" HeaderText="On Hand" SortExpression="OnHand" ItemStyle-CssClass="productNameField">
            <HeaderStyle CssClass="productHead" HorizontalAlign="Center" />
<ItemStyle CssClass="productNameField" HorizontalAlign="Center" Width="70px"></ItemStyle>
            </asp:BoundField>
            <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn-edit">
<ControlStyle CssClass="btn-edit"></ControlStyle>
            <HeaderStyle HorizontalAlign="Center" />
            </asp:CommandField>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="btn-dataview">
<ControlStyle CssClass="btn-dataview"></ControlStyle>
            </asp:CommandField>
        </Columns>
        <EditRowStyle BorderColor="#7C6F57" BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <br />
    To add a cake to the inventory, enter the information and click Add Cake<br />
        <table class="nav-justified">
            <tr>
                <td class="auto-style1">ID:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtID" runat="server" CssClass="form-control" ValidationGroup="invmgGroup" Width="72px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtID" Display="Dynamic" ErrorMessage="ID is required" Font-Italic="True" ValidationGroup="invmgGroup"></asp:RequiredFieldValidator>
                </td>
                <td>
                    Upload Image: .png files only, 500kb size limit, 250x250</td>
            </tr>
            <tr>
                <td class="auto-style1">Name:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" ValidationGroup="invmgGroup" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is Required" Font-Italic="True" ValidationGroup="invmgGroup"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Description:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtDescript" runat="server" CssClass="form-control" ValidationGroup="invmgGroup" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescript" Display="Dynamic" ErrorMessage="Description is Required" Font-Italic="True" ValidationGroup="invmgGroup"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Button ID="btnUpload" runat="server" cssClass="profileButton" OnClick="btnUpload_Click" Text="Upload Image" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">Image File:</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtImageFile" runat="server" CssClass="form-control" ValidationGroup="invmgGroup" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtImageFile" ErrorMessage="The file name is required" Font-Italic="True" ValidationGroup="invmgGroup"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style5">
                    <asp:Label ID="lblErrorImage" runat="server" Font-Italic="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Unit Price:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" ValidationGroup="invmgGroup" Width="72px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrice" ErrorMessage="A price is required" Font-Italic="True" ValidationGroup="invmgGroup"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">On Hand:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtOnHand" runat="server" CssClass="form-control" ValidationGroup="invmgGroup" Width="72px"></asp:TextBox>
                </td>
                <td class="auto-style9">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtOnHand" ErrorMessage="A quantity is required" Font-Italic="True" ValidationGroup="invmgGroup"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnAddCake" runat="server" cssClass="profileButton" OnClick="btnAddCake_Click" Text="Add Cake" ValidationGroup="invmgGroup" />
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style9">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Products] WHERE [ProductId] = @ProductId" InsertCommand="INSERT INTO [Products] ([ProductId], [Name], [Description], [Image], [UnitPrice], [OnHand]) VALUES (@ProductId, @Name, @Description, @Image, @UnitPrice, @OnHand)" SelectCommand="SELECT [ProductId], [Name], [Description], [Image], [UnitPrice], [OnHand] FROM [Products]" UpdateCommand="UPDATE [Products] SET [Name] = @Name, [Description] = @Description, [Image] = @Image, [UnitPrice] = @UnitPrice, [OnHand] = @OnHand WHERE [ProductId] = @ProductId">
        <DeleteParameters>
            <asp:Parameter Name="ProductId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ProductId" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Image" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="OnHand" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="Image" Type="String" />
            <asp:Parameter Name="UnitPrice" Type="Decimal" />
            <asp:Parameter Name="OnHand" Type="Int32" />
            <asp:Parameter Name="ProductId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
     </div>     
    </div>
</div>
</asp:Content>
