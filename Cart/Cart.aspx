<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 240px;
            text-align: right;
            font-style: italic;
        }
        .auto-style2 {
            width: 240px;
            text-align: right;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <div class="cartContainer">
            <div class="center-block">


                <div id="cartBackground">
                


            <h1>Shopping Cart</h1>
                <asp:ListBox ID="lstCart" runat="server" CssClass="form-control" Height="118px" Width="373px"></asp:ListBox>
            <div id="cartbuttons">
                <asp:Button ID="btnRemoveCartItem" runat="server" cssClass="profileButton" Text="Remove Item" OnClick="btnRemoveCartItem_Click"/>
                <br />
                <asp:Button ID="btnEmptyCart" runat="server" cssClass="profileButton" Text="Empty Cart" OnClick="btnEmptyCart_Click"/>
                <br />
                <br />

                    <asp:Label ID="lblMessage" runat="server" EnableViewState="False" Font-Italic="True"></asp:Label>

                <br />
                <div id="cartReceiptArea">
                

                    <table class="nav-justified">
                        <tr>
                            <td class="auto-style1">SubTotal:</td>
                            <td> &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblSubtotal" runat="server" Font-Bold="False" Font-Italic="True"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Tax:</td>
                            <td class="auto-style3">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblTax" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Total:</td>
                            <td>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div> <!--receipt area end-->
                <asp:Button ID="btnContinueShopping" runat="server" cssClass="profileButton" Text="Continue Shopping" OnClick="btnContinueShopping_Click"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnCheckOut" runat="server" cssClass="checkOutRed" Text="Check Out" OnClick="btnCheckOut_Click"/>
                <br />
                
            </div>
                <p id="message">

                    &nbsp;</p>
            </div>
        </div>
    </div>




</asp:Content>

