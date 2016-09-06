using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

using System.Net.Mail;

public partial class Accounts_ForgotPassword : System.Web.UI.Page
{
    Random keyNumber = new Random();
    private static int accessCode;
    private string email;
   

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    void send_eMail()
    {
        SmtpClient client = new SmtpClient();
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;
        client.Host = "smtp.mail.yahoo.com";
        client.Port = 587;

        // setup Smtp authentication
        System.Net.NetworkCredential credentials =
            new System.Net.NetworkCredential("thrawniejoe@yahoo.com", "Hy*fAnA^c10e&uh"); //email account information
        client.UseDefaultCredentials = false;
        client.Credentials = credentials;

        MailMessage msg = new MailMessage();
        
        msg.From = new MailAddress("thrawniejoe@yahoo.com");
        //sends to this address
        msg.To.Add(new MailAddress(email));

        msg.Subject = "The Cake Emporium - Password Reset";
        msg.IsBodyHtml = true;
        msg.Body = string.Format("<html><head></head><body><b>Your Verification code is " + Session["userkey"].ToString() + "</b></body>");

        try
        {
            client.Send(msg);
            Response.Write("Your message has been successfully sent.");
        }
        catch (Exception ex)
        {
            //lblMsg.ForeColor = Color.Red;
            Response.Write("Error occured while sending your message." + ex.Message);
        }
    }

    


    void Reset_User()
    {


        try
        {
            UserManager<IdentityUser> userManager =
            new UserManager<IdentityUser>(new UserStore<IdentityUser>());
            var myUser = userManager.FindByEmailAsync(Session["userEmail"].ToString());
     

            //gets current user id
            string userId = Convert.ToString(myUser.Id);
            //checks to see if current user password matches one given, then changes it if true.
            if (txtCode.Text == Session["userkey"].ToString())  //gfhsdtdsfa change
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
                ltlResult.Text = "Sorry, Current Password doesn't match password on file. " + Session["userkey"].ToString();
            }
        }
        catch
        {
            ltlResult.Text = "reset failed ";
        }
    }


    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        if(txtCode.Text != null || txtCode.Text != "")
        {
            Reset_User();
        }
        else
        {
            ltlResult.Text = "Reset code is empty, please enter your code";
        }
        
    }
}
