<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div class="cartContainer">
            <div class="center-block">


            <h1>Shopping Cart</h1>
                <asp:ListBox ID="lstCart" runat="server" CssClass="form-control" Height="118px" Width="373px"></asp:ListBox>
            <div id="cartbuttons">
                <asp:Button ID="btnRemoveCartItem" runat="server" cssClass="profileButton" Text="Remove Item" OnClick="btnRemoveCartItem_Click"/>
                <asp:Button ID="btnEmptyCart" runat="server" cssClass="profileButton" Text="Empty Cart" OnClick="btnEmptyCart_Click"/><br />
            </div>
            <div id="shopbuttons">
                <asp:Button ID="btnContinueShopping" runat="server" cssClass="profileButton" Text="Continue Shopping" OnClick="btnContinueShopping_Click"/>
                <asp:Button ID="btnCheckOut" runat="server" cssClass="profileButtonRed" Text="Check Out" OnClick="btnCheckOut_Click"/><br />
            </div>
            <p id="message">

                <asp:Label ID="lblMessage" runat="server" EnableViewState="False"></asp:Label>

            </p>


        </div>
    </div>




</asp:Content>

