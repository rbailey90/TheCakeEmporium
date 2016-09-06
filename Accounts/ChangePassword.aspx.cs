using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
public partial class Accounts_ChangePassword : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        int daysUntil = getDaysUntilHalloween();
        if (daysUntil <= 31)
        {
            Page.Theme = "halloween";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public int getDaysUntilHalloween()
    {
        DateTime todaysDate = new DateTime();
        todaysDate = System.DateTime.Now.Date;
        DateTime halloweenDay = new DateTime(DateTime.Today.Year, 10, 31); //year set to current year so it will constantly update

        TimeSpan t = halloweenDay - todaysDate;
        double daysUntil = t.TotalDays;

        return (int)daysUntil;
    }
    protected void btnChangePass_Click(object sender, EventArgs e)
    {
        //gets current user id
        var userId = User.Identity.GetUserId();
        

        UserManager<IdentityUser> userManager =
        new UserManager<IdentityUser>(new UserStore<IdentityUser>());
        var myUser = userManager.FindById(userId);
       
        //checks to see if current user password matches one given, then changes it if true.
        if (userManager.CheckPasswordAsync(myUser, txtOldPass.Text).Result==true)
        {
            if (txtNewPass.Text == txtNewPassConfirm.Text)
            {
                var newpass = txtNewPassConfirm.Text;
                if (txtNewPass.Text == txtNewPassConfirm.Text)
                {
                    userManager.RemovePassword(userId);
                    userManager.AddPassword(userId, newpass);
                }
                else
                {
                    ltlResult.Text = "Your Password has been updated!";
                }
            }
            else
            { 
                ltlResult.Text = "Sorry, New Password doesn't match password in the confirmation field.";
            }
        }
        else
        {
            ltlResult.Text = "Sorry, Current Password doesn't match password on file.";
        }



    }
}