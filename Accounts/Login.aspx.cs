using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
public partial class User_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (User.Identity.IsAuthenticated)
            {
                LtlStatus.Text = string.Format("Hello {0}!!", User.Identity.GetUserName());
                LoginStatusHolder.Visible = true;
                LogoutButtonHolder.Visible = true;
            }
            else
            {
                LoginFormHolder.Visible = true;
            }
        }
    }

    protected void SignIn_Click(object sender, EventArgs e)
    {
        var User_Store = new UserStore<IdentityUser>();
        var User_Manager = new UserManager<IdentityUser>(User_Store);
        var User = User_Manager.Find(TxtUserName.Text, TxtUserPassword.Text);

        if (User != null)
        {
            var Auth_Manager = HttpContext.Current.GetOwinContext().Authentication;
            var User_Identity = User_Manager.CreateIdentity(User, DefaultAuthenticationTypes.ApplicationCookie);

            Auth_Manager.SignIn(new AuthenticationProperties() { IsPersistent = false }, User_Identity);
            Response.Redirect("~/Accounts/Profile.aspx");
        }
        else
        {
            LtlStatus.Text = "Invalid username or password.";
            LoginStatusHolder.Visible = true;
        }
    }

    protected void SignOut_Click(object sender, EventArgs e)
    {
        var Auth_Manager = HttpContext.Current.GetOwinContext().Authentication;
        Auth_Manager.SignOut();
        Response.Redirect("~/Accounts/Login.aspx");
    }
    protected void Forgot_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Accounts/ForgotPassword_EmailRequest.aspx");
    }
    
}