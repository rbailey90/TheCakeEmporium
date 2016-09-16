using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Microsoft.AspNet.Identity.EntityFramework;

public partial class User_History : System.Web.UI.Page
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
        var signedInUserId = User.Identity.GetUserId();
        //LtlUserID.Text = signedInUserId;
        Session["signedInUser"] = signedInUserId;

        if (User.Identity.IsAuthenticated)
        {
            SqlDataSource1.SelectCommand = "SELECT OrderDetails.[OrderId] as 'Order ID', Orders.[Username] as 'Username', OrderDetails.[ProductID] as 'Product ID', OrderDetails.[Quantity] as 'Quantity', OrderDetails.[PriceEach] as 'Price of Each', OrderDetails.[OrderDate] as 'Order Date', Orders.[total] as 'Total', OrderDetails.[OrderStatus] as 'Order Status' FROM [OrderDetails] inner join Orders on Orders.OrderId = OrderDetails.OrderId inner join Products on Products.ProductId = OrderDetails.ProductID WHERE Orders.[Username] = '" + Session["signedInUser"] + "'";
        }
        else
        {
            Response.Redirect("~/Default.aspx");
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
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //int orderID = Convert.ToInt16(GridView1.SelectedValue);

        //Response.Redirect("~/User/History.aspx");

        //OrderDA.DeleteOrder(orderID);

        // Redirect User to different page to Delete or Order again
        int idValue;
        idValue = Convert.ToInt16(GridView1.SelectedValue);

        Session["orderselect"] = idValue;
        Response.Redirect("~/User/HistoryDetail.aspx");
    }
}