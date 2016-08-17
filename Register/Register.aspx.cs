using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        // take the values the User enter off the form
        string fName;
        string lName;
        string phoneNum;
        string email;
        string usrNme;
        string pssWrd;

        fName = txtFirstName.Text;
        lName = txtLastName.Text;
        phoneNum = txtPhone.Text;
        email = txtEmail.Text;
        usrNme = txtUsername.Text;
        pssWrd = txtPassword2.Text;

        // create a new User
        User newUser = new User(usrNme, pssWrd, fName, lName, email, phoneNum);

        // new session
        Session["User"] = newUser;

        // take them to the page to confirm registeration
        Response.Redirect("~/Register/RegisterConfirmation.aspx");
    }
}