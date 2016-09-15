<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Manager_Dashboard" %>

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
            <li class="active"><a href="/Manager/Dashboard.aspx">Customer Orders <span class="sr-only">(current)</span></a></li>
            <li><a href="/Manager/Phonebook.aspx">Customer Info</a></li>
            <li><a href="/Manager/CustomerComments.aspx">Customer Comments</a></li>
            <li></li>
            <li></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="/Manager/Deals.aspx">Manage Deals</a></li>
            <li><a href="/Manager/InventoryManagement.aspx">Inventory Manager</a></li>
            <li><a href="/Manager/SiteAnalytics.aspx">Site Stats</a></li>
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
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" Height="100%" PageSize="25" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Order Date" HeaderText="Order Date" SortExpression="Order Date" ReadOnly="True" />
                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                        <asp:BoundField DataField="Full Name" HeaderText="Full Name" SortExpression="Full Name" ReadOnly="True" />
                        <asp:BoundField DataField="E-Mail Address" HeaderText="E-Mail Address" SortExpression="E-Mail Address" />
                        <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" ReadOnly="True" />
                    </Columns>
                    <EditRowStyle BackColor="#7C6F57" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="False" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="False" ForeColor="White" />
                    <PagerStyle BackColor="#b5c6d7" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />
                </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT CONVERT (varchar, OrderDate, 101) AS 'Order Date', UserName AS Username, Firstname + ' ' + Lastname AS 'Full Name', Email AS 'E-Mail Address', '$' + CONVERT (varchar(12), total, 1) AS Total FROM UserListAndOrders"></asp:SqlDataSource>
         </div>
     </div>
</div>
</asp:Content>
