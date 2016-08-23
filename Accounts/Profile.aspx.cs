﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

public partial class User_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var signedInUserId = User.Identity.GetUserId();
        //LtlUserID.Text = signedInUserId;
        Session["signedInUser"] = signedInUserId;
        //var signedInUser = HttpContext.Current.User.Identity.GetUserId();
        //var sql = "SELECT[Username], [Firstname], [Lastname], [Address], [State], [ZipCode], [Role] FROM[Accounts] WHERE [Username] = '" + signedInUserId.ToString() + "'";
        //SqlDataSource1.SelectCommand = sql;

    }

    protected void FormView1_ItemUpdated(object sender, System.Web.UI.WebControls.FormViewUpdatedEventArgs e)
    {
            //Response.Redirect("~/Default.aspx");
    }


    protected void EditButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }
}