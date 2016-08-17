<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="User_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">    
    <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4">
            <p>
            </p>
             </div>

             <div class="col-sm-4 col-med-4 col-lg-4">
                 <div class="row">
                    <h2 class="form-signin">Please Sign In</h2>
                 </div>
                 <div class="row">
                        <div class="col-md-3">
                            <asp:Label ID="Label3" runat="server" Text="Username:" Font-Bold="True" Font-Size="Large"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:TextBox ID="username" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Username Required" ControlToValidate="password"></asp:RequiredFieldValidator>
                        </div>
                 </div>
                 <div class="row">
                         <div class="col-md-3">
                            <asp:Label ID="Label4" runat="server" Text="Password:" Font-Bold="True" Font-Size="Large"></asp:Label>
                        </div>
                        <div class="col-md-6">
                             <asp:TextBox ID="password" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Password Required" ControlToValidate="password"></asp:RequiredFieldValidator>
                        </div>
                 </div>
                 <div class="row">
                        <div class="col-md-3">
                            
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-lg btn-primary btn-block" Height="50px" Width="200px" OnClick="btnLogin_Click" />
                        </div>
                        <div class="col-md-3">
                             
                        </div>
                 </div>
             </div>
             <div class="col-lg-4 col-med-4 col-sm-4">
             <p>
            </p>
            </div>
        </div>
</div>
</asp:Content>

