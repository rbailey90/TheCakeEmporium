<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Products_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Product Details</p>
    <p>
        This page will show a breakdown of the cake details along with a larger picture for the cutomer to see.</p>
    <p>
        <asp:Label ID="lblCakeID" runat="server"></asp:Label>
    </p>
    <p>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProductId" DataSourceID="SqlDataSource2" CellPadding="4" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" GridLines="Horizontal">
            <EditItemTemplate>
                ProductId:
                <asp:Label ID="ProductIdLabel1" runat="server" Text='<%# Eval("ProductId") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Image:
                <asp:TextBox ID="ImageTextBox" runat="server" Text='<%# Bind("Image") %>' />
                <br />
                UnitPrice:
                <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' />
                <br />
                OnHand:
                <asp:TextBox ID="OnHandTextBox" runat="server" Text='<%# Bind("OnHand") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                Cake Detail
            </HeaderTemplate>
            <InsertItemTemplate>
                ProductId:
                <asp:TextBox ID="ProductIdTextBox" runat="server" Text='<%# Bind("ProductId") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Image:
                <asp:TextBox ID="ImageTextBox" runat="server" Text='<%# Bind("Image") %>' />
                <br />
                UnitPrice:
                <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>' />
                <br />
                OnHand:
                <asp:TextBox ID="OnHandTextBox" runat="server" Text='<%# Bind("OnHand") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                ProductId:
                <asp:Label ID="ProductIdLabel" runat="server" Text='<%# Eval("ProductId") %>' />
                <br />
                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                &nbsp;<asp:Label ID="ImageLabel" runat="server" Text='<%# Bind("Image") %>' />
                <br />
                Price:
                <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Bind("UnitPrice", "{0:C}") %>' />
                <br />
                Currently on Hand:
                <asp:Label ID="OnHandLabel" runat="server" Text='<%# Bind("OnHand") %>' />
                <br />

            </ItemTemplate>
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:groupCakeConnectionString %>" SelectCommand="SELECT [ProductId], [Name], [Description], [Image], [UnitPrice], [OnHand] FROM [Products] WHERE ([ProductId] = @ProductId)">
            <SelectParameters>
                <asp:SessionParameter Name="ProductId" SessionField="CakeChoice" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:groupCakeConnectionString %>" SelectCommand="SELECT [Name], [Description], [Image], [UnitPrice], [OnHand], [ProductId] FROM [Products]"></asp:SqlDataSource>
    </p>
    <div id="order">
        <p id="quantity">
            
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Please enter how many you'd like to order."></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Please enter a number between 1 and 9." ValidationExpression="\d{1}"></asp:RegularExpressionValidator>
        </p>
            <asp:Button ID="btnAddtoCart" runat="server" Text="Add to Cart" OnClick="btnAddtoCart_Click" />
    </div>
</asp:Content>

