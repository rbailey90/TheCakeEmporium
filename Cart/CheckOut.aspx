<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="Cart_CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
       <div class="col-lg-11 col-md-11 col-sm-10">
            <p>
            Check Out
                </p><p>
                Put the list here 
                </p><p>
                Gather Customer Info
                </p><p>
                &nbsp;<asp:Button ID="btnContinue" runat="server" OnClick="btnContinue_Click" Text="Continue Shopping" />
                <asp:Button ID="btnPlaceOrder" runat="server" OnClick="btnPlaceOrder_Click" Text="Place Order" />
            </p>
       </div>
    </div>
</asp:Content>

