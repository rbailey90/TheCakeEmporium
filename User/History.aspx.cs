using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.Owin.Security;
using Microsoft.AspNet.Identity.EntityFramework;

public partial class User_History : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var signedInUserId = User.Identity.GetUserId();
        //LtlUserID.Text = signedInUserId;
        Session["signedInUser"] = signedInUserId;
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}