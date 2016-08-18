using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{
    public string Username { get; set; }
    public string Password { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Email { get; set; }
    public string Phone { get; set; }
    public string Role { get; set; }

    public User()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public User(string userName, string passWord, string fName, string lName, string email, string phone)
    {
        this.Username = userName;
        this.Password = passWord;
        this.FirstName = fName;
        this.LastName = lName;
        this.Email = email;
        this.Phone = phone;
        
        // assign them a role?
    }
}