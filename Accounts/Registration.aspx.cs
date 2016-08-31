using System;
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
    protected void Page_Load(object sender, EventArgs e)
    {

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
            //Creates Role if does not exists

            //var RoleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
            //if (!RoleManager.RoleExists(myRole))
            //{
            //    var roleResult = RoleManager.Create(new IdentityRole(myRole));
            //}
            

            User_Manager.AddToRole(New_User.Id, myRole);
            Auth_Manager.SignIn(new AuthenticationProperties() { }, User_Identity);
            //var userid = User.Identity.GetUserId(); //gets the new user id once logged in
            //inserts profile informtion into User table
            var role = "User";
            var new_UserProfile = new User(User_Identity.GetUserId(), txtFirstName.Text, txtLastName.Text, role, txtAddress.Text, txtState.Text, TxtZip.Text);
            UserDA.AddUser(new_UserProfile);
            Response.Redirect("~/Accounts/Login.aspx");
        }
        else
        {
            LblMessage.Text = User_Result.Errors.FirstOrDefault();
        }
    }
}