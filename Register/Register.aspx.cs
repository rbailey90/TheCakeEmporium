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
        string fName;
        string lName;
        string phoneNum;
        string email;

        fName = txtFirstName.Text;
        lName = txtLastName.Text;
        phoneNum = txtPhone.Text;
        email = txtEmail.Text;
    }
}