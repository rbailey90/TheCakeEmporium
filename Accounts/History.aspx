<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="User_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> <!-- hi ;)-->
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="OrderId" HeaderText="OrderId" SortExpression="OrderId" />
        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        <asp:BoundField DataField="PriceEach" HeaderText="PriceEach" SortExpression="PriceEach" />
        <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
        <asp:BoundField DataField="total" HeaderText="total" SortExpression="total" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:groupCakeConnectionString %>" SelectCommand="SELECT OrderDetails.[OrderId], Orders.[Username], OrderDetails.[Quantity], OrderDetails.[PriceEach], OrderDetails.[OrderDate], Orders.[total] FROM [OrderDetails] inner join Orders on Orders.OrderId = OrderDetails.OrderId"></asp:SqlDataSource>
</asp:Content>

