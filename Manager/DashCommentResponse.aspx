<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DashCommentResponse.aspx.cs" Inherits="Manager_Dashboard" %>

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
<h4 class="sub-header text-center">Respond to Customer</h4>
                      <div class="centerme">
                <div class="reponseContainer">


          <div class="table-responsive dataArea">
                <div class="table-responsive dataArea">
                 Send To:
                <asp:Label ID="lblUser" runat="server" Text="Label"></asp:Label>
                <br />
                <br />
                <asp:TextBox ID="txtResponse" runat="server" Height="85px" ValidationGroup="respond" Width="250px" TextMode="MultiLine" Rows="5" CssClass="txtboxWidth"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtResponse" Display="Dynamic" ErrorMessage="You have to enter a response." ValidationGroup="respond"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:Button ID="btnSubmit" runat="server" cssClass="checkOutRed" Text="Respond" ValidationGroup="respond" OnClick="btnSubmit_Click" />
         </div>
</div>
          </div>
</div>


     </div>
</div>
</asp:Content>
