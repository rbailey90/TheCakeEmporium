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
            int boltID = (int)Session["orderselect"];
            lblOrderID.Text = boltID.ToString();
        }
    }
}