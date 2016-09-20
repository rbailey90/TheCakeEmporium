<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Deals.aspx.cs" Inherits="Manager_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <link href="../css/dashboard.css" rel="stylesheet" />
<div class="dataBox">
      <div class="DashboardHeader">
        <h3>Site Manager</h3>
    </div>
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li><a href="../Manager/Dashboard.aspx">Customer Orders <span class="sr-only">(current)</span></a></li>
            <li><a href="../Manager/Phonebook.aspx">Customer Info</a></li>
            <li><a href="../Manager/CustomerComments.aspx">Customer Comments</a></li>
            <li></li>
            <li></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li class="active"><a href="../Manager/Deals.aspx">Current Deals</a></li>
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
<h4 class="sub-header text-center">Current Cake Specials</h4>
          <div class="table-responsive dataArea block">
              <div class="centerme">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Width="470px" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="CakeName">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="CakeName" HeaderText="CakeName" SortExpression="CakeName" ReadOnly="True" />
            <asp:BoundField DataField="DiscountAmount" HeaderText="DiscountAmount" SortExpression="DiscountAmount" />
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
                  </div>
   <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [CakeName], [DiscountAmount] FROM [Discounts]"></asp:SqlDataSource>
         </div>
     </div>
</div>
</asp:Content>
