using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products_Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        // get selected value
        int idValue;
        idValue = (int)GridView1.SelectedValue;

        // use Session variable to move choice to detail page
        Session["CakeChoice"] = idValue;

        Response.Redirect("~/Products/Details.aspx");
    }
}