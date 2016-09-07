using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_HistoryDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["orderselect"] != null)
        {
            int orderID = Convert.ToInt16(Session["orderselect"]);
            lblOrderID.Text = orderID.ToString();


        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int orderID = Convert.ToInt16(Session["orderselect"]);

        OrderDA.DeleteOrder(orderID);

        Response.Redirect("~/User/History.aspx");
    }

    protected void btnReorder_Click(object sender, EventArgs e)
    {
        int orderID = Convert.ToInt16(Session["orderselect"]);

        OrderDA.DeleteOrder(orderID);
    }
}