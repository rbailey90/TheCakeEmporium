<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="Accounts_ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="profileContainer">
        <asp:Label ID="lblHeader" runat="server" Text="Forgot Password" CssClass="profileHeader" />
           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="lblvCode" runat="server" Text="Verification Code"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                   <asp:TextBox ID="txtCode" CssClass="input-sm" runat="server"></asp:TextBox>
               </div>
           </div>
        <br />
           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="lblNpass" runat="server" Text="New Password"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                   <asp:TextBox ID="txtNewPass" CssClass="input-sm" runat="server"></asp:TextBox>
             
               </div>
           </div>
           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="lblconNpass" runat="server" CssClass="labelStyle" Text="Confirm New Password"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                   <asp:TextBox ID="txtNewPassConfirm" CssClass="input-sm" runat="server"></asp:TextBox>
               </div>
           </div>

             
           <div class="form-group">
               <div class="col-md-5 col-sm-5" style="float: left; overflow: hidden;">
                    
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:Button ID="btnResetPass" CssClass="profileButton" runat="server" Text="Change Password" OnClick="btnResetPass_Click"/>
               </div>
               <div class="col-md-3 col-sm-3" style="float: right; overflow: hidden;">
                     
               </div>
           </div>
           <div class="form-group">
               <div class="col-md-7 col-sm-7 text-center">
                    <asp:Literal ID="ltlResult" runat="server"></asp:Literal>
               </div>
           </div>
        </div>
</asp:Content>

