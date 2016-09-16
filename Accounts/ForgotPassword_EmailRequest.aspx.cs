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

public partial class Accounts_ForgotPassword_EmailRequest : System.Web.UI.Page
{
    Random keyNumber = new Random();
    private static int accessCode;
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
    protected void btnSendRequest_Click(object sender, EventArgs e)
    {
        accessCode = keyNumber.Next(1000, 50000);
        

        string userEmail = txtEmail.Text;
        UserManager<IdentityUser> userManager =
            new UserManager<IdentityUser>(new UserStore<IdentityUser>());
        if (userManager.FindByEmail(userEmail) != null)
        {
            //sends e-mail with key
            Session["userkey"] = accessCode;
            Session["userEmail"] = userEmail;
            send_eMail();
            Response.Redirect("~/Accounts/ForgotPassword.aspx");
        }
        else
        {
            string msg = "Sorry that E-mail address does not exists in our system.";
            ltlResult.Text = msg;
        }
    }


    void send_eMail()
    {
        System.Net.Mail.SmtpClient client = new SmtpClient();
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;
        client.Host = "smtp.mail.yahoo.com";
        client.Port = 587;

        // setup Smtp authentication
        System.Net.NetworkCredential credentials =
            new System.Net.NetworkCredential("CakeEmporiumASP@yahoo.com", "m7&&!BG0!E&HnxQ"); //email account information
        client.UseDefaultCredentials = false;
        client.Credentials = credentials;

        MailMessage msg = new MailMessage();

        msg.From = new MailAddress("CakeEmporiumASP@yahoo.com");
        //sends to this address
        msg.To.Add(new MailAddress(Session["userEmail"].ToString()));

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
}