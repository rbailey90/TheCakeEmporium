<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HistoryDetail.aspx.cs" Inherits="User_HistoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="historyContainer">
        
    <asp:Label ID="lblHeader" runat="server" Text="Order Details" CssClass="profileHeader" />
        <div class="padding">
    <asp:Label ID="lblOrderID" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:FormView ID="FormView2" runat="server" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333">
        <EditItemTemplate>
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Quantity:
            <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            Price of Each:
            <asp:TextBox ID="Price_of_EachTextBox" runat="server" Text='<%# Bind("[Price of Each]") %>' />
            <br />
            Order Date:
            <asp:TextBox ID="Order_DateTextBox" runat="server" Text='<%# Bind("[Order Date]") %>' />
            <br />
            Order Status:
            <asp:TextBox ID="Order_StatusTextBox" runat="server" Text='<%# Bind("[Order Status]") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Quantity:
            <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            Price of Each:
            <asp:TextBox ID="Price_of_EachTextBox" runat="server" Text='<%# Bind("[Price of Each]") %>' />
            <br />
            Order Date:
            <asp:TextBox ID="Order_DateTextBox" runat="server" Text='<%# Bind("[Order Date]") %>' />
            <br />
            Order Status:
            <asp:TextBox ID="Order_StatusTextBox" runat="server" Text='<%# Bind("[Order Status]") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Quantity:
            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            Price of Each:
            <asp:Label ID="Price_of_EachLabel" runat="server" Text='<%# Bind("[Price of Each]") %>' />
            <br />
            Order Date:
            <asp:Label ID="Order_DateLabel" runat="server" Text='<%# Bind("[Order Date]") %>' />
            <br />
            Order Status:
            <asp:Label ID="Order_StatusLabel" runat="server" Text='<%# Bind("[Order Status]") %>' />
            <br />
        </ItemTemplate>
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:FormView>
    <br />
    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete Order" ControlStyle-CssClass="btn-dataview" />
&nbsp;<asp:Button ID="btnReorder" runat="server" OnClick="btnReorder_Click" Text="Reorder" ControlStyle-CssClass="btn-edit" />
        </div>
        </div>

&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [OrderId], [ProductID], [Quantity], [PriceEach], [OrderDate], [OrderStatus] FROM [OrderDetails] WHERE ([OrderId] = @OrderId)">
        <SelectParameters>
            <asp:SessionParameter Name="OrderId" SessionField="orderselect" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select 
Name,
Quantity,'$' + CONVERT (varchar(12), [Price of Each], 1) AS 'Price of Each', 
[Order Date], [Order Status]
from orderdetailview where [Order ID]=@orderid and LineID=@lineid">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblOrderID" Name="orderid" PropertyName="Text" />
            <asp:ControlParameter ControlID="lblLineID" Name="lineid" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblLineID" runat="server" Visible="False"></asp:Label>
</asp:Content>

