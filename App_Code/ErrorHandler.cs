using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;

public class ErrorHandler
{
    private Exception ex;
	public ErrorHandler(Exception e)
	{
        Exception ex;
        if(e==null) e=HttpContext.Current.Server.GetLastError();
        if (e.InnerException == null) ex = e;
        else ex = e.InnerException;
	}

    public string SendEmail()
    {
        string body;
        if (ex != null)
        {
             body = "An exception occurred at " + DateTime.Now.ToLongTimeString()
            + " on" + DateTime.Now.ToLongDateString()
            + "<br /> Error Message: " + ex.Message;
        }
        else
        {
             body = "An exception occurred at " + DateTime.Now.ToLongTimeString()
            + " on" + DateTime.Now.ToLongDateString()
            + "<br /> Error Message: null exception" ;
        }

        MailMessage msg = new MailMessage("CakeEmporiumASP@yahoo.com", "CakeEmporiumASP@yahoo.com");
        msg.Subject = "Exception in Cake application";
        msg.Body = body;
        msg.IsBodyHtml = true;
        SmtpClient client = new SmtpClient("localhost");
        try
        {
            client.Send(msg);
            return "sent";
        }
        catch
        {
            return "notsent";
        }
    }
}