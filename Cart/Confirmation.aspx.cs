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
            currentOrder = OrderDA.OrderReceipt(orderid);

            Subtotal.Text = (currentOrder.Subtotal).ToString();
            Tax.Text = (currentOrder.Tax).ToString();
            Discount.Text = (currentOrder.Discount).ToString();
            Total.Text = (currentOrder.OrderTotal).ToString();
        }
        //on initial page load, add cart items to list control
        
        //assign values to text boxes

    }
}