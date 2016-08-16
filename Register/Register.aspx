<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register_Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 162px;
        }
        .auto-style2 {
            height: 22px;
        }
        .auto-style3 {
            width: 162px;
            height: 22px;
        }
        .auto-style4 {
            width: 134px;
        }
        .auto-style5 {
            height: 22px;
            width: 134px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Register Here</p>
    <table class="nav-justified">
        <tr>
            <td class="auto-style4">First Name</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtFirstName" runat="server" ValidationGroup="RegisterGroup"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="First Name is Required" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Last Name</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtLastName" runat="server" ValidationGroup="RegisterGroup"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Last Name is Required" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">Email</td>
            <td class="auto-style1">
                <asp:TextBox ID="txtEmail" runat="server" ValidationGroup="RegisterGroup"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Email is Required" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="Use a valid Email" Font-Italic="True" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="RegisterGroup"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Phone Number</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtPhone" runat="server" ValidationGroup="RegisterGroup"></asp:TextBox>
            </td>
            <td class="auto-style2">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone Number is Required" Font-Italic="True" ForeColor="Red" ValidationGroup="RegisterGroup"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Use a valid Phone Number" Font-Italic="True" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}" ValidationGroup="RegisterGroup"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style1">
                <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" ValidationGroup="RegisterGroup" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

