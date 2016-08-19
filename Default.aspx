<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
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
    <!-- individual page content goes here --> 
    <div class="container-fluid"> 
        <div class="row"><!--start of fotorama image carousel here --> 
            <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
                <div class="fotorama"  data-width="100%" data-ratio="800/350" data-fit="cover" data-autoplay="true" data-stopautoplayontouch="true">
                     <img src="Images/german-choc.jpg" data-fit="cover"/>
                     <img src="Images/lemoncake.jpg"  data-fit="cover"/>
	            </div><!-- data height might be messing up the media query height - can fix later if this is a problem-->
            </div>
        </div> <!--end of fotorama row data -->
        <div class="row" id="featured"><!-- start of next section on the homepage -->
            <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
                <section class="col-lg-3 col-md-3 col-sm-3 ">
                    <img src="Images/german-choc.jpg" class="img-thumbnail"/>
                    <aside> This is a caption that will be a label with info from the database.</aside>
                </section>
                <section class="col-lg-3 col-md-3 col-sm-3 ">
                    <img src="Images/german-choc.jpg"  class="img-thumbnail"/>
                    <aside> This is a caption that will be a label with info from the database.</aside>
                </section>
                <section class="col-lg-3 col-md-3 col-sm-3 ">
                    <img src="Images/german-choc.jpg"  class="img-thumbnail"/>
                    <aside> This is a caption that will be a label with info from the database.</aside>
                </section>
                <section class="col-lg-3 col-md-3  col-sm-3 ">
                    <img src="Images/german-choc.jpg"  class="img-thumbnail"/>
                    <aside> This is a caption that will be a label with info from the database.</aside>
                </section>
             </div>
        </div> <!-- end of thumbnail image section on the homepage -->
        <div class="row">
            <section class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-5 col-sm-offset-1">
                

                <table class="nav-justified">
                    <tr> <!--need to still display the table inline in the local style css stuff -beth -->
                        <td></td>
                        <td>
                            <p>Hey! Hey, you! Have any questions for us? 
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
                            <asp:Button ID="btnSubmitFAQ" runat="server" Text="Submit" Width="70px" OnClick="btnSubmitFAQ_Click" />
                        </td>
                    </tr>
                </table>
                <br />
            </section>
            <section class="col-lg-5 col-md-5 col-sm-5">
                anywhere the wind bloooows id doesn't really mmaaaaaaatttteerrrr toooo meeeeee

            </section>
        </div>
   </div> <!-- end of fluid container --> 
</asp:Content>

