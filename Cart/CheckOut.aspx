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
        .auto-style6 {
            width: 219px;
            height: 40px;
        }
        .auto-style7 {
            width: 356px;
            height: 40px;
        }
        .auto-style8 {
            height: 40px;
        }
        .auto-style9 {
            width: 219px;
            height: 24px;
        }
        .auto-style10 {
            width: 356px;
            height: 24px;
        }
        .auto-style11 {
            height: 24px;
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
                        <td class="auto-style5">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtShipTo" ErrorMessage="Please enter the recipient's name."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Street Address (line 1):</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtShipAddr1" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtShipAddr1" ErrorMessage="Please enter the street address to ship to."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Street Address (line 2):</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtShipAddr2" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style9">City:</td>
                        <td class="auto-style10">
                            <asp:TextBox ID="txtShipCity" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td class="auto-style11">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtShipCity" ErrorMessage="Please enter the city to ship to."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">State: </td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtShipState" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtShipState" ErrorMessage="Please enter the state to ship to."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Zip:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtShipZip" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtShipZip" ErrorMessage="Please enter the zip code to ship to."></asp:RequiredFieldValidator>
                        </td>
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
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBillAddr1" ErrorMessage="Please enter the billing street address for the credit or debit card."></asp:RequiredFieldValidator>
                        </td>
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
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtBillCity" ErrorMessage="Please enter the billing city for the credit or debit card."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">State</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtBillState" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtBillState" ErrorMessage="Please enter the billing state for the credit or debit card."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Zip</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtBillZip" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtBillZip" ErrorMessage="Please enter the billing zip code for the credit or debit card."></asp:RequiredFieldValidator>
                        </td>
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
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtPymtName" ErrorMessage="Please enter the name as it appears on the card."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style6">Card number:</td>
                        <td class="auto-style7">
                            <asp:TextBox ID="txtPymtNum" runat="server" Width="333px"></asp:TextBox>
                        </td>
                        <td class="auto-style8">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtPymtNum" Display="Dynamic" ErrorMessage="Please enter your credit or debit card number."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPymtNum" Display="Dynamic" ErrorMessage="Please confirm your credit or debit card number." ValidationExpression="\d{13,19}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Expiration date (MMYY):</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtPymtExp" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtPymtExp" Display="Dynamic" ErrorMessage="Please enter the expiration date."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPymtExp" Display="Dynamic" ErrorMessage="Please enter your expiration date." ValidationExpression="^(0[1-9]|1[0-2])[0-9][0-9]$"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">CVV:</td>
                        <td class="auto-style2">
                            <asp:TextBox ID="txtPymtCVV" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtPymtCVV" Display="Dynamic" ErrorMessage="Please enter your card's CVV from the back of the card."></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPymtCVV" Display="Dynamic" ErrorMessage="Please enter your card's CVV from the back of the card. It should be 3-4 digits." ValidationExpression="\d{3,4}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
                </p><p>
                &nbsp;<asp:Button ID="btnPlaceOrder" runat="server" OnClick="btnPlaceOrder_Click" Text="Place Order" />
            </p>
       </div>
    </div>
</asp:Content>

