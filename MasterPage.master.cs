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
    Random rnd = new Random();
    protected void Page_PreInit(object sender, EventArgs e)
    {
       
    }
    protected void Page_Load(object sender, EventArgs e)
    {       
        //Menu User Controls
        if (HttpContext.Current.User.IsInRole("User"))
        {
            SiteMapDataSource1.SiteMapProvider = "userWeb.sitemap";
        }
        else if(HttpContext.Current.User.IsInRole("Admin"))
        {
            SiteMapDataSource1.SiteMapProvider = "managerWeb.sitemap";
        }
        else
        {
            SiteMapDataSource1.SiteMapProvider = "XmlSiteMapProvider";
        }
    }

    //For Future Reference of logging out a user by just clicking
    //protected void btn_LogOut_Click(object sender, EventArgs e)
    //{
    //    var Auth_Manager = HttpContext.Current.GetOwinContext().Authentication;
    //    Auth_Manager.SignOut();
    //    Response.Redirect("~/Default.aspx");
    //}
}
