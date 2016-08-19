using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Products_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["CakeChoice"] != null)
        {
            int cakeID = (int)Session["CakeChoice"];

            lblCakeID.Text = cakeID.ToString();
        }
    }



    protected void btnAddtoCart_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
        {
            Cake selectedProduct = this.GetSelectedProduct();
            CartItemList cart = CartItemList.GetCart();
            CartItem cartItem = cart[selectedProduct.ProductId];
            if(cartItem==null)
            {    
                cart.AddItem(selectedProduct, Convert.ToInt32(txtQuantity.Text));
            }
            else
            {
                cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
            }
            Response.Redirect("~/Cart/Cart.aspx");
        }
    }
    private Cake GetSelectedProduct()
    {
        DataView productsTable = (DataView)
            SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        DataRowView row = (DataRowView)productsTable[0];
        Cake p = new Cake();
        p.ProductId = row["ProductID"].ToString();
        p.Name = row["Name"].ToString();
        p.Description = row["Description"].ToString();
        p.UnitPrice = (decimal)row["UnitPrice"];
        //p.ImageFile = row["ImageFile"].ToString();
        return p;
    }

}