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
                DisplaySummary(cart);
            }
            else
            {
                lblMessage.Visible = true;
                lblMessage.Font.Size = 14;
                lblMessage.Text = "*Please select an item to remove.";
            }
        }
        else
        {
            lblMessage.Visible = true;
            lblMessage.Font.Size = 14;
            lblMessage.Text = "*Please select an item to remove.";
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
        decimal discountAmount = 0;
        decimal taxRate = 0.07m;
        decimal tax;
        decimal total;
        // Display the summary of price of the ordered items before purchasing
        for (int i = 0; i < cart.Count; i++)
        {
            subTotal += cart[i].Cake.UnitPrice * cart[i].Quantity;
        }
        //i have it set up to match the checkout receipt: subtotal minus discount amount, calculate tax, then display total. -b
        discountAmount = CalculateDiscount(cart);
        subTotal = subTotal - discountAmount;
        tax = subTotal * taxRate;
        total = subTotal + tax;

        lblDiscount.Text = discountAmount.ToString("c");
        lblSubtotal.Text = subTotal.ToString("c");
        lblTax.Text = tax.ToString("c");
        lblTotal.Text = total.ToString("c");
    }

    public decimal CalculateDiscount(CartItemList cart)
    {
        DiscountDA discount = new DiscountDA();

        List<string> cakeNames = new List<string>();
        List<decimal> cakeDiscount = new List<decimal>();

        cakeNames = discount.getDiscountCakeName(); 
        cakeDiscount = discount.getDiscountCakeAmount(); 

        decimal amountOfDiscount = 0;
        for (int x = 0; x < cart.Count; x++)
        {
            string selectedCakeName = cart.GetNameOfCake(x);
            int counter = 0;
            while (counter < cakeNames.Count)
            {
                if (selectedCakeName == cakeNames[counter]) 
                {
                    decimal discountAmount = cakeDiscount[counter];
                    amountOfDiscount += cart.DiscountAmountForSummary(discountAmount, x);
                    counter = cakeNames.Count;
                }
                else
                {
                    counter++;
                }
            }
        }
        return amountOfDiscount;
    }
}