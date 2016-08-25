<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div class="container-fluid">
            <div class="center-block">


            <p>Shopping Cart</p>
                <asp:ListBox ID="lstCart" runat="server" Height="118px" Width="373px"></asp:ListBox>
            <div id="cartbuttons">
                <asp:Button ID="btnRemoveCartItem" runat="server" Text="Remove Item" OnClick="btnRemoveCartItem_Click"  CssClass="button"/>
                <asp:Button ID="btnEmptyCart" runat="server" Text="Empty Cart" OnClick="btnEmptyCart_Click" CssClass="button"/><br>
            </div>
            <div id="shopbuttons">
                <asp:Button ID="btnContinueShopping" runat="server" Text="Continue Shopping" OnClick="btnContinueShopping_Click" CssClass="button"/>
                <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" CssClass="button"/><br>
            </div>
            <p id="message">

                <asp:Label ID="lblMessage" runat="server" Text="Label" EnableViewState="False"></asp:Label>

            </p>


        </div>
    </div>




</asp:Content>

