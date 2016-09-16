using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int idValue;
        idValue = (int)GridView1.SelectedValue;

        // use Session variable to move choice to detail page
        Session["Order"] = idValue;

        Response.Redirect("~/Manager/DashOrderDetail.aspx");
    }
}