﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_SiteAnalytics : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAnalytics_Click(object sender, EventArgs e)
    {
        Response.Redirect("https://analytics.google.com");
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Manager/Manager.aspx");
    }
}