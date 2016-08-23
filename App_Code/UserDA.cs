﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for UserDA
/// </summary>
public class UserDA
{
    public static string connectionString = "Data Source=groupCake.db.2823567.hostedresource.com;Initial Catalog=groupCake;Persist Security Info=True;User ID=groupCake;Password=oNe1@cAke";
    public static SqlConnection conn = new SqlConnection(connectionString);

    public UserDA()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static int AddUser(User newUser)
    {
        int numRows = 0;

        string insertString = "insert into Accounts (Username, Firstname, Lastname, Role, Address, State, ZipCode) values (@username, @firstname, @lastname, @role, @address, @state, @zip)"; // the parameter values will be made later

        SqlCommand insertCommand = new SqlCommand(insertString, conn); 

        insertCommand.Parameters.AddWithValue("@username", newUser.Username); 
        insertCommand.Parameters.AddWithValue("@firstname", newUser.FirstName);
        insertCommand.Parameters.AddWithValue("@lastname", newUser.LastName);
        insertCommand.Parameters.AddWithValue("@role", newUser.Role);
        insertCommand.Parameters.AddWithValue("@address", newUser.Address);
        insertCommand.Parameters.AddWithValue("@state", newUser.State);
        insertCommand.Parameters.AddWithValue("@zip", newUser.Zip);

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
}