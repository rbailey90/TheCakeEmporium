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
    //public string Password { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Role { get; set; }
    public string Address { get; set; }
    public string State { get; set; }
    public string Zip { get; set; }
    public static object Identity { get; set; }
    public DateTime Birthday { get; set; }

    public User()
    { }

    public User(string userName, string fName, string lName, string role, string address, string state, string zip, DateTime birthday)
    {
        this.Username = userName;
        //this.Password = passWord;
        this.FirstName = fName;
        this.LastName = lName;
        this.Address = address;
        this.State = state;
        this.Zip = zip;
        this.Birthday = birthday;
        this.Role = role; //this field is not used, use identity system for role management
    
        
        // assign them a role? Yes
    }


    public string userName
    {
        get { return Username; }
        set { Username = value; }
    }

    public string getFirstName
    {
        get { return FirstName; }
        set { FirstName = value; }
    }

    public string getLastName
    {
        get { return LastName; }
        set { LastName = value; }
    }

    public string getAddress
    {
        get { return Address; }
        set { Address = value; }
    }

    public string getState
    {
        get { return State; }
        set { State = value; }
    }
    public string getZip
    {
        get { return Zip; }
        set { Zip = value; }
    }
    public DateTime getBirthday
    {
        get { return Birthday; }
        set { Birthday = value; }
    }
}