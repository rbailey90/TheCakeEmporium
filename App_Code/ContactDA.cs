using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Class that writes information to the Comments Table
/// </summary>
public class ContactDA
{

    public static string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    public static SqlConnection conn = new SqlConnection(connStr);

    public ContactDA(string username, string firstname, string emailAddress, string comments)
    {
       
    }
    ///int numRows = 0;
    //need a connection
    
    public static void addComment(string userName, string firstName, string email, string comment)
    {
        string insertString = "insert into Comments(Username, Comment, Name, EmailAddress) values (@username, @comment, @name, @emailaddress)"; // the parameter values will be made later

        SqlCommand insertCommand = new SqlCommand(insertString, conn);

        insertCommand.Parameters.AddWithValue("@username", userName);
        insertCommand.Parameters.AddWithValue("@comment", comment );
        insertCommand.Parameters.AddWithValue("@name", firstName);
        insertCommand.Parameters.AddWithValue("@emailaddress", email); 
        
        try
        {
            conn.Open();
            insertCommand.ExecuteNonQuery();
        }
        finally
        {
            conn.Close(); // Closes database
        }

    }
}
    