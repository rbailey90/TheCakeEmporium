<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HistoryDetail.aspx.cs" Inherits="User_HistoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblOrderID" runat="server" Text="Label" Visible="False"></asp:Label>
    <br />
    <asp:FormView ID="FormView2" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="Order ID,LineID" DataSourceID="SqlDataSource2" GridLines="Horizontal">
        <EditItemTemplate>
            Order ID:
            <asp:Label ID="Order_IDLabel1" runat="server" Text='<%# Eval("[Order ID]") %>' />
            <br />
            LineID:
            <asp:Label ID="LineIDLabel1" runat="server" Text='<%# Eval("LineID") %>' />
            <br />
            Product ID:
            <asp:TextBox ID="Product_IDTextBox" runat="server" Text='<%# Bind("[Product ID]") %>' />
            <br />
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
        <EditRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
        <FooterStyle BackColor="White" ForeColor="#333333" />
        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            Order ID:
            <asp:TextBox ID="Order_IDTextBox" runat="server" Text='<%# Bind("[Order ID]") %>' />
            <br />
            LineID:
            <asp:TextBox ID="LineIDTextBox" runat="server" Text='<%# Bind("LineID") %>' />
            <br />
            Product ID:
            <asp:TextBox ID="Product_IDTextBox" runat="server" Text='<%# Bind("[Product ID]") %>' />
            <br />
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
            Order ID:
            <asp:Label ID="Order_IDLabel" runat="server" Text='<%# Eval("[Order ID]") %>' />
            <br />
            LineID:
            <asp:Label ID="LineIDLabel" runat="server" Text='<%# Eval("LineID") %>' />
            <br />
            Product ID:
            <asp:Label ID="Product_IDLabel" runat="server" Text='<%# Bind("[Product ID]") %>' />
            <br />
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            Quantity:
            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            Price of Each:
            <asp:Label ID="Price_of_EachLabel" runat="server" Text='<%# Bind("[Price of Each]", "{0:C}") %>' />
            <br />
            Order Date:
            <asp:Label ID="Order_DateLabel" runat="server" Text='<%# Bind("[Order Date]") %>' />
            <br />

            Order Status:
            <asp:Label ID="Order_StatusLabel" runat="server" Text='<%# Bind("[Order Status]") %>' />
            <br />
        </ItemTemplate>
        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#333333" />
    </asp:FormView>
    <br />
    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete Order" />
&nbsp;<asp:Button ID="btnReorder" runat="server" OnClick="btnReorder_Click" Text="Reorder" />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [OrderId], [ProductID], [Quantity], [PriceEach], [OrderDate], [OrderStatus] FROM [OrderDetails] WHERE ([OrderId] = @OrderId)">
        <SelectParameters>
            <asp:SessionParameter Name="OrderId" SessionField="orderselect" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select 
[Order ID],LineID,[Product ID],Name,
Quantity,[Price of Each], 
[Order Date], [Order Status]
from orderdetailview where [Order ID]=@orderid and LineID=@lineid">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblOrderID" Name="orderid" PropertyName="Text" />
            <asp:ControlParameter ControlID="lblLineID" Name="lineid" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="lblLineID" runat="server" Visible="False"></asp:Label>
</asp:Content>

