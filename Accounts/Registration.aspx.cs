﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

public partial class User_Registration : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        int daysUntil = getDaysUntilHalloween();
        if (daysUntil <= 31)
        {
            Page.Theme = "halloween";
        }

        
    }


    protected void Page_PreRender(object sender, EventArgs e)
    {
        //Checks to make sure birthdate comes after 1755 and not after the current year/day
        DOBRangeValidator.Type = ValidationDataType.Date;
        DOBRangeValidator.MinimumValue = DateTime.Today.AddYears(-250).ToShortDateString();
        DOBRangeValidator.MaximumValue = DateTime.Today.ToShortDateString();
        DOBRangeValidator.ErrorMessage = "Date Must Be in between " + DOBRangeValidator.MinimumValue + " and " + DOBRangeValidator.MaximumValue;
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

    protected void UserRegistration_Click(object sender, EventArgs e)
    {
        Register_User();
    }

    void Register_User()
    {
        var User_Store = new UserStore<IdentityUser>();
        var User_Manager = new UserManager<IdentityUser>(User_Store);
        //Creates new user
        var New_User = new IdentityUser() { UserName = TxtUserName.Text };
        IdentityResult User_Result = User_Manager.Create(New_User, TxtUserPassword.Text);

        if (User_Result.Succeeded)
        {
            var Auth_Manager = HttpContext.Current.GetOwinContext().Authentication;
            var User_Identity = User_Manager.CreateIdentity(New_User, DefaultAuthenticationTypes.ApplicationCookie);
            User_Manager.SetEmail(New_User.Id, TxtUserEmail.Text);
            

            string myRole = "User";
     
            User_Manager.AddToRole(New_User.Id, myRole);
            Auth_Manager.SignIn(new AuthenticationProperties() { }, User_Identity);
            //var userid = User.Identity.GetUserId(); //gets the new user id once logged in
            //inserts profile informtion into User table
            var role = "User";
            var new_UserProfile = new User(User_Identity.GetUserId(), txtFirstName.Text, txtLastName.Text, role, txtAddress.Text, txtCity.Text, txtState.Text, TxtZip.Text, Convert.ToDateTime(txtDob.Text));
            UserDA.AddUser(new_UserProfile);
            AddCookie();

            Response.Redirect("~/Accounts/Login.aspx");
           
        }
        else
        {
            LblMessage.Text = User_Result.Errors.FirstOrDefault();
        }
    }
    
    private void AddCookie()
    {
        string fname = txtFirstName.Text;
        HttpCookie firstnameCookie = new HttpCookie("FirstName", fname);
        firstnameCookie.Expires = DateTime.Now.AddDays(30); //set expiration date
        Response.Cookies.Add(firstnameCookie);
    }
}