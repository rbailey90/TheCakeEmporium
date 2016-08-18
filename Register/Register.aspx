<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css"> /* local styles to make the table responsive -beth */
        /* needs some polishing up but otherwise is looking pretty good! -beth */
        .auto-style1 {
            width: 162px;
            margin: 5px 0px 0px 10px;
        }
        .auto-style2 {
            height: 22px;
        }
        .auto-style4 {
            width: 134px;
            min-width: 100px;
            margin: 5px 0px 0px 10px;
        }
        .mainTable {
            max-width: 900px;
            margin-left: 150px;
        }
        @media only screen and (max-width : 920px) { .mainTable {margin-left: 20px;} }
            
        @media only screen and (max-width : 500px) 
        {
           .auto-style4 {
               width: 400px;
               display:block;
               margin-left: 10px;
           }
           .auto-style1 {
               display: inline;
               width: 400px;
               float: left;
               margin-left: 10px;
           }
           .auto-style2 {
               display: inline;
               
               float: left;
               margin-left: 10px;
           }
            #image_med { display: none;}
            #heading { font-size: 1.2em;}
            .mainTable{
                margin-left: 15px;
                margin-left: auto;
                margin-right: auto;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
       <div class="row mainTable">
         <div class="col-lg-10 col-lg-offset-3 col-med-10 col-med-offset-2 col-sm-10 col-sm-offset-1 col-xs-offset-1">
           <h1 id="heading">Register Here</h1>
            <table class="nav-justified">
                <tr>
                     <td class="auto-style4">First Name</td>
                     <td class="auto-style1">
                         <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="RegisterGroup"></asp:TextBox>
                     </td>
                     <td class="auto-style2">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="First Name is Required" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                     </td>
                </tr>
                <tr>
                     <td class="auto-style4">Last Name</td>
                     <td class="auto-style1">
                        <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="RegisterGroup"></asp:TextBox>
                     </td>
                     <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Last Name is Required" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                     </td>
                </tr>
                <tr>
                     <td class="auto-style4">Email</td>
                     <td class="auto-style1">
                         <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="RegisterGroup"></asp:TextBox>
                     </td>
                     <td class="auto-style2">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is Required" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Use a valid Email" Font-Italic="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="RegisterGroup"></asp:RegularExpressionValidator>
                     </td>
                </tr>
                <tr>
                     <td class="auto-style4">Phone Number</td>
                     <td class="auto-style1">
                         <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="RegisterGroup"></asp:TextBox>
                     </td>
                     <td class="auto-style2">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone Number is Required" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Use a valid Phone Number" Font-Italic="True" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="RegisterGroup"></asp:RegularExpressionValidator>
                     </td>
                </tr>
                <tr>
                     <td class="auto-style4">Username</td>
                     <td class="auto-style1">
                         <asp:TextBox ID="txtUsername" runat="server" ValidationGroup="RegisterGroup"></asp:TextBox>
                     </td>
                     <td class="auto-style2">
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtUsername" Display="Dynamic" ErrorMessage="Please choose a username" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                     </td>
                </tr>
                <tr>
                    <td class="auto-style4">Password</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtPassword1" runat="server" TextMode="Password" ValidationGroup="RegisterGroup"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtPassword1" Display="Dynamic" ErrorMessage="Must enter a password" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">Password</td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtPassword2" runat="server" TextMode="Password" ValidationGroup="RegisterGroup"></asp:TextBox>
                    </td>
                    <td class="auto-style2">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtPassword2" Display="Dynamic" ErrorMessage="Must reenter a password" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword1" ControlToValidate="txtPassword2" ErrorMessage="Passwords must match" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td class="auto-style1">
                        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" ValidationGroup="RegisterGroup" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
      </div> <!--end of table container -->
      </div> 
</div> <!--end of fluid container --> 
</asp:Content>

