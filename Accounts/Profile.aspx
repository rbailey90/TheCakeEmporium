<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row">
<div class="col-md-6">
    <div class="profileContainer pull-right">

    <asp:Label ID="lblHeader" runat="server" Text="Profile Information" CssClass="profileHeader"></asp:Label>
    <asp:FormView ID="FormView1" cssclass="auto-style2" runat="server" DataKeyNames="Username" DataSourceID="SqlDataSource1" DefaultMode="Edit" BackColor="White" BorderWidth="0px" CellPadding="25" Height="300px" HorizontalAlign="Center" Width="300px" ForeColor="White">
        <EditItemTemplate>
            Firstname:
            <asp:TextBox ID="FirstnameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Firstname") %>' />
            <br />
            Lastname: 
            <asp:TextBox ID="LastnameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Lastname") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" CssClass="form-control" runat="server" Text='<%# Bind("State") %>' />
            <br />
            ZipCode:
            <asp:TextBox ID="ZipCodeTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ZipCode") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" CssClass="btn btn-primary btn-lg btn-block" runat="server" CausesValidation="True" CommandName="Update" Text="Update" OnClick="UpdateButton_Click"/>
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" CssClass="btn btn-default btn-lg btn-block" runat="server" OnClick="CancelButton_Click" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="White" Font-Bold="True" ForeColor="#333333" HorizontalAlign="Left" Wrap="True" CssClass="profileEditRow" />
        <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
        <HeaderStyle Font-Bold="True" ForeColor="White" Font-Size="Large" HorizontalAlign="Center" CssClass="profileHeader" Wrap="True" />
        <InsertItemTemplate>
            Username:
            <asp:TextBox ID="UsernameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Username") %>' />
            <br />
            Firstname:
            <asp:TextBox ID="FirstnameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Firstname") %>' />
            <br />
            Lastname:
            <asp:TextBox ID="LastnameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Lastname") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            State:
            <asp:TextBox ID="StateTextBox" CssClass="form-control" runat="server" Text='<%# Bind("State") %>' />
            <br />
            ZipCode:
            <asp:TextBox ID="ZipCodeTextBox" CssClass="form-control" runat="server" Text='<%# Bind("ZipCode") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <InsertRowStyle Wrap="True" />
        <ItemTemplate>
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
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"/>
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />

        </ItemTemplate>
        <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
        <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" CssClass="profileEditRow" />
    </asp:FormView>
    <br />
    </div>
</div>
<div class="col-md-6">
    <div class="profileContainer pull-left">
    <asp:Label ID="Label1" runat="server" Text="Secure Information" CssClass="profileHeader"></asp:Label>
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="Id" HorizontalAlign="Center" Width="300px" DataSourceID="SqlDataSourceAspUserDB" DefaultMode="Edit">
            <EditItemTemplate>
                UserName:
                <asp:TextBox ID="UserNameTextBox" CssClass="form-control" runat="server" Text='<%# Bind("UserName") %>' />
                <br />
                New Password:
                <asp:TextBox ID="NewPasswordBox" CssClass="form-control" runat="server" />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" CssClass="form-control" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                PhoneNumber:
                <asp:TextBox ID="PhoneNumberTextBox" CssClass="form-control" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" CssClass="btn btn-primary btn-lg btn-block" runat="server" CausesValidation="True" CommandName="Update" Text="Update"  OnClick="EditButton_Click" />
              
            </EditItemTemplate>
            <InsertItemTemplate>
                UserName:
                <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' />
                <br />
                New Password:
                <asp:TextBox ID="NewPasswordBox" runat="server" Text='<%# Bind("Password") %>' />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                EmailConfirmed:
                <asp:CheckBox ID="EmailConfirmedCheckBox" runat="server" Checked='<%# Bind("EmailConfirmed") %>' />
                <br />
                PhoneNumber:
                <asp:TextBox ID="PhoneNumberTextBox" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                <br />
                Id:
                <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                UserName:
                <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                <br />
                New Password:
                <asp:Label ID="NewPasswordBox" runat="server" />
                <br />
                Email:
                <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                PhoneNumber:
                <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Bind("PhoneNumber") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
        <br />
     </div>
