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
    protected void Page_Load(object sender, EventArgs e)
    {
        //retrieve cart object from session state on every post back
        cart = CartItemList.GetCart();
        //on initial page load, add cart items to list control
        if (!IsPostBack)
            this.DisplayCart();
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

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        string signedInUser = HttpContext.Current.User.Identity.GetUserId();
        //if user is not null, do this
        //if (signedInUser != null)
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
            curOrder.Tax = curOrder.CalculateTax();
            curOrder.OrderTotal = curOrder.TotalOrder();
            //Place order 
            try
            {
                //save order to DB
                curOrder.SaveOrder(curOrder);
                //reset curOrder & clear listbox
                //curOrder = nextOrder;
                lstCart.Items.Clear();
                lstCart.Items.Add("Order complete. Please enter next order");
            }/*
            catch (EmptyOrderException ex)
            {
                MessageBox.Show(ex.Message);
            } 
            catch (SqlException ex)
            {
                MessageBox.Show("There is a problem connecting or saving to the database. Unable to finish order.");
            }*/
            catch (Exception ex)
            {
                //MessageBox.Show(ex.Message);
            }
        }
        //else
        {
            //Please sign in first.
        }
    }
}