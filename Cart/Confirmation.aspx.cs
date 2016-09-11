using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart_Confirmation : System.Web.UI.Page
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
        Order currentOrder;
        //retrieve cart object from session state on every post back
        if (Session["OrderIDReciept"] != null)
        {
            string orderid = Session["OrderIDReciept"].ToString();
            currentOrder = OrderDA.OrderReceipt(orderid); //pull receipt from DB

            string subtotal = String.Format("ORDER SUBTOTAL: ${0:C}", Math.Round((currentOrder.Subtotal), 2).ToString());
            string tax = String.Format("TAX: ${0:C}", Math.Round((currentOrder.Tax),2).ToString());
            string discount = String.Format("APPLIED DISCOUNTS:  ${0:C} saved on your order today",Math.Round((currentOrder.Discount),2).ToString());
            string total = String.Format("ORDER TOTAL:  ${0:C}", Math.Round((currentOrder.OrderTotal),2).ToString());

            Subtotal.Text = subtotal;
            Tax.Text = tax;
            Discount.Text = discount;
            Total.Text = total;

            Label5.Text = "*An email confirmation will be sent when your order is ready to be picked up";
        }
        //on initial page load, add cart items to list control
        
        //assign values to text boxes

    }
}