using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class User_HistoryDetail : System.Web.UI.Page
{
    string storedInfo;
    string[] orderinfo;
    int orderid;
    int lineid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["orderselect"] != null)
        {
            
            storedInfo = (Session["orderselect"]).ToString();
            storedInfo = storedInfo.Trim();
            
            orderinfo = storedInfo.Split('-');
            orderid = Convert.ToInt32(orderinfo[0]);
            lineid = Convert.ToInt32(orderinfo[1]);

            lblOrderID.Text = orderid.ToString();
            lblLineID.Text = lineid.ToString();
        }
        else
        {
            Response.Redirect("~/User/History.aspx");
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        string prod = OrderDA.ReorderInfo(orderid, lineid);
        int quant = OrderDA.GetProdQuantity(orderid, lineid);
        int product=Convert.ToInt32(prod);
        //int quantity = Convert.ToInt32(quant);


        //OrderDA.DeleteOrder(orderid); //don't delete order b/c might still have items 
        OrderDA.DeleteOrderDetails(orderid, lineid);
        //should update on hand
        OrderDA.UpdateProductQuant(product, quant);

        /*should tell manager to recalc total and provide refund if needed 
        give them the order number, so they can look up what's left on the order 
        and what payment info was provided, so they can give refund if already charged*/
        string message = SendEmail();
        
        //should tell customer it worked and what to expect
        Response.Redirect("~/User/DeletedConfirmation.aspx");
    }

    protected void btnReorder_Click(object sender, EventArgs e)
    {
      
        Order curOrder=new Order();
 
        string prod=curOrder.ReorderInfo(orderid, lineid);
        Session["CakeChoice"] = Convert.ToInt32(prod);

        Response.Redirect("~/Products/Details.aspx");
    }
    public string SendEmail()
    {
        string body;

            body = "A customer has canceled line " + lineid.ToString()
           + " of order " + orderid.ToString()
           + ". Please see if they've already been charged and whether a refund is due.";

        MailMessage msg = new MailMessage("CakeEmporiumASP@yahoo.com", "CakeEmporiumASP@yahoo.com");
        msg.Subject = "Order change: deleted item";
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