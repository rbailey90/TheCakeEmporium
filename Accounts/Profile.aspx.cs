using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
public partial class User_Profile : System.Web.UI.Page
{
    UserManager<IdentityUser> userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>());
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
        var signedInUserId = User.Identity.GetUserId();
        //LtlUserID.Text = signedInUserId;
        Session["signedInUser"] = signedInUserId;
        //var signedInUser = HttpContext.Current.User.Identity.GetUserId();
        //var sql = "SELECT[Username], [Firstname], [Lastname], [Address], [State], [ZipCode], [Role] FROM[Accounts] WHERE [Username] = '" + signedInUserId.ToString() + "'";
        //SqlDataSource1.SelectCommand = sql;

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

    protected void UpdateButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Accounts/UpdateComplete.aspx");
    }
    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Default.aspx");
    }

    protected void updateAspUserInfo()
    {       
        var newEmail = (FormView2.FindControl("EmailTextBox") as TextBox).Text;
        var newPhone = (FormView2.FindControl("PhoneNumberTextBox") as TextBox).Text;

        if(newEmail != "" && newPhone != "")
        {        
            //updates e-mail address
            userManager.SetEmail(User.Identity.GetUserId(), newEmail);
            //updates phone number
            userManager.SetPhoneNumber(User.Identity.GetUserId(), newPhone);
            Response.Redirect("~/Accounts/UpdateComplete.aspx");
        }
    }

    protected void btnUnregister_Click(object sender, EventArgs e)
    {
        userManager.SetLockoutEnabled(User.Identity.GetUserId(), true); //isn't working need check on login
        //logout user here
        Response.Redirect("~/Accounts/AccountDeactived.aspx");
    }

    protected void btnUpdateInfo_Click(object sender, EventArgs e)
    {

        string fname = (FormView1.FindControl("FirstnameTextBox") as TextBox).Text;
        string lname = (FormView1.FindControl("LastnameTextBox") as TextBox).Text;
        string address = (FormView1.FindControl("AddressTextBox") as TextBox).Text;
        string city = (FormView1.FindControl("CityTextBox") as TextBox).Text;
        string state = (FormView1.FindControl("StateTextBox") as TextBox).Text;
        string zip = (FormView1.FindControl("ZipCodeTextBox") as TextBox).Text;
        string role = "";
        DateTime bday = Convert.ToDateTime((FormView1.FindControl("BirthdayTextBox") as TextBox).Text);

        //User currentUser = new User();

        UserDA.UpdateUser(User.Identity.GetUserId(), fname, lname, role, address, city, state, zip, bday);
        updateAspUserInfo();
        Response.Redirect("~/Accounts/UpdateComplete.aspx");
    }

    protected void btnChangePass_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Accounts/ChangePassword.aspx");
    }

    protected void btnHistory_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/User/History.aspx");
    }
}