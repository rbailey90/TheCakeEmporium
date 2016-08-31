using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for UserDA
/// </summary>
public class UserDA
{
    public static string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    //public static string connectionString = "Data Source=groupCake.db.2823567.hostedresource.com;Initial Catalog=groupCake;Persist Security Info=True;User ID=groupCake;Password=oNe1@cAke";
    //public static string connectionString = "Data Source=198.71.225.113;Initial Catalog=groupCake;Persist Security Info=True;User ID=groupCake;Password=oNe1@cAke";
    public static SqlConnection conn = new SqlConnection(connStr);

    public UserDA()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static int AddUser(User newUser)
    {
        int numRows = 0;

        string insertString = "insert into Accounts (Username, Firstname, Lastname, Role, Address, State, ZipCode, Birthday) values (@username, @firstname, @lastname, @role, @address, @state, @zip, @birthday)"; // the parameter values will be made later

        SqlCommand insertCommand = new SqlCommand(insertString, conn); 

        insertCommand.Parameters.AddWithValue("@username", newUser.Username); 
        insertCommand.Parameters.AddWithValue("@firstname", newUser.FirstName);
        insertCommand.Parameters.AddWithValue("@lastname", newUser.LastName);
        insertCommand.Parameters.AddWithValue("@role", newUser.Role);
        insertCommand.Parameters.AddWithValue("@address", newUser.Address);
        insertCommand.Parameters.AddWithValue("@state", newUser.State);
        insertCommand.Parameters.AddWithValue("@zip", newUser.Zip);
        insertCommand.Parameters.AddWithValue("@birthday", newUser.Birthday);

        try
        {
            conn.Open(); 
            numRows = insertCommand.ExecuteNonQuery(); // how many rows added to the db
        }
        finally
        {
            conn.Close(); // Closes database
        }

        return numRows;
    }


    public static int UpdateUser(string UserId)
    {
        int numRows = 0;
        //updates user information

        return numRows;
    }
}