using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_RegisterConfirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["User"] != null)
        {
            // Cast sesssion into User
            User currentUser = (User)Session["User"];

            // Write to the page to confirm register for user
            lblConfirmation.Text = "Thank you " + currentUser.FirstName + " for registering! " + "Your username is " + currentUser.Username + ".";
        }
        else
        {
            Response.Redirect("~/Register/Register.aspx");
        }
    }
}