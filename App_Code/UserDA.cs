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
        
    }

    public static string getUsername(string aUsername)
    {
        string selectStatement = "select Username from Accounts where Username = @userName";

        string theUsername = null;

        SqlCommand selectCommand = new SqlCommand(selectStatement, conn);

        selectCommand.Parameters.AddWithValue("@userName", aUsername);

        try
        {
            conn.Open();
            SqlDataReader reader = selectCommand.ExecuteReader(); // Retrieves a collection of whatever statement was executed

            theUsername = reader["Username"].ToString();

            reader.Close();
        }
        catch
        {
            theUsername = "No User";
        }
        finally
        {
            conn.Close();
        }


        return theUsername;
    }

    //public static DateTime getBirthday(string currentUsername)
    //{
    //    string selectStatement = "select Birthday from Accounts where Username = @Username";

    //    string birthday;
    //    DateTime userBirthday;

    //    SqlCommand selectCommand = new SqlCommand(selectStatement, conn);
    //    selectCommand.Parameters.AddWithValue("@Username", currentUsername);


    //    try
    //    {
    //        conn.Open();

    //        SqlDataReader read = selectCommand.ExecuteReader();
    //        birthday = read["Birthday"].ToString();

    //        userBirthday = Convert.ToDateTime(birthday);
    //    }
    //    catch
    //    {
    //        userBirthday = DateTime.MinValue; //quick fix, userBirthday is set to 1/1/0001 12:00:00 AM
    //    }
    //    finally
    //    {
    //        conn.Close();
    //    }


    //    return userBirthday;
    //}
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


    public static int UpdateUser(string UserId, string fname, string lname, string role, string addr, string state, string zip, DateTime bday)
    {
        int numRows = 0;


        string insertString = "update Accounts SET Username = @username, Firstname = @firstname, Lastname = @lastname, Role = @role, Address = @address, State =  @state, ZipCode = @zip, Birthday = @birthday WHERE username = '" + UserId + "'"; // the parameter values will be made later

        SqlCommand insertCommand = new SqlCommand(insertString, conn);


        insertCommand.Parameters.AddWithValue("@username", UserId);
        insertCommand.Parameters.AddWithValue("@firstname", fname);
        insertCommand.Parameters.AddWithValue("@lastname", lname);
        insertCommand.Parameters.AddWithValue("@role", role);
        insertCommand.Parameters.AddWithValue("@address", addr);
        insertCommand.Parameters.AddWithValue("@state", state);
        insertCommand.Parameters.AddWithValue("@zip", zip);
        insertCommand.Parameters.AddWithValue("@birthday", bday);

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