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
    
<h4 class="sub-header text-center">Customer Order Listing</h4>              
             <div class="table-responsive dataArea">
              <div class="col-md-4 ">
                  <div class="listerContainer">
                  <asp:Label ID="lblHeader" runat="server" Text="Items Ordered" CssClass="dashHeader"></asp:Label>
                  <div class="mypadding">
                  <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
                  <AlternatingItemTemplate>
                      <span style=""><a class="detailLabel">Name:</a>
                      <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                      <br />
                      <a class="detailLabel">Order Date:</a>
                      <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                      <br />
                      <a class="detailLabel">Order Status:</a>
                      <asp:Label ID="OrderStatusLabel" runat="server" Text='<%# Eval("OrderStatus") %>' />
                      <br />
                      <a class="detailLabel">Quantity:</a>
                      <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                      <br />
                      <a class="detailLabel">Price Each:</a>
                      <asp:Label ID="PriceEachLabel" runat="server" Text='<%# Eval("PriceEach") %>' />
                      <br />
<br /></span>
                  </AlternatingItemTemplate>
                  <EditItemTemplate>
                      <span style="">Name:
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
                      <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                      <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                      <br /><br /></span>
                  </EditItemTemplate>
                  <EmptyDataTemplate>
                      <span>No data was returned.</span>
                  </EmptyDataTemplate>
                  <InsertItemTemplate>
                      <span style="">Name:
                      <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                      <br />OrderDate:
                      <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
                      <br />OrderStatus:
                      <asp:TextBox ID="OrderStatusTextBox" runat="server" Text='<%# Bind("OrderStatus") %>' />
                      <br />Quantity:
                      <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
                      <br />PriceEach:
                      <asp:TextBox ID="PriceEachTextBox" runat="server" Text='<%# Bind("PriceEach") %>' />
                      <br />
                      <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                      <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                      <br /><br /></span>
                  </InsertItemTemplate>
                  <ItemTemplate>
                      <span style=""><a class="detailLabel">Name:</a>
                      <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                      <br />
                      <a class="detailLabel">Order Date:</a>
                      <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                      <br />
                      <a class="detailLabel">Order Status:</a>
                      <asp:Label ID="OrderStatusLabel" runat="server" Text='<%# Eval("OrderStatus") %>' />
                      <br />
                      <a class="detailLabel">Quantity:</a>
                      <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                      <br />
                      <a class="detailLabel">Price Each:</a>
                      <asp:Label ID="PriceEachLabel" runat="server" Text='<%# Eval("PriceEach") %>' />
                      <br />
<br /></span>
                  </ItemTemplate>
                  <LayoutTemplate>
                      <div id="itemPlaceholderContainer" runat="server" style="">
                          <span runat="server" id="itemPlaceholder" />
                      </div>
                      <div style="">
                      </div>
                  </LayoutTemplate>
                  <SelectedItemTemplate>
                      <span style="">Name:
                      <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                      <br />
                      OrderDate:
                      <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Eval("OrderDate") %>' />
                      <br />
                      OrderStatus:
                      <asp:Label ID="OrderStatusLabel" runat="server" Text='<%# Eval("OrderStatus") %>' />
                      <br />
                      Quantity:
                      <asp:Label ID="QuantityLabel" runat="server" Text='<%# Eval("Quantity") %>' />
                      <br />
                      PriceEach:
                      <asp:Label ID="PriceEachLabel" runat="server" Text='<%# Eval("PriceEach") %>' />
                      <br />
<br /></span>
                  </SelectedItemTemplate>
              </asp:ListView>
                      </div>
                  </div>
              </div>
              <div class="col-md-4">
                  <div class="listerContainer">
                  <asp:Label ID="Label1" runat="server" Text="Shipping Information" CssClass="dashHeader"></asp:Label>
                      <div class="mypadding">
                  <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource2">
                      <AlternatingItemTemplate>
                          <span style="">shipTo:
                          <asp:Label ID="shipToLabel" runat="server" Text='<%# Eval("shipTo") %>' />
                          <br />
                          Street1:
                          <asp:Label ID="Street1Label" runat="server" Text='<%# Eval("Street1") %>' />
                          <br />
                          City:
                          <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                          <br />
                          State:
                          <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                          <br />
                          Zip:
                          <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                          <br />
