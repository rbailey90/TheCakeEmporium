using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

public partial class ContactUs_ContactUs : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        int daysUntil = getDaysUntilHalloween();
        if (daysUntil <= 31)
        {
            Page.Theme = "halloween";
        }
        Page.Theme = "birthday";
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
    protected void btnSubmitComment_Click(object sender, EventArgs e)
    {
       
        if (User.Identity.IsAuthenticated) //if current user is signed in
        {
            var userId = User.Identity.GetUserId(); //get current users id

            UserManager<IdentityUser> userManager =
            new UserManager<IdentityUser>(new UserStore<IdentityUser>());
            var myUser = userManager.FindById(userId); //make a user
            string currentUser = Convert.ToString(myUser);
            string email = myUser.Email; //heres there email
            string currentUserName = UserDA.getUsername(currentUser);
            string firstName = txtName.Text;
            string comment = txtComments.Text;
            ContactDA.addComment(currentUserName, firstName, email, comment);
        }
        else
        {
            string firstName = txtName.Text;
            string email = txtEmail.Text;
            string comments = txtComments.Text;

            ContactDA.addComment("Anonymous", firstName, email, comments);
        }
        cleartxtBoxes();
        
    }

    private void cleartxtBoxes()
    {
        txtComments.Text = "";
        txtEmail.Text = "";
        txtName.Text = "";
    }
}