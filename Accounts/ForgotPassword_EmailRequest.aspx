<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword_EmailRequest.aspx.cs" Inherits="Accounts_ForgotPassword_EmailRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid text-center">
        <asp:Label ID="Label1" runat="server" Text="E-Mail Address:"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
        <asp:Button ID="btnSendRequest" runat="server" Text="Send Request" OnClick="btnSendRequest_Click" />
        <asp:Literal ID="ltlResult" runat="server"></asp:Literal>
    </div>

</asp:Content>

