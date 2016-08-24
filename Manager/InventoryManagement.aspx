<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InventoryManagement.aspx.cs" Inherits="Manager_InventoryManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 89px;
        }
        .auto-style2 {
            width: 225px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
    <h1>Inventory Management</h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Label ID="lblError" runat="server"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProductId" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="427px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="ProductId" HeaderText="ID" ReadOnly="True" SortExpression="ProductId" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
            <asp:BoundField DataField="UnitPrice" HeaderText="Price" SortExpression="UnitPrice" DataFormatString="{0:C}" />
            <asp:BoundField DataField="OnHand" HeaderText="On Hand" SortExpression="OnHand" />
            <asp:CommandField ButtonType="Button" ShowEditButton="True" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
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
                    <asp:TextBox ID="txtID" runat="server" ValidationGroup="invmgGroup" Width="72px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtID" Display="Dynamic" ErrorMessage="ID is required" Font-Italic="True" ValidationGroup="invmgGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Name:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtName" runat="server" ValidationGroup="invmgGroup" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtName" Display="Dynamic" ErrorMessage="Name is Required" Font-Italic="True" ValidationGroup="invmgGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Description:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtDescript" runat="server" ValidationGroup="invmgGroup" Width="200px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDescript" Display="Dynamic" ErrorMessage="Description is Required" Font-Italic="True" ValidationGroup="invmgGroup"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">Unit Price:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtPrice" runat="server" ValidationGroup="invmgGroup" Width="72px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">On Hand:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtOnHand" runat="server" ValidationGroup="invmgGroup" Width="72px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="btnAddCake" runat="server" OnClick="btnAddCake_Click" Text="Add Cake" ValidationGroup="invmgGroup" />
                </td>
                <td class="auto-style2">&nbsp;</td>
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
</asp:Content>

