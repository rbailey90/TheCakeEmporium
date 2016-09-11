using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products_Products : System.Web.UI.Page
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

    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {
        int idValue;
        idValue = (int)GridView2.SelectedValue;

        // use Session variable to move choice to detail page
        Session["CakeChoice"] = idValue;

        Response.Redirect("~/Products/Details.aspx");
    }
}