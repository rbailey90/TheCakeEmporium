using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_Dashboard : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["commentName"] != null)
        {
            int orderID = Convert.ToInt16(Session["orderselect"]);
            lblUser.Text = Session["commentName"].ToString();


        }
        else
        {
            Response.Redirect("~/Manager/CustomerComments.aspx");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    void send_eMail(string email, string managerMessage)
    {
        SmtpClient client = new SmtpClient();
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;
        client.Host = "smtp.mail.yahoo.com";
        client.Port = 587;

        // setup Smtp authentication
        System.Net.NetworkCredential credentials =
            new System.Net.NetworkCredential("CakeEmporiumASP@yahoo.com", "m7&&s!BGO!E&HnxQ"); //email account information
        client.UseDefaultCredentials = false;
        client.Credentials = credentials;

        MailMessage msg = new MailMessage();

        msg.From = new MailAddress("CakeEmporiumASP@yahoo.com");
        //sends to this address
        msg.To.Add(new MailAddress(email));

        msg.Subject = "The Cake Emporium - Comment Response";
        msg.IsBodyHtml = true;
        msg.Body = string.Format("<html><head></head><body>" + managerMessage + "</body>");

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

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string userEmail = null;
        string managerMessage = null;

        userEmail = (Session["commentName"].ToString());

        managerMessage = txtResponse.Text;
        if( userEmail != null || userEmail != "")
        {
            send_eMail(userEmail, managerMessage);
        }
    }
}