<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="User_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <!--HttpCookie cookie = new HttpCookie("myCookie");
    cookie.Values.Add("UserFirstName", txtFirstName.Text);-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="profileContainer">
<asp:Label ID="lblHeader" runat="server" Text="User Registration" CssClass="profileHeader" />
     <div class="container-fluid">
           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="LblUsername" runat="server" Text="User Name:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                   <asp:TextBox ID="TxtUserName" runat="server" CssClass="form-control"></asp:TextBox>
             
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  CssClass="pull-right" runat="server" ControlToValidate="TxtUserName" ErrorMessage="*Username Required"></asp:RequiredFieldValidator>
                   </div>
               </div>
           </div>


           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="LblUserPwd" runat="server" Text="Password:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="TxtUserPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="pull-right" runat="server" ControlToValidate="TxtUserPassword" ErrorMessage="*Password Required"></asp:RequiredFieldValidator>
                   </div>
               </div>
           </div>

           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                     <asp:Label ID="LblConPwd" runat="server" Text="Confirm Password:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="TxtConfirmPassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
           </div>
            <div class="row">
               <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="pull-right" runat="server" ControlToValidate="TxtConfirmPassword" ErrorMessage="*Please Confirm Password"></asp:RequiredFieldValidator>
               </div>
           </div>

           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="LblUseremail" runat="server" Text="E-Mail:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="TxtUserEmail" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="pull-right" runat="server" ControlToValidate="TxtUserEmail" ErrorMessage="*E-Mail Required" Display="Dynamic"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="pull-right" runat="server" ErrorMessage="Please Enter a Valid E-Mail Address" Display="Dynamic" ControlToValidate="TxtUserEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                   </div>
               </div>
           </div>

           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="lblFirstName" runat="server" Text="First Name:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="pull-right" runat="server" ControlToValidate="txtFirstName" ErrorMessage="*First Name Required"></asp:RequiredFieldValidator>
                   </div>
               </div>
           </div>

           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="lblLastName" runat="server" Text="Last Name:"></asp:Label>     
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="pull-right" runat="server" ControlToValidate="txtLastName" ErrorMessage="*Last Name Required"></asp:RequiredFieldValidator>
                   </div>
                </div>
           </div>

           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="pull-right" runat="server" ControlToValidate="txtAddress" ErrorMessage="*Address Required"></asp:RequiredFieldValidator>
                   </div>
               </div>
           </div>

           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" CssClass="pull-right" ControlToValidate="txtCity" ErrorMessage="*City Required"></asp:RequiredFieldValidator>
                   </div>
               </div>
           </div>

           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="pull-right" ControlToValidate="txtState" ErrorMessage="*State Required"></asp:RequiredFieldValidator>
                   </div>
               </div>
           </div>

           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="LblZip" runat="server" Text="Zip:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="TxtZip" runat="server" CssClass="form-control"></asp:TextBox>
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="pull-right" ControlToValidate="TxtZip" ErrorMessage="*Zip Code Required"></asp:RequiredFieldValidator>
                   </div>
               </div>
           </div>

           <div class="form-group">
               <div class="col-md-5 col-sm-5 text-right" style="float: left; overflow: hidden;">
                    <asp:Label ID="lblDob" runat="server" Text="Date of Birth:"></asp:Label>
               </div>
               <div class="col-md-7 col-sm-7">
                    <asp:TextBox ID="txtDob" runat="server" CssClass="form-control" placeholder="mm/dd/yyyy"></asp:TextBox>
               </div>
               <div class="row">
                   <div class="col-md-12 col-sm-12" style="float: left; overflow: hidden;">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="pull-right" ControlToValidate="txtDob" ErrorMessage="*Date of Birth Required" Display="Dynamic"></asp:RequiredFieldValidator>
<%--                         <asp:RegularExpressionValidator ID="RegularExpressionValidatorDOB" runat="server" CssClass="pull-right" ErrorMessage="*Date must be in MM/DD/YYYY format." ValidationExpression="/^(0[1-9]|1[0-2])\/(0[1-9]|1\d|2\d|3[01])\/(19|20)\d{2}$/" ControlToValidate="txtDob" Display="Dynamic"></asp:RegularExpressionValidator>--%>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidatorDOB" runat="server" CssClass="pull-right" ErrorMessage="*Date must be in MM/DD/YYYY format." ValidationExpression="^\d{1,2}\/\d{1,2}\/\d{4}$" ControlToValidate="txtDob" Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RangeValidator ID="DOBRangeValidator" runat="server" ErrorMessage="RangeValidator" Display="Dynamic" CssClass="pull-right" ControlToValidate="txtDob"></asp:RangeValidator>
                   </div>
               </div>
           </div>

           <div class="form-group">
               <div class="col-md-12 col-sm-12">
                    <asp:Button ID="BtnRegister" runat="server" Text="Register" OnClick="UserRegistration_Click" cssClass="profileButton btn-block" />
               </div>
               <div class="col-md-3 col-sm-3" style="float: right; overflow: hidden;">
                     <asp:Label ID="LblMessage" runat="server"></asp:Label>
               </div>
           </div>
    </div>
</div>
</asp:Content>

