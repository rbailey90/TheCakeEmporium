﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Products_Details : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["CakeChoice"] != null)
        {
            int cakeID = (int)Session["CakeChoice"];

            lblCakeID.Text = cakeID.ToString();
        }
    }
}