</div>
</div>

        <asp:SqlDataSource ID="SqlDataSourceAspUserDB" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserName], [Email], [EmailConfirmed], [PhoneNumber], [Id] FROM [AspNetUsers] WHERE ([Id] = @Id)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [AspNetUsers] WHERE [Id] = @original_Id AND [UserName] = @original_UserName AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [EmailConfirmed] = @original_EmailConfirmed AND (([PhoneNumber] = @original_PhoneNumber) OR ([PhoneNumber] IS NULL AND @original_PhoneNumber IS NULL))" InsertCommand="INSERT INTO [AspNetUsers] ([UserName], [Email], [EmailConfirmed], [PhoneNumber], [Id]) VALUES (@UserName, @Email, @EmailConfirmed, @PhoneNumber, @Id)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [AspNetUsers] SET [UserName] = @UserName, [Email] = @Email, [EmailConfirmed] = @EmailConfirmed, [PhoneNumber] = @PhoneNumber WHERE [Id] = @original_Id AND [UserName] = @original_UserName AND (([Email] = @original_Email) OR ([Email] IS NULL AND @original_Email IS NULL)) AND [EmailConfirmed] = @original_EmailConfirmed AND (([PhoneNumber] = @original_PhoneNumber) OR ([PhoneNumber] IS NULL AND @original_PhoneNumber IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Id" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_EmailConfirmed" Type="Boolean" />
                <asp:Parameter Name="original_PhoneNumber" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="EmailConfirmed" Type="Boolean" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="Id" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="Id" SessionField="signedInUser" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="EmailConfirmed" Type="Boolean" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="original_Id" Type="String" />
                <asp:Parameter Name="original_UserName" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
                <asp:Parameter Name="original_EmailConfirmed" Type="Boolean" />
                <asp:Parameter Name="original_PhoneNumber" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [Username], [Firstname], [Lastname], [Address], [State], [ZipCode] FROM [Accounts] WHERE ([Username] = @Username)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Accounts] WHERE [Username] = @original_Username AND [Firstname] = @original_Firstname AND [Lastname] = @original_Lastname AND [Address] = @original_Address AND [State] = @original_State AND [ZipCode] = @original_ZipCode" InsertCommand="INSERT INTO [Accounts] ([Username], [Firstname], [Lastname], [Address], [State], [ZipCode]) VALUES (@Username, @Firstname, @Lastname, @Address, @State, @ZipCode)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Accounts] SET [Firstname] = @Firstname, [Lastname] = @Lastname, [Address] = @Address, [State] = @State, [ZipCode] = @ZipCode WHERE [Username] = @original_Username AND [Firstname] = @original_Firstname AND [Lastname] = @original_Lastname AND [Address] = @original_Address AND [State] = @original_State AND [ZipCode] = @original_ZipCode">
        <DeleteParameters>
            <asp:Parameter Name="original_Username" Type="String" />
            <asp:Parameter Name="original_Firstname" Type="String" />
            <asp:Parameter Name="original_Lastname" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Username" Type="String" />
            <asp:Parameter Name="Firstname" Type="String" />
            <asp:Parameter Name="Lastname" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:SessionParameter Name="Username" SessionField="signedInUser" DefaultValue="signedInUser" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Firstname" Type="String" />
            <asp:Parameter Name="Lastname" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="State" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="original_Username" Type="String" />
            <asp:Parameter Name="original_Firstname" Type="String" />
            <asp:Parameter Name="original_Lastname" Type="String" />
            <asp:Parameter Name="original_Address" Type="String" />
            <asp:Parameter Name="original_State" Type="String" />
            <asp:Parameter Name="original_ZipCode" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
</asp:Content>