<br /></span>
                      </AlternatingItemTemplate>
                      <EditItemTemplate>
                          <span style="">shipTo:
                          <asp:TextBox ID="shipToTextBox" runat="server" Text='<%# Bind("shipTo") %>' />
                          <br />
                          Street1:
                          <asp:TextBox ID="Street1TextBox" runat="server" Text='<%# Bind("Street1") %>' />
                          <br />
                          City:
                          <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                          <br />
                          State:
                          <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                          <br />
                          Zip:
                          <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                          <br />
                          <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                          <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                          <br /><br /></span>
                      </EditItemTemplate>
                      <EmptyDataTemplate>
                          <span>No data was returned.</span>
                      </EmptyDataTemplate>
                      <InsertItemTemplate>
                          <span style="">shipTo:
                          <asp:TextBox ID="shipToTextBox" runat="server" Text='<%# Bind("shipTo") %>' />
                          <br />Street1:
                          <asp:TextBox ID="Street1TextBox" runat="server" Text='<%# Bind("Street1") %>' />
                          <br />City:
                          <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' />
                          <br />State:
                          <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
                          <br />Zip:
                          <asp:TextBox ID="ZipTextBox" runat="server" Text='<%# Bind("Zip") %>' />
                          <br />
                          <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                          <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                          <br /><br /></span>
                      </InsertItemTemplate>
                      <ItemTemplate>
                          <span style=""><a class="detailLabel">Ship To:</a>
                          <asp:Label ID="shipToLabel" runat="server" Text='<%# Eval("shipTo") %>' />
                          <br />
                          <a class="detailLabel">Street:</a>
                          <asp:Label ID="Street1Label" runat="server" Text='<%# Eval("Street1") %>' />
                          <br />
                          <a class="detailLabel">City:</a>
                          <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                          <br />
                          <a class="detailLabel">State:</a>
                          <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                          <br />
                          <a class="detailLabel">ZipCode:</a>
                          <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                          <br />
<br /></span>
                      </ItemTemplate>
                      <LayoutTemplate>
                          <div id="itemPlaceholderContainer" runat="server" style="">
                              <span runat="server" id="itemPlaceholder" />
                          </div>
                          <div style="">
                          </div>
                      </LayoutTemplate>
                      <SelectedItemTemplate>
                          <span style="">shipTo:
                          <asp:Label ID="shipToLabel" runat="server" Text='<%# Eval("shipTo") %>' />
                          <br />
                          Street1:
                          <asp:Label ID="Street1Label" runat="server" Text='<%# Eval("Street1") %>' />
                          <br />
                          City:
                          <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                          <br />
                          State:
                          <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                          <br />
                          Zip:
                          <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                          <br />
<br /></span>
                      </SelectedItemTemplate>
                  </asp:ListView>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [shipTo], [Street1], [City], [State], [Zip] FROM [OrderShippingDetails] WHERE ([ordId] = @ordId)">
                      <SelectParameters>
                          <asp:SessionParameter Name="ordId" SessionField="Order" Type="String" />
                      </SelectParameters>
                  </asp:SqlDataSource>
                </div>
              </div>
            </div>
              <div class="col-md-4">
                  <div class="listerContainer">
                  <asp:Label ID="Label2" runat="server" Text="Price Details" CssClass="dashHeader"></asp:Label>
                      <div class="mypadding">
                  <asp:ListView ID="ListView3" runat="server" DataSourceID="SqlDataSource3">
                      <AlternatingItemTemplate>
                          <span style=""><a class="detailLabel">Subtotal:</a>
                          <asp:Label ID="subtotalLabel" runat="server" Text='<%# Eval("subtotal") %>' />
                          <br />
                          discount:
                          <asp:Label ID="discountLabel" runat="server" Text='<%# Eval("discount") %>' />
                          <br />
                          tax:
                          <asp:Label ID="taxLabel" runat="server" Text='<%# Eval("tax") %>' />
                          <br />
                          total:
                          <asp:Label ID="totalLabel" runat="server" Text='<%# Eval("total") %>' />
                          <br />
