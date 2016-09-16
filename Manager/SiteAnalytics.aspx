<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SiteAnalytics.aspx.cs" Inherits="Manager_SiteAnalytics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="analyticsContainer">
        <p>
            <h1>Site Analytics</h1>
        <p>
            <asp:Button ID="btnAnalytics" runat="server" cssClass="profileButton" Text="More Google Analytics" OnClick="btnAnalytics_Click" />
            <asp:Button ID="btnBack" runat="server" cssClass="profileButton" OnClick="btnBack_Click" Text="Back" />
        </p><br />
        </p>
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

