using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Products_Details : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        int daysUntil = getDaysUntilHalloween();
        if (daysUntil <= 31)
        {
            Page.Theme = "halloween";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["CakeChoice"] != null)
        {
            int cakeID = (int)Session["CakeChoice"];

            //lblCakeID.Text = cakeID.ToString();
        }
        else
        {
            Response.Redirect("~/Products/Products.aspx");
        }
    }

    public int getDaysUntilHalloween()
    {
        DateTime todaysDate = new DateTime();
        todaysDate = System.DateTime.Now.Date;
        DateTime halloweenDay = new DateTime(DateTime.Today.Year, 10, 31); //year set to current year so it will constantly update

        TimeSpan t = halloweenDay - todaysDate;
        double daysUntil = t.TotalDays;

        return (int)daysUntil;
    }

    protected void btnAddtoCart_Click(object sender, EventArgs e)
    {
        int quantitySelected;
        try{
                quantitySelected = Convert.ToInt16(txtQuantity.Text);

                if(Page.IsValid)
                {
                    Cake selectedProduct = this.GetSelectedProduct();
                    CartItemList cart = CartItemList.GetCart();
                    CartItem cartItem = cart[selectedProduct.ProductId];


                        int index = 0;
                        int alreadyInCart = 0;
                        if (cart.Count > 0)
                        {
                            while (index != -1)
                            {
                                if (cart.GetProdID(index) == selectedProduct.ProductId)
                                {
                                    alreadyInCart = cart.GetQuantity(index);
                                }
                                index = cart.IndexAdvance(index);
                            }
                        }
                        // checking first to see if we have the amount selected currently on hand
                        if (quantitySelected+alreadyInCart > selectedProduct.OnHand)
                    {
                        lblQuan.Text = "Sorry, we do not have that many on hand.";
                    }
                    else
                    {
                        // if we do, then we can add to cart and redirect to cart
                        if (cartItem == null)
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
        }
        catch (Exception ex)
        {
            lblQuan.Text = "That's not a valid number.";
        }
    }
    private Cake GetSelectedProduct()
    {
        DataView productsTable = (DataView)
            SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        DataRowView row = (DataRowView)productsTable[0];
        Cake p = new Cake();
        //p.ProductId = Convert.ToInt32(row["ProductID"]);
        p.ProductId = row["ProductID"].ToString();
        p.Name = row["Name"].ToString();
        p.Description = row["Description"].ToString();
        p.UnitPrice = (decimal)row["UnitPrice"];
        p.OnHand = (int)row["OnHand"]; // 
        //p.ImageFile = row["ImageFile"].ToString();
        return p;
    }


    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Products/Products.aspx");
    }
}