<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Literal ID="LtlUserID" runat="server"></asp:Literal>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="Username" DataSourceID="SqlDataSource1" DefaultMode="Edit">
        <EditItemTemplate>
            Username:
            <asp:Label ID="UsernameLabel1" runat="server" Text='<%# Eval("Username") %>' />
            <br />
            Firstname:
            <asp:TextBox ID="FirstnameTextBox" runat="server" Text='<%# Bind("Firstname") %>' />
            <br />
            Lastname:
            <asp:TextBox ID="LastnameTextBox" runat="server" Text='<%# Bind("Lastname") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
            <br />
            ZipCode:
            <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Username:
            <asp:TextBox ID="UsernameTextBox" runat="server" Text='<%# Bind("Username") %>' />
            <br />
            Firstname:
            <asp:TextBox ID="FirstnameTextBox" runat="server" Text='<%# Bind("Firstname") %>' />
            <br />
            Lastname:
            <asp:TextBox ID="LastnameTextBox" runat="server" Text='<%# Bind("Lastname") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" runat="server" Text='<%# Bind("State") %>' />
            <br />
            ZipCode:
            <asp:TextBox ID="ZipCodeTextBox" runat="server" Text='<%# Bind("ZipCode") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Username:
            <asp:Label ID="UsernameLabel" runat="server" Text='<%# Eval("Username") %>' />
            <br />
            Firstname:
            <asp:Label ID="FirstnameLabel" runat="server" Text='<%# Bind("Firstname") %>' />
            <br />
            Lastname:
            <asp:Label ID="LastnameLabel" runat="server" Text='<%# Bind("Lastname") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            State:
            <asp:Label ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
            <br />
            ZipCode:
            <asp:Label ID="ZipCodeLabel" runat="server" Text='<%# Bind("ZipCode") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Username], [Firstname], [Lastname], [Address], [State], [ZipCode] FROM [Accounts] WHERE ([Username] = @Username)">
        <SelectParameters>
            <asp:SessionParameter Name="Username" SessionField="signedInUser" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>

