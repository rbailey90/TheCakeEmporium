using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration; //added to get connection string from web.config
/// <summary>
/// Gets the discounts for the cakes
/// </summary>
public class DiscountDA
{
    //gets DefaultConnection String from web.config
    public static string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    //public static string connectionString = "Data Source=groupCake.db.2823567.hostedresource.com;Initial Catalog=groupCake;Persist Security Info=True;User ID=groupCake;Password=oNe1@cAke";
    public static SqlConnection conn = new SqlConnection(connStr);

    public DiscountDA()
    {
       
    }

    public List<string> getDiscountCakeName() //reads in database list of cakes & discounts and puts them in a list
    {
        List<string> discountCakes = new List<string>();
        string selectStatement = "SELECT CakeName FROM Discounts";

        SqlCommand selectCommand = new SqlCommand(selectStatement, conn);

        try
        {
            conn.Open();
            SqlDataReader reader = selectCommand.ExecuteReader(); // Retrieves a collection of whatever statement was executed

            while (reader.Read()) // While there is data to be read, the command is executed
            {
                string cakeName = reader["CakeName"].ToString();
                discountCakes.Add(cakeName);
            }

            reader.Close();
        }
        catch
        {
            //that didn't work
        }
        finally
        {
            conn.Close();
        }
        return discountCakes;
    }

    public List<decimal> getDiscountCakeAmount()
    {
         List<decimal> discountAmount = new List<decimal>();

        string selectStatement = "SELECT DiscountAmount FROM Discounts";

        SqlCommand selectCommand = new SqlCommand(selectStatement, conn);

        try
        {
            conn.Open();
            SqlDataReader reader = selectCommand.ExecuteReader(); // Retrieves a collection of whatever statement was executed

            while (reader.Read()) // While there is data to be read, the command is executed
            {
                decimal discount = Convert.ToDecimal(reader["DiscountAmount"]);
                discountAmount.Add(discount);
            }
            reader.Close();
        }
        finally
        {
            conn.Close();
        }
        return discountAmount;
    }
}