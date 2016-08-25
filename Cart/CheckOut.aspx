<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckOut.aspx.cs" Inherits="Cart_CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 219px;
        }
        .auto-style2 {
            width: 356px;
        }
        .auto-style3 {
            width: 219px;
            height: 22px;
        }
        .auto-style4 {
            width: 356px;
            height: 22px;
        }
        .auto-style5 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
       <div class="col-lg-11 col-md-11 col-sm-10">
            <p>
            Check Out
                </p><p>
                &nbsp;<asp:ListBox ID="lstCart" runat="server" Height="118px" Width="373px"></asp:ListBox>
                </p><p>
                Gather Customer Info
                <table class="nav-justified">
                    <tr>
                        <td class="auto-style3">Ship To:</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtShipTo" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td class="auto-style5"></td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Street Address (line 1):</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtShipAddr1" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Street Address (line 2):</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtShipAddr2" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">City:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtShipCity" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">State: </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtShipState" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Zip:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtShipZip" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Billing Street Address (line 1):</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtBillAddr1" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Street Address (line 2):</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtBillAddr2" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">City</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtBillCity" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">State</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtBillState" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Zip</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtBillZip" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Name on credit or debit card:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtPymtName" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Card number:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtPymtNum" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Expiration date (MMYY):</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtPymtExp" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">CVV:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtPymtCVV" runat="server"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                </p><p>
                &nbsp;<asp:Button ID="btnContinue" runat="server" OnClick="btnContinue_Click" Text="Continue Shopping" />
                <asp:Button ID="btnPlaceOrder" runat="server" OnClick="btnPlaceOrder_Click" Text="Place Order" />
            </p>
       </div>
    </div>
</asp:Content>

