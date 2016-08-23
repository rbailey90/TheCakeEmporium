﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="User_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container-fluid">
   <div>
       <h3>Log In</h3>
       <hr />
 
       <asp:PlaceHolder runat="server" ID="LoginFormHolder" Visible="false">
           <div style="margin-bottom: 10px">
              <asp:Label runat="server" ID="LblUserName">User Name:</asp:Label>
              <div>
                  <asp:TextBox runat="server" ID="TxtUserName" />
              </div>
           </div>
           <div style="margin-bottom: 10px">
              <asp:Label runat="server" ID="LblUserPassword">Password</asp:Label>
              <div>
                  <asp:TextBox runat="server" ID="TxtUserPassword" TextMode="Password" />
              </div>
           </div>
           <div style="margin-bottom: 10px">
              <div>
                  <asp:Button runat="server" OnClick="SignIn_Click" Text="Log in" />
              </div>
           </div>
       </asp:PlaceHolder>
       <asp:PlaceHolder runat="server" ID="LogoutButtonHolder" Visible="false">
           <div>
              <div>
                  <asp:Button runat="server" OnClick="SignOut_Click" Text="Log out" />
              </div>
           </div>
       </asp:PlaceHolder>
           <asp:PlaceHolder runat="server" ID="LoginStatusHolder" Visible="false">
                <p>
                    <asp:Literal runat="server" ID="LtlStatus" />
                </p>
       </asp:PlaceHolder>
   </div>
</div>
</asp:Content>
