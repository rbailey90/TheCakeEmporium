using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Customers
/// </summary>
public class Customer
{
    public int custID { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string Phone { get; set; }
    public string eMail { get; set; }
    public string Address { get; set; }
    public string State { get; set; }
    public string Country { get; set; }
    public string ZipCode { get; set; }
    

    public Customer()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Customer(string fName, string lName, string phone, string email, string address, string state, string country, string zip)
    {
        this.FirstName = fName;
        this.LastName = lName;
        this.Phone = phone;
        this.eMail = email;
        this.Address = address;
        this.State = State;
        this.Country = country;
        this.ZipCode = zip;
    }
}