using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for CakeDA
/// </summary>
public class CakeDA
{
    public static string connectionString = "Data Source=groupCake.db.2823567.hostedresource.com;Initial Catalog=groupCake;Persist Security Info=True;User ID=groupCake;Password=***********";
    public static SqlConnection conn = new SqlConnection(connectionString);

    public CakeDA()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public static List<Cake> GetAllCake()
    {
        List<Cake> allCakes = new List<Cake>();

        string selectStatement = "select * from Products";

        SqlCommand selectCommand = new SqlCommand(selectStatement, conn);

        try
        {
            conn.Open();
            SqlDataReader reader = selectCommand.ExecuteReader(); // Retrieves a collection of whatever statement was executed

            while (reader.Read()) // While there is data to be read, the command is executed
            {
                Cake aCake = new Cake();

                aCake.ProductId = Convert.ToInt16(reader["ProductId"]); // Takes the info from the ProductID column in the database and puts it into the localized Cake object aCake
                aCake.Name = reader["Name"].ToString();
                aCake.Description = reader["Description"].ToString();
                aCake.ImageFile = reader["Image"].ToString();
                aCake.UnitPrice = Convert.ToDecimal(reader["UnitPrice"]);
                aCake.OnHand = Convert.ToInt16(reader["OnHand"]);

                allCakes.Add(aCake); // ADds a cake to the list for every cake in the database
            }

            reader.Close();
        }
        finally
        {
            conn.Close();
        }

        return allCakes;

    }
}