<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">  
         <div class="row">
<!--left section--> <section class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-6 col-xs-12 col-xs-offset-0">
                         <h2 class="text-center heading">Contact Us</h2> 
                        
                             
                                  <div class="col-md-12">
                                     <label>Email:</label>
                                     <asp:TextBox ID="TextBox1" runat="server" placeholder="Your name" CssClass="txtboxWidth"></asp:TextBox>
                                  </div>
                            
                    </section>
                        <%-- <table class="">
                             <tr class="col-lg-5 col-md-5 col-sm-5">
                                <td class="col-sm-12 col-sm-12"> Your Name: </td>
                                <td class="col-sm-12 col-xs-12"><asp:TextBox ID="TextBox1" runat="server" placeholder="Your name" width="200px"></asp:TextBox></td> 
                             </tr>
                             <tr>
                                
                             </tr>
                         </table>--%>
                    
<!--right section--><section class="col-lg-5 col-md-6 col-sm-6 col-xs-12 col-xs-offset-0">
                        <h2 class="text-center heading">Upcoming Events</h2>
                                 <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" CssClass="calendarSize" Height="300px" Width="100%">
                                       <DayHeaderStyle BackColor="#F1BC75" ForeColor="White" Height="1px" />
                                       <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                       <OtherMonthDayStyle ForeColor="#999999" />
                                       <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                       <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                       <TitleStyle BackColor="#D16956" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                                       <TodayDayStyle BackColor="#F1BC75" ForeColor="White" />
                                       <WeekendDayStyle BackColor="#6FA398" ForeColor="#F2F2F2" HorizontalAlign="Center" />
                                </asp:Calendar>                
                    </section>
        </div>
    </div>
</asp:Content>

