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
        <div class="wrapper">
        
        <!--start of fotorama image carousel here --> 
        <div class="row">
            <div class="col-md-2"></div>
                    <div class="col-md-8"><div class="fotorama"  data-width="100%" data-ratio="900/400" data-fit="cover" data-autoplay="true" data-stopautoplayontouch="true">
                         <img src="Images/HomepageImages/chocolatehalloweencake.png" data-fit="cover"/>
                         <img src="Images/HomepageImages/christmasicecreampudding.png"  data-fit="cover"/>
                         <img src="Images/HomepageImages/hummingbird.png" data-fit="cover"/>
                         <img src="Images/HomepageImages/strawberrycake.png" data-fit="cover" />
	                </div><!-- data height might be messing up the media query height - can fix later if this is a problem-->
                </div>
            <div class="col-md-2"></div>
        </div> 
        <!--end of fotorama row data -->

        <!-- put messages/ text/ description of site and birthday text label here -->
        <div class="row">
            <h1 class="text-center"> 
                <asp:Label ID="lblWelcomeMessage" runat="server" SkinID="birthdayWelcome" Text="Welcome to The Cake Emporium!" Font-Names="Helvetica"></asp:Label>     
            </h1>
            <h3 class="text-center">
                 <asp:Label ID="lblSecondaryMessage" runat="server" Text=""></asp:Label>
            </h3>
        </div>
        <!-- start of featured products section on the homepage -->
            <div class="row" id="featured">
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Name], [Description], [Image], [UnitPrice] FROM [Products]"></asp:SqlDataSource>
              <div class="">
                   <section class="col-lg-3 col-md-3 col-sm-6 text-center">
                       <asp:Image ID="Image1" runat="server" ImageUrl="Images/Products/confetticake.png" Cssclass="img-thumbnail"/>
                       <aside><asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Medium" Font-Bold="true" ></asp:Label></aside>
                   </section>
                   <section class="col-lg-3 col-md-3 col-sm-6 text-center">
                       <asp:Image ID="Image2" runat="server" ImageUrl="Images/Products/hummingbird.png" Cssclass="img-thumbnail"/>
                       <aside><asp:Label ID="Label2" runat="server" Text="Label" Font-Size="Medium" Font-Bold="true"></asp:Label></aside>
                   </section>
                   <section class="col-lg-3 col-md-3 col-sm-6 text-center">
                       <asp:Image ID="Image3" runat="server" ImageUrl="Images/Products/lemoncake.png" Cssclass="img-thumbnail"/>
                       <aside><asp:Label ID="Label3" runat="server" Text="Label" Font-Size="Medium" Font-Bold="true"></asp:Label></aside>
                   </section>
                   <section class="col-lg-3 col-md-3  col-sm-6 text-center">
                       <asp:Image ID="Image4" runat="server" ImageUrl="Images/Products/matchacake.png" Cssclass="img-thumbnail" />
                       <aside><asp:Label ID="Label4" runat="server" Text="Label" Font-Size="Medium" Font-Bold="true"></asp:Label></aside>
                   </section>
             </div>
        </div> <!-- end of thumbnail image section on the homepage -->
       
       </div>
   </div> <!-- end of fluid container --> 
</asp:Content>

