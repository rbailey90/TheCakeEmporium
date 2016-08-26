﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Products_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
        <div class="center-block">
        <h1>Product Details</h1>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProductId" DataSourceID="SqlDataSource2" Height="350px" Width="572px">            
            <ItemTemplate>
                <!----><asp:Image ID="imgProduct" runat="server" Width="250px" Height="250px" ImageUrl='<%# Bind("Image", "~/Images/Products/{0}") %>' />
                <br />
                <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                <br />
                Price:
                <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Bind("UnitPrice", "{0:C}") %>' />
                <br />
                We currently have&nbsp;
                <asp:Label ID="OnHandLabel" runat="server" Text='<%# Bind("OnHand") %>' />
                &nbsp;on hand.<br />

            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [ProductId], [Name], [Description], [Image], [UnitPrice], [OnHand] FROM [Products] WHERE ([ProductId] = @ProductId)">
            <SelectParameters>
                <asp:SessionParameter Name="ProductId" SessionField="CakeChoice" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name], [Description], [Image], [UnitPrice], [OnHand], [ProductId] FROM [Products]"></asp:SqlDataSource>
    <div id="order">
        <p id="quantity">
            
            <asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label>
            <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Please enter how many you'd like to order."></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQuantity" Display="Dynamic" ErrorMessage="Please enter a number between 1 and 9." MaximumValue="9" MinimumValue="1" Type="Integer"></asp:RangeValidator>
        </p>
            <asp:Button ID="btnAddtoCart" runat="server" Text="Add to Cart" OnClick="btnAddtoCart_Click" />
    </div>
        </div>
    </div>
</asp:Content>

