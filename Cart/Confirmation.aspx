<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Cart_Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="container-fluid">
     <div class ="row">
         <div class="text-center"><h3> Thank you for your order! </h3>
             <p class="text-center"> 
                 <asp:Label ID="Subtotal" runat="server" Text="Label"></asp:Label>
             </p>
             <p  class="text-center"> 
                 <asp:Label ID="Discount" runat="server" Text="Label"></asp:Label>
             </p>
             <p  class="text-center"> 
                 <asp:Label ID="Tax" runat="server" Text="Label"></asp:Label>
             </p>
             <p  class="text-center"> 
                 <asp:Label ID="Total" runat="server" Text="Label"></asp:Label>
             </p>
             <p  class="text-center"> 
                 <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
             </p>
         </div>
    </div>
   </div>
</asp:Content>

