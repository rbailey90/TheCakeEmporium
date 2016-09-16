<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DashOrderDetails.aspx.cs" Inherits="Manager_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/dashboard.css" rel="stylesheet" />
<div class="dataBox">
      <row class="DashboardHeader">
        <h3>Site Manager</h3>
    </row>
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="../Manager/Dashboard.aspx">Customer Orders <span class="sr-only">(current)</span></a></li>
            <li><a href="../Manager/Phonebook.aspx">Customer Info</a></li>
            <li><a href="../Manager/CustomerComments.aspx">Customer Comments</a></li>
            <li></li>
            <li></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="../Manager/Deals.aspx">Current Deals</a></li>
            <li><a href="../Manager/DashInventoryManagement.aspx">Inventory Manager</a></li>
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
<h4 class="sub-header text-center">Customer Order Listing</h4>
          <div class="table-responsive dataArea">
              <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333">
                  <EditItemTemplate>
                      Name:
                      <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                      <br />
                      OrderDate:
                      <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
                      <br />
                      OrderStatus:
                      <asp:TextBox ID="OrderStatusTextBox" runat="server" Text='<%# Bind("OrderStatus") %>' />
                      <br />
                      Quantity:
                      <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                      <br />
                      PriceEach:
                      <asp:TextBox ID="PriceEachTextBox" runat="server" Text='<%# Bind("PriceEach") %>' />
                      <br />
                      OrderId:
                      <asp:TextBox ID="OrderIdTextBox" runat="server" Text='<%# Bind("OrderId") %>' />
                      <br />
                      ProductID:
                      <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' />
                      <br />
                      <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                      &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                  </EditItemTemplate>
                  <EditRowStyle BackColor="#7C6F57" />
                  <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <InsertItemTemplate>
                      Name:
                      <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                      <br />
                      OrderDate:
                      <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
                      <br />
                      OrderStatus:
                      <asp:TextBox ID="OrderStatusTextBox" runat="server" Text='<%# Bind("OrderStatus") %>' />
                      <br />
                      Quantity:
                      <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                      <br />
                      PriceEach:
                      <asp:TextBox ID="PriceEachTextBox" runat="server" Text='<%# Bind("PriceEach") %>' />
                      <br />
                      OrderId:
                      <asp:TextBox ID="OrderIdTextBox" runat="server" Text='<%# Bind("OrderId") %>' />
                      <br />
                      ProductID:
                      <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' />
                      <br />
                      <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                      &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                  </InsertItemTemplate>
                  <ItemTemplate>
                      Name:
                      <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                      <br />
                      OrderDate:
                      <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Bind("OrderDate") %>' />
                      <br />
                      OrderStatus:
                      <asp:Label ID="OrderStatusLabel" runat="server" Text='<%# Bind("OrderStatus") %>' />
                      <br />
                      Quantity:
                      <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' />
                      <br />
                      PriceEach:
                      <asp:Label ID="PriceEachLabel" runat="server" Text='<%# Bind("PriceEach") %>' />
                      <br />
                      OrderId:
                      <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Bind("OrderId") %>' />
                      <br />
                      ProductID:
                      <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Bind("ProductID") %>' />
                      <br />
                  </ItemTemplate>
                  <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#E3EAEB" />
              </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name], [OrderDate], [OrderStatus], [Quantity], [PriceEach], [OrderId], [ProductID] FROM [User_OrderedProducts] WHERE ([OrderId] = @OrderId)">
        <SelectParameters>
            <asp:SessionParameter Name="OrderId" SessionField="Order" Type="String" />
        </SelectParameters>
                </asp:SqlDataSource>
         </div>
     </div>
</div>
</asp:Content>
