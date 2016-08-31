<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="User_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="Order ID" HeaderText="Order ID" SortExpression="Order ID" />
            <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
            <asp:BoundField DataField="Product ID" HeaderText="Product ID" SortExpression="Product ID" Visible="false"/>
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="Price of Each" HeaderText="Price of Each" SortExpression="Price of Each" />
            <asp:BoundField DataField="Order Date" HeaderText="Order Date" SortExpression="Order Date" />
            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT OrderDetails.[OrderId] as 'Order ID', Orders.[Username] as 'Username', OrderDetails.[ProductID] as 'Product ID', OrderDetails.[Quantity] as 'Quantity', OrderDetails.[PriceEach] as 'Price of Each', OrderDetails.[OrderDate] as 'Order Date', Orders.[total] as 'Total' FROM [OrderDetails] inner join Orders on Orders.OrderId = OrderDetails.OrderId inner join Products on Products.ProductId = OrderDetails.ProductID"></asp:SqlDataSource>
</asp:Content>

