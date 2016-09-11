using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

public partial class Cart_CheckOut : System.Web.UI.Page
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
    public int getDaysUntilHalloween()
    {
        DateTime todaysDate = new DateTime();
        todaysDate = System.DateTime.Now.Date;
        DateTime halloweenDay = new DateTime(DateTime.Today.Year, 10, 31); //year set to current year so it will constantly update

        TimeSpan t = halloweenDay - todaysDate;
        double daysUntil = t.TotalDays;

        return (int)daysUntil;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //retrieve cart object from session state on every post back
        cart = CartItemList.GetCart();
        //on initial page load, add cart items to list control
        if (!IsPostBack)
            this.DisplayCart();

        // if user is signed in, populate address on file in check out page for easier check out -lg
        // NOT WORKING 
        //string signedInUser = HttpContext.Current.User.Identity.GetUserName();
        //if(User.Identity.IsAuthenticated)
        //{
        //    //string address = UserDA.getAddress(signedInUser);
        //    //txtBillAddr1.Text = address;
        //    //string state = UserDA.getState(signedInUser);
        //    //txtBillState.Text = state;
        //    //string zip = UserDA.getZip(signedInUser);
        //    //txtBillZip.Text = zip;
        //}
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
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Products/Products.aspx");
    }
    protected void btnSameAddress_Click(object sender, EventArgs e)
    {
        txtBillAddr1.Text = txtShipAddr1.Text;
        txtBillAddr2.Text = txtShipAddr2.Text;
        txtBillCity.Text = txtShipCity.Text;
        txtBillState.Text = txtShipState.Text;
        txtBillZip.Text = txtShipZip.Text;
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        string signedInUser = HttpContext.Current.User.Identity.GetUserId();
        //if user is not null, do this
        if (signedInUser != null)
        {
            //get textbox details
            string shipTo = txtShipTo.Text;
            string shiptoadd1 = txtShipAddr1.Text;
            string shiptoadd2 = txtShipAddr2.Text;
            string shipCity = txtShipCity.Text;
            string shipSt = txtShipState.Text;
            string shipZip = txtShipZip.Text;
            string billAddr1 = txtBillAddr1.Text;
            string billAddr2 = txtBillAddr2.Text;
            string billcity = txtBillCity.Text;
            string billstate = txtBillState.Text;
            string billzip = txtBillZip.Text;

            string card = txtPymtNum.Text;
            string exp = txtPymtExp.Text;
            string cvv = txtPymtCVV.Text;
            string pymtName = txtPymtName.Text;

            //Save to Order object
            Order curOrder = new Order(cart, shipTo, shiptoadd1, shiptoadd2, shipCity, shipSt, shipZip, billAddr1, billAddr2, billcity,
                billstate, billzip, card, exp, cvv, pymtName,signedInUser);

            //calc rest of order details      
           
            curOrder.Discount = curOrder.CalculateDiscount(); //see if this works -b 
            curOrder.Subtotal = curOrder.CalculateSubtotal();
            curOrder.Tax = curOrder.CalculateTax();
            curOrder.OrderTotal = curOrder.TotalOrder();

            
            try   //Place order 
            {
                //save order to DB
                curOrder.SaveOrder(curOrder);

                //save orderID session variable here - b
                Session["OrderIDReciept"] = curOrder.OrderID;

                //reset curOrder & clear listbox
                Order nextOrder = new Order();
                curOrder = nextOrder;
                cart.Clear();

                Response.Redirect("~/Cart/Confirmation.aspx",false);
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }
        }
        else
        {
            lblMessageCO.Text = "Please sign in first.";
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Cart/Cart.aspx");
    }
}