<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="User_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="profileContainer">
    <asp:Label ID="lblHeader" runat="server" Text="User Registration" CssClass="profileHeader"></asp:Label>
    <div class="loginInnerContainer">
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="LblUsername" runat="server" Text="User Name:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="TxtUserName" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="userpwd" style="float: left; overflow: hidden;">
           <asp:Label ID="LblUserPwd" runat="server" Text="Password:"></asp:Label>
            </div>
       <div class="userpwdinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="TxtUserPassword" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="userconpwd" style="float: left; overflow: hidden;">
           <asp:Label ID="LblConPwd" runat="server" Text="Confirm Password:"></asp:Label>
       </div>
       <div class="userconpwdinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="TxtConfirmPassword" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="LblUseremail" runat="server" Text="E-Mail:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="TxtUserEmail" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
   </div>
       <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
   </div>
       <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="LblZip" runat="server" Text="Zip:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="TxtZip" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="userreg" style="float: left; overflow: hidden;">
           <asp:Button ID="BtnRegister" runat="server" Text="Register" OnClick="UserRegistration_Click" cssClass="btn btn-primary btn-lg btn-block" />
       </div>
       <div class="userpwdinput" style="float: right; overflow: hidden;">
           <asp:Label ID="LblMessage" runat="server"></asp:Label>
       </div>
   </div>
   </div>
</div>
</asp:Content>

