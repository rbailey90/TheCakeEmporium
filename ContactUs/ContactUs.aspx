<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style>
        .auto-style1 {
            width: 107px;
        }
        .auto-style2 {
            margin-left: 40px;
        }
        .auto-style3 {
            width: 107px;
            height: 111px;
        }
        .auto-style4 {
            height: 111px;
        }
        .auto-style5 {
            width: 107px;
            height: 45px;
        }
        .auto-style6 {
            height: 45px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">  
         <div class="row">
            <h2 class="text-center heading">Contact Us</h2>
            <section class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
             <table class="nav-justified">
                    <tr> <!--need to still display the table inline in the local style css stuff -beth -->
                        <td></td>
                        <td>
                            <p class="text-center">Hey! Hey, you! Have any questions for us? 
                              Leave 'em in the box below!</p> 
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5"> Your Name:</td>
                        <td class="auto-style6"> <asp:TextBox ID="lblFaqName" runat="server" Height="23px" Width="257px"></asp:TextBox>

                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Email Address:</td>
                        <td>
                            <asp:TextBox ID="TextBox1" runat="server" Height="23px" Width="257px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3"></td>
                        <td class="auto-style4">
                            <asp:TextBox ID="TextBox2" runat="server" Height="120px" Width="257px" ToolTip="Put your thoughts here!">Type your comments here.</asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td class="auto-style2">
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnSubmitFAQ" runat="server" Text="Submit" Width="70px"  />
                        </td>
                    </tr>
                </table>
                <br />
            </section>
            <section class="col-lg-5 col-md-5 col-sm-5">
               <p> other stuff can go here maybe</p>
                <p> 
                    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
               
                </p>
                <p> &nbsp;</p>
            </section>
        </div>
    </div>
</asp:Content>

