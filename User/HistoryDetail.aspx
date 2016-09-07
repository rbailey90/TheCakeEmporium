<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HistoryDetail.aspx.cs" Inherits="User_HistoryDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="lblOrderID" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            OrderId:
            <asp:TextBox ID="OrderIdTextBox" runat="server" Text='<%# Bind("OrderId") %>' />
            <br />
            ProductID:
            <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' />
            <br />
            Quantity:
            <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            PriceEach:
            <asp:TextBox ID="PriceEachTextBox" runat="server" Text='<%# Bind("PriceEach") %>' />
            <br />
            OrderDate:
            <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
            <br />
            OrderStatus:
            <asp:TextBox ID="OrderStatusTextBox" runat="server" Text='<%# Bind("OrderStatus") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            OrderId:
            <asp:TextBox ID="OrderIdTextBox" runat="server" Text='<%# Bind("OrderId") %>' />
            <br />
            ProductID:
            <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>' />
            <br />
            Quantity:
            <asp:TextBox ID="QuantityTextBox" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            PriceEach:
            <asp:TextBox ID="PriceEachTextBox" runat="server" Text='<%# Bind("PriceEach") %>' />
            <br />
            OrderDate:
            <asp:TextBox ID="OrderDateTextBox" runat="server" Text='<%# Bind("OrderDate") %>' />
            <br />
            OrderStatus:
            <asp:TextBox ID="OrderStatusTextBox" runat="server" Text='<%# Bind("OrderStatus") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            OrderId:
            <asp:Label ID="OrderIdLabel" runat="server" Text='<%# Bind("OrderId") %>' />
            <br />
            ProductID:
            <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Bind("ProductID") %>' />
            <br />
            Quantity:
            <asp:Label ID="QuantityLabel" runat="server" Text='<%# Bind("Quantity") %>' />
            <br />
            PriceEach:
            <asp:Label ID="PriceEachLabel" runat="server" Text='<%# Bind("PriceEach") %>' />
            <br />
            OrderDate:
            <asp:Label ID="OrderDateLabel" runat="server" Text='<%# Bind("OrderDate") %>' />
            <br />
            OrderStatus:
            <asp:Label ID="OrderStatusLabel" runat="server" Text='<%# Bind("OrderStatus") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    <br />
    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" Text="Delete Order" />
&nbsp;<asp:Button ID="btnReorder" runat="server" OnClick="btnReorder_Click" Text="Reorder" />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [OrderId], [ProductID], [Quantity], [PriceEach], [OrderDate], [OrderStatus] FROM [OrderDetails] WHERE ([OrderId] = @OrderId)">
        <SelectParameters>
            <asp:SessionParameter Name="OrderId" SessionField="orderselect" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

