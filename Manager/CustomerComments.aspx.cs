﻿using System;
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

     protected void GridView3_SelectedIndexChanged1(object sender, EventArgs e)
    {
        string ordersel = GridView3.SelectedValue.ToString();
  
        // use Session variable to move choice to detail page
        Session["commentName"] = ordersel;
        Response.Redirect("~/Manager/DashCommentResponse.aspx");
    }
}