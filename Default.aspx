<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"></asp:Content> 
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
    </div>
</asp:Content>

