<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Products_Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Product Details</p>
    <p>
        This page will show a breakdown of the cake details along with a larger picture for the cutomer to see.</p>
    <p>
        <asp:FormView ID="FormView1" runat="server">
        </asp:FormView>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>

