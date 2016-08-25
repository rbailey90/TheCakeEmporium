using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart_Cart : System.Web.UI.Page
{
    private CartItemList cart;

    protected void Page_Load(object sender, EventArgs e)
    {
        //retrieve cart object from session state on every post back
        cart = CartItemList.GetCart();
        //on initial page load, add cart items to list control
        if (!IsPostBack)
            this.DisplayCart();
    }

    protected void btnRemoveCartItem_Click(object sender, EventArgs e)
    {
        if (cart.Count > 0)
        {
            if(lstCart.SelectedIndex>-1)
            {
                cart.RemoveAt(lstCart.SelectedIndex);
                this.DisplayCart();
            }
        }
        else
        {
            lblMessage.Text = "Please select an item to remove.";
        }
    }

    protected void btnEmptyCart_Click(object sender, EventArgs e)
    {
        //clear cart and list
        if (cart.Count > 0)
        {
            cart.Clear();
            lstCart.Items.Clear();
        }
    }

    protected void btnContinueShopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Products/Products.aspx");
        //lblMessage.Text = "Sorry, that function isn't working yet.";
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        //lblMessage.Text = "Sorry, that function isn't working yet.";
        if (cart.Count > 0)
        {
            Response.Redirect("~/Cart/CheckOut.aspx");
        }
        else
        {
            lblMessage.Text = "Please add a cake to your cart first.";
        }
    }

    private void DisplayCart()
    {
        //remove items from listbox
        lstCart.Items.Clear();
        //add each item's display value to the list
        for (int i=0; i<cart.Count; i++)
        {
            lstCart.Items.Add(this.cart[i].Display());
        }
    }
}