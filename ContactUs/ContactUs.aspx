<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs_ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .autostyle1 { 
            margin-top: 5px; 
            margin-left: 5px;
        }
        .autostyle2 {
            margin-left: 39px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">  
         <div class="row">
<!--left section--> <section class="col-lg-5 col-lg-offset-1 col-md-5 col-md-offset-1 col-sm-6 col-xs-12 col-xs-offset-0">
                         <h2 class="text-center heading">Contact Us</h2>                        
                                  <div class="autostyle1">
                                     <label> Name:  </label>
                                     <asp:TextBox ID="txtName" runat="server" value="Name" CssClass="txtboxWidth"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Please include your name."></asp:RequiredFieldValidator>
                                  </div>
                                  <div class="autostyle1">
                                     <label> Email: </label>
                                     <asp:TextBox ID="txtEmail" runat="server" value="Email Address" CssClass="txtboxWidth"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is a required field."></asp:RequiredFieldValidator>
                                  </div>
                                  <div class="autostyle1">
                                     <label class="autostyle2">What is your question/comment regarding? </label>

                                  </div>
                                  <div class="autostyle1">
                                      <label class="autostyle2">  </label>      
                                     <asp:DropDownList ID="DropDownList1" runat="server" CssClass="txtboxWidth">
                                         <asp:ListItem>Question about an order</asp:ListItem>
                                         <asp:ListItem>General comment</asp:ListItem>
                                         <asp:ListItem>Question about a custom cake</asp:ListItem>
                                         <asp:ListItem>Cancel or Postpone order</asp:ListItem>
                                         <asp:ListItem>Products offered</asp:ListItem>
                                      </asp:DropDownList>
                                  </div> 
                                  <div class="autostyle1">
                                     <label class="autostyle2">  </label>
                                     <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="5" CssClass="txtboxWidth" placeholder="Write your comments here"></asp:TextBox>
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtComments" ErrorMessage="Do you really want to submit a blank comment? "></asp:RequiredFieldValidator>
                                  </div>
                                  <div class="autostyle1">
                                      <asp:Button ID="btnSubmitComment" runat="server" Text="Submit Comments" CssClass="submitButton" OnClick="btnSubmitComment_Click"/>
                                  </div>
                    </section>
      
                    
<!--right section--><section class="col-lg-5 col-md-6 col-sm-6 col-xs-12 col-xs-offset-0">
                        <h2 class="text-center heading">Upcoming Events</h2>
                                 <asp:Calendar ID="Calendar1" runat="server" BackColor="White" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" CssClass="calendarSize" Height="300px" Width="100%">
                                       <DayHeaderStyle BackColor="#F1BC75" ForeColor="White" Height="1px" />
                                       <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                                       <OtherMonthDayStyle ForeColor="#999999" />
                                       <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                       <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                                       <TitleStyle BackColor="white" Font-Bold="True" Font-Size="10pt" ForeColor="#D16956" Height="25px" BorderStyle="None" />
                                       <TodayDayStyle BackColor="#F1BC75" ForeColor="White" />
                                       <WeekendDayStyle BackColor="#6FA398" ForeColor="#F2F2F2" HorizontalAlign="Center" />
                                </asp:Calendar>                
                    </section>
        </div>
    </div>
</asp:Content>

