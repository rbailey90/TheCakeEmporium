<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="User_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="profileContainer">
    <asp:Label ID="lblHeader" runat="server" Text="User Registration" CssClass="profileHeader"></asp:Label>
    <div class="loginInnerContainer">

   <div class="rowone" style="width: 450px; height: 40px;">
       <!-- editing here not done yet -->
       <div class="col-md-3">
           <asp:Label ID="LblUsername" runat="server" Text="User Name:"></asp:Label>
       </div>
       <div class="col-md-7">
           <asp:TextBox ID="TxtUserName" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
       <div class="col-md-2">

           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUserName" ErrorMessage="Username Required"></asp:RequiredFieldValidator>
       </div>
   </div>

   <div class="rowone" style="width: 450px; height: 40px;">
       <div class="userpwd" style="float: left; overflow: hidden;">
           <asp:Label ID="LblUserPwd" runat="server" Text="Password:"></asp:Label>
            </div>
       <div class="userpwdinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="TxtUserPassword" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtUserPassword" ErrorMessage="Password Required"></asp:RequiredFieldValidator>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="userconpwd" style="float: left; overflow: hidden;">
           <asp:Label ID="LblConPwd" runat="server" Text="Confirm Password:"></asp:Label>
       </div>
       <div class="userconpwdinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="TxtConfirmPassword" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtConfirmPassword" ErrorMessage="Please Confirm Password"></asp:RequiredFieldValidator>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="LblUseremail" runat="server" Text="E-Mail:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="TxtUserEmail" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtUserEmail" ErrorMessage="E-Mail Required"></asp:RequiredFieldValidator>
       </div>
   </div>
       <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtFirstName" ErrorMessage="First Name Required"></asp:RequiredFieldValidator>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtLastName" ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtAddress" ErrorMessage="Address Required"></asp:RequiredFieldValidator>
       </div>
   </div>
       <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtState" ErrorMessage="State Required"></asp:RequiredFieldValidator>
       </div>
   </div>
   <div class="rowone" style="width: 350px; height: 40px;">
       <div class="username" style="float: left; overflow: hidden;">
           <asp:Label ID="LblZip" runat="server" Text="Zip:"></asp:Label>
       </div>
       <div class="usernameinput" style="float: right; overflow: hidden;">
           <asp:TextBox ID="TxtZip" runat="server" CssClass="form-control"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TxtZip" ErrorMessage="Zip Code Required"></asp:RequiredFieldValidator>
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

