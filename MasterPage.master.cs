using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;


public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var signedInUser = HttpContext.Current.User.Identity.GetUserName();
        if (signedInUser != null)
        {
            ltlcurrentUser.Text = string.Format("Hello {0}!!", signedInUser);
        }
    }

    protected void btn_SignUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Accounts/Registration.aspx");
    }

    protected void btn_LogIn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Accounts/Login.aspx");
    }
}
