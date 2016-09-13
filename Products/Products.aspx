<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products_Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       <div class="productContainer">
           <asp:Label ID="lblHeader" runat="server" Text="Cake Listing" CssClass="productHeader" />
           <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ProductId" DataSourceID="SqlDataSource2" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" Width="125%">
               <AlternatingRowStyle BackColor="White" />
               <Columns>
                   <asp:CommandField ButtonType="Link" ShowSelectButton="True" ControlStyle-CssClass="btn-dataview" >

<ControlStyle CssClass="btn-dataview"></ControlStyle>

                   </asp:CommandField>
                   <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" ControlStyle-CssClass="productNameField" ItemStyle-CssClass="productNameField" />
                   <asp:BoundField DataField="UnitPrice" DataFormatString="{0:c}" HeaderText="Price" SortExpression="ProductId" ItemStyle-CssClass="productNameField" />
                   <asp:ImageField AlternateText="cake image" DataImageUrlField="imagepath" ItemStyle-HorizontalAlign="Right">
                       <ControlStyle Height="75px" Width="75px" />
                   </asp:ImageField>
               </Columns>

               <EditRowStyle BackColor="#7C6F57" />
               <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />

               <RowStyle BackColor="#E3EAEB" ForeColor="White"  />
               <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="White" />
               <SortedAscendingCellStyle BackColor="#F8FAFA" />
               <SortedAscendingHeaderStyle BackColor="#246B61" />
               <SortedDescendingCellStyle BackColor="#D4DFE1" />
               <SortedDescendingHeaderStyle BackColor="#15524A" />
           </asp:GridView>
           <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="select products.*, '~/Images/Products/'+Image as imagepath
from Products
"></asp:SqlDataSource>
    <br />
    <br />
</div>

</asp:Content>

