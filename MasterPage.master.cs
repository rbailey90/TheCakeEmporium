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
        checkUser();

    }

    private void checkUser()
    {
        var Auth_Manager = HttpContext.Current.GetOwinContext().Authentication;
        string currentuserRole ="0";
        if (HttpContext.Current.User.Identity.GetUserId() != null)
        {
            string user = HttpContext.Current.User.Identity.GetUserId();
            currentuserRole = UserDA.getRole(user); //Current Role from table itself
        }

        //Menu User Controls
        if (HttpContext.Current.User.IsInRole("User") || currentuserRole == "1")
        {
            SiteMapDataSource1.SiteMapProvider = "userWeb.sitemap";
        }
        else if (HttpContext.Current.User.IsInRole("Admin"))
        {
            SiteMapDataSource1.SiteMapProvider = "managerWeb.sitemap";
        }
        else
        {
            SiteMapDataSource1.SiteMapProvider = "XmlSiteMapProvider";
        }
    }
}
