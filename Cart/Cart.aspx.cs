using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

public partial class Cart_Cart : System.Web.UI.Page
{
    private CartItemList cart;
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
        //retrieve cart object from session state on every post back
        cart = CartItemList.GetCart();
        //on initial page load, add cart items to list control
        if (!IsPostBack)
            this.DisplayCart();

        // Cart Summary
        DisplaySummary(cart);

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

    protected void btnRemoveCartItem_Click(object sender, EventArgs e)
    {
        if (cart.Count > 0)
        {
            if (lstCart.SelectedIndex > -1)
            {
                cart.RemoveAt(lstCart.SelectedIndex);
                this.DisplayCart();
            }
        }
        else
        {
            lblMessage.Text = "Please select an item to remove.";
        }

        DisplaySummary(cart);
    }

    protected void btnEmptyCart_Click(object sender, EventArgs e)
    {
        //clear cart and list
        if (cart.Count > 0)
        {
            cart.Clear();
            lstCart.Items.Clear();
        }

        DisplaySummary(cart);
    }

    protected void btnContinueShopping_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Products/Products.aspx");
    }

    protected void btnCheckOut_Click(object sender, EventArgs e)
    {
        string signedInUser = HttpContext.Current.User.Identity.GetUserId();
        //lblMessage.Text = "Sorry, that function isn't working yet.";
        if (cart.Count > 0)
        {
            if (signedInUser != null)
            {
                Response.Redirect("~/Cart/CheckOut.aspx");
            }
            else
            {
                lblMessage.Text = "Please log in first";
            }
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
        for (int i = 0; i < cart.Count; i++)
        {
            lstCart.Items.Add(this.cart[i].Display());
        }
       
    }

    private void DisplaySummary(CartItemList cart) // working now -lg
    {
        decimal subTotal = 0;
        decimal taxRate = 0.07m;
        decimal tax;
        decimal total;
        // Display the summary of price of the ordered items before purchasing
        for (int i = 0; i < cart.Count; i++)
        {
            subTotal += cart[i].Cake.UnitPrice * cart[i].Quantity;
        }
        tax = subTotal * taxRate;
        total = subTotal + tax;

        lblSubtotal.Text = subTotal.ToString("c");
        lblTax.Text = tax.ToString("c");
        lblTotal.Text = total.ToString("c");

    }
}