<br /></span>
                      </AlternatingItemTemplate>
                      <EditItemTemplate>
                          <span style=""><a class="detailLabel">Subtotal:</a>
                          <asp:TextBox ID="subtotalTextBox" runat="server" Text='<%# Bind("subtotal") %>' />
                          <br />
                          discount:
                          <asp:TextBox ID="discountTextBox" runat="server" Text='<%# Bind("discount") %>' />
                          <br />
                          tax:
                          <asp:TextBox ID="taxTextBox" runat="server" Text='<%# Bind("tax") %>' />
                          <br />
                          total:
                          <asp:TextBox ID="totalTextBox" runat="server" Text='<%# Bind("total") %>' />
                          <br />
                          <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                          <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                          <br /><br /></span>
                      </EditItemTemplate>
                      <EmptyDataTemplate>
                          <span>No data was returned.</span>
                      </EmptyDataTemplate>
                      <InsertItemTemplate>
                          <span style=""><a class="detailLabel">subtotal:</a>
                          <asp:TextBox ID="subtotalTextBox" runat="server" Text='<%# Bind("subtotal") %>' />
                          <br />discount:
                          <asp:TextBox ID="discountTextBox" runat="server" Text='<%# Bind("discount") %>' />
                          <br />tax:
                          <asp:TextBox ID="taxTextBox" runat="server" Text='<%# Bind("tax") %>' />
                          <br />total:
                          <asp:TextBox ID="totalTextBox" runat="server" Text='<%# Bind("total") %>' />
                          <br />
                          <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                          <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                          <br /><br /></span>
                      </InsertItemTemplate>
                      <ItemTemplate>
                          <span style=""><a class="detailLabel">Subtotal:</a>
                          <asp:Label ID="subtotalLabel" runat="server" Text='<%# Eval("subtotal") %>' />
                          <br />
                          <a class="detailLabel">Discount:</a>
                          <asp:Label ID="discountLabel" runat="server" Text='<%# Eval("discount") %>' />
                          <br />
                          <a class="detailLabel">Tax:</a>
                          <asp:Label ID="taxLabel" runat="server" Text='<%# Eval("tax") %>' />
                          <br />
                          <a class="detailLabel">Total:</a>
                          <asp:Label ID="totalLabel" runat="server" Text='<%# Eval("total") %>' />
                          <br />
<br /></span>
                      </ItemTemplate>
                      <LayoutTemplate>
                          <div id="itemPlaceholderContainer" runat="server" style="">
                              <span runat="server" id="itemPlaceholder" />
                          </div>
                          <div style="">
                          </div>
                      </LayoutTemplate>
                      <SelectedItemTemplate>
                          <span style=""><a class="detailLabel">Subtotal:</a>
                          <asp:Label ID="subtotalLabel" runat="server" Text='<%# Eval("subtotal") %>' />
                          <br />
                          discount:
                          <asp:Label ID="discountLabel" runat="server" Text='<%# Eval("discount") %>' />
                          <br />
                          tax:
                          <asp:Label ID="taxLabel" runat="server" Text='<%# Eval("tax") %>' />
                          <br />
                          total:
                          <asp:Label ID="totalLabel" runat="server" Text='<%# Eval("total") %>' />
                          <br />
<br /></span>
                      </SelectedItemTemplate>
                  </asp:ListView>
                          </div>
                      </div>
                  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT '$' + CONVERT (varchar(12), subtotal, 1) AS subtotal, '$' + CONVERT (varchar(12), discount, 1) AS discount, '$' + CONVERT (varchar(12), tax, 1) AS tax, '$' + CONVERT (varchar(12), total, 1) AS total FROM [Orders] WHERE ([OrderId] = @OrderId)">
                      <SelectParameters>
                          <asp:SessionParameter Name="OrderId" SessionField="Order" Type="Int32" />
                      </SelectParameters>
                  </asp:SqlDataSource>
              </div>
              

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name], CONVERT (varchar, [OrderDate], 101) AS 'OrderDate', [OrderStatus], [Quantity], '$' + CONVERT (varchar(12), [PriceEach], 1) AS PriceEach FROM [User_OrderedProducts] WHERE ([OrderId] = @OrderId)">
        <SelectParameters>
            <asp:SessionParameter Name="OrderId" SessionField="Order" Type="String" />
        </SelectParameters>
                </asp:SqlDataSource>
         </div>
     </div>
</div>
</asp:Content>
