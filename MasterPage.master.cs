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
    protected void Page_PreInit(object sender, EventArgs e)
    {
        DateTime todaysDate = new DateTime();
        todaysDate = System.DateTime.Now.Date;
        DateTime halloweenDay = new DateTime(2016, 10, 31);

        TimeSpan t = todaysDate - halloweenDay;
        double numDays = t.TotalDays;

        if (numDays <= 131)
        {
            Page.Theme = "halloween";  //this is how you change the theme here to the halloween theme for just this page
                                       //has to go in the page preInit event so that the theme is applied before the page is constructed
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        var signedInUser = HttpContext.Current.User.Identity.GetUserName();
        if (signedInUser != null)
        {
            ltlcurrentUser.Text = string.Format("Welcome back {0}", signedInUser);
            btn_Profile.Visible = true;
            btn_SignUp.Visible = false;
            btn_LogIn.Visible = false;
        }
        else
        {
            btn_LogIn.Visible = true;
            btn_Profile.Visible = false;
            btn_SignUp.Visible = true;
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

    protected void btn_Profile_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Accounts/Profile.aspx");
    }
}
