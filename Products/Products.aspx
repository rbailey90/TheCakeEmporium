<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container-fluid">
       <div class="product-container cartContainer">
           <br />

           <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" DataKeyNames="ProductId" DataSourceID="SqlDataSource2" GridLines="Horizontal" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
               <Columns>
                   <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                   <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                   <asp:BoundField DataField="UnitPrice" DataFormatString="{0:c}" HeaderText="Price" SortExpression="ProductId" />
                   <asp:ImageField AlternateText="cake image" DataImageUrlField="imagepath">
                       <ControlStyle Height="75px" Width="75px" />
                   </asp:ImageField>
               </Columns>
               <FooterStyle BackColor="White" ForeColor="#333333" />
               <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="White" ForeColor="#333333" />
               <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
               <SortedAscendingCellStyle BackColor="#F7F7F7" />
               <SortedAscendingHeaderStyle BackColor="#487575" />
               <SortedDescendingCellStyle BackColor="#E5E5E5" />
               <SortedDescendingHeaderStyle BackColor="#275353" />
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select products.*, '~/Images/Products/'+Image as imagepath
from Products
"></asp:SqlDataSource>
    <br />
    <br />
        </div>
   </div>
</asp:Content>

