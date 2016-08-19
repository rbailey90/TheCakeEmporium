using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart_CheckOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnContinue_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Products/Products.aspx");
    }

    protected void btnPlaceOrder_Click(object sender, EventArgs e)
    {
        //Place order 
    }
}