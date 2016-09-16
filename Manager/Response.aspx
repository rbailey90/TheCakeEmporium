<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Response.aspx.cs" Inherits="Manager_Response" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblUser" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <asp:TextBox ID="txtResponse" runat="server" Height="85px" ValidationGroup="respond" Width="300px"></asp:TextBox>
    <br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtResponse" Display="Dynamic" ErrorMessage="You have to enter a response." ValidationGroup="respond"></asp:RequiredFieldValidator>
    <br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Respond" ValidationGroup="respond" />
</asp:Content>

