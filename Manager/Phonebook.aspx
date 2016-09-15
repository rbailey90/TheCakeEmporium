<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Phonebook.aspx.cs" Inherits="Manager_Dashboard" %>

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
            <li><a href="/Manager/Dashboard.aspx">Customer Orders <span class="sr-only">(current)</span></a></li>
            <li class="active"><a href="/Manager/Phonebook.aspx">Customer Info</a></li>
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
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" AllowPaging="True" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Firstname" HeaderText="Firstname" SortExpression="Firstname" />
            <asp:BoundField DataField="lastname" HeaderText="lastname" SortExpression="lastname" />
            <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
            <asp:BoundField DataField="Birthday" HeaderText="Birthday" SortExpression="Birthday" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserName], [Email], [Firstname], [lastname], [address], [City], [state], [ZipCode], [PhoneNumber], [Birthday] FROM [UserInformation]"></asp:SqlDataSource>
         </div>
     </div>
</div>
</asp:Content>
