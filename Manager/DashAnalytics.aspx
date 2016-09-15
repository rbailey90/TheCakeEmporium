<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DashAnalytics.aspx.cs" Inherits="Manager_Dashboard" %>

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
            <li><a href="/Manager/Phonebook.aspx">Customer Info</a></li>
            <li><a href="/Manager/CustomerComments.aspx">Customer Comments</a></li>
            <li></li>
            <li></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="/Manager/Deals.aspx">Current Deals</a></li>
            <li><a href="/Manager/DashInventoryManagement.aspx">Inventory Manager</a></li>
            <li class="active"><a href="/Manager/DashAnalytics.aspx">Site Stats</a></li>
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
<h4 class="sub-header text-center">Site Analytics</h4>
    <div class="table-responsive dataArea">
        <asp:Button ID="btnAnalytics" runat="server" cssClass="profileButton" Text="More Google Analytics" OnClick="btnAnalytics_Click" />
        <br />
        <p>
            <iframe src="https://www.seethestats.com/stats/18141/Pageviews_7284013a4_ctr.html" style="width:120px;height:60px;border:none;" scrolling="no" frameborder="0"></iframe>
            <iframe src="https://www.seethestats.com/stats/18141/TimeOnPage_e50248a24_ctr.html" style="width:120px;height:60px;border:none;" scrolling="no" frameborder="0"></iframe>
            <iframe src="https://www.seethestats.com/stats/18141/TimeOnSite_6f926ce7f_ctr.html" style="width:120px;height:60px;border:none;" scrolling="no" frameborder="0"></iframe>
        </p>
        <p>
            <iframe src="https://www.seethestats.com/stats/18141/PageviewsByCity_ef71846eb_ifr.html" style="width:100%;height:100%;border:none;" scrolling="no" frameborder="0"></iframe>
            <iframe src="https://www.seethestats.com/stats/18141/Pageviews_7284013a4_ifr.html" style="width:100%;height:100%;border:none;" scrolling="no" frameborder="0"></iframe>
            <iframe src="https://www.seethestats.com/stats/18141/Visitors_1735426ff_ifr.html" style="width:100%;height:100%;border:none;" scrolling="no" frameborder="0"></iframe>
            <iframe src="https://www.seethestats.com/stats/18141/Visits_811928198_ifr.html" style="width:100%;height:100%;border:none;" scrolling="no" frameborder="0"></iframe>
        </p>

        </div>

</asp:Content>
