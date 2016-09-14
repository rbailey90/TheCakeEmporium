<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Cart_Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
       <div class ="row">
          <div class="col-lg-6 col-lg-offset-3 col-md-6 col-offset-3 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1" id="receiptBackground">
             <h3 class="text-center">
                 <asp:Label ID="lblConfirmation" runat="server" Text=""></asp:Label> 
             </h3>                 
                 <asp:Label ID="Discount" runat="server" Text="Label"></asp:Label>
                     </br>
                 <asp:Label ID="Subtotal" runat="server" Text="Label"></asp:Label>
                     </br>
                 <asp:Label ID="Tax" runat="server" Text="Label"></asp:Label>
                     </br>
                 <asp:Label ID="Total" runat="server" Text="Label"></asp:Label>
                     </br>
                 <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>          
         </div>    
      </div>
   </div>
</asp:Content>

