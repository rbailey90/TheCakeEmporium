﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="History.aspx.cs" Inherits="User_History" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="historyContainer">
        
    <asp:Label ID="lblHeader" runat="server" Text="Order Details" CssClass="profileHeader" />
        <div  >
    
    
        
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="OrderAndLine"
        CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" Width="572px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" ControlStyle-CssClass="btn-dataview" ButtonType="Button" >
<ControlStyle CssClass="btn-dataview"></ControlStyle>
            </asp:CommandField>
            <asp:BoundField DataField="OrderAndLine" HeaderText="OrderAndLine" ReadOnly="True" SortExpression="OrderAndLine" Visible="False">
            </asp:BoundField>
            <asp:BoundField DataField="Product ID" HeaderText="Product ID" SortExpression="Product ID" Visible="False">
            </asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Order Date" HeaderText="Order Date" ReadOnly="True" SortExpression="Order Date" >
            <HeaderStyle Wrap="False" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Order Status" HeaderText="Order Status" SortExpression="Order Status" >
            <HeaderStyle Wrap="False" />
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
            <asp:Label ID="lblOrderID" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>
</div>

    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" ></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select OrderAndLine,Userid,Username, [Product ID], Name,Quantity, [Order Date], Total, [Order Status] from orderdetailview where userid=@id"><SelectParameters>
    <asp:SessionParameter Name="id" SessionField="signedinuser" />
    </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>

