﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration; //added to get connection string from web.config

/// <summary>
/// Summary description for CakeDA
/// </summary>
public class CakeDA
{
    //gets DefaultConnection String from web.config
    public static string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    //public static string connectionString = "Data Source=groupCake.db.2823567.hostedresource.com;Initial Catalog=groupCake;Persist Security Info=True;User ID=groupCake;Password=oNe1@cAke";
    public static SqlConnection conn = new SqlConnection(connStr);

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

                aCake.ProductId = reader["ProductId"].ToString();
                //aCake.ProductId = Convert.ToInt16(reader["ProductId"]); // Takes the info from the ProductID column in the database and puts it into the localized Cake object aCake
                aCake.Name = reader["Name"].ToString();
                aCake.Description = reader["Description"].ToString();
                aCake.ImageFile = reader["Image"].ToString();
                aCake.UnitPrice = Convert.ToDecimal(reader["UnitPrice"]);
                aCake.OnHand = Convert.ToInt16(reader["OnHand"]);

                allCakes.Add(aCake); // Adds a cake to the list for every cake in the database
            }

            reader.Close();
        }
        finally
        {
            conn.Close();
        }

        return allCakes;

    }

    public static string GetCakeImage(Cake aCake)
    {
        string theImage = null;

        string selectStatement = "select * from Products where productId=@id";

        SqlCommand selectCommand = new SqlCommand(selectStatement, conn);

        selectCommand.Parameters.AddWithValue("@id", aCake.ProductId);

        try
        {
            conn.Open();
            SqlDataReader reader = selectCommand.ExecuteReader();

            while (reader.Read())
            {
                theImage = aCake.ImageFile = reader["Image"].ToString();
            }

            reader.Close();
        }
        finally
        {
            conn.Close();
        }

        return theImage;
    }

    public static int AddCake(Cake newCake)
    {
        int numRows = 0;

        string insertString = "insert Products (Name, Description, Image, UnitPrice, OnHand) values (@name, @description, @image, @unitPrice, @onHand)"; // the parameter values will be made later

        // now the command object
        SqlCommand insertCommand = new SqlCommand(insertString, conn); // declares and instantiates a new sqlcommand, which takes 2 arguments, the command itself as a string, and the connection as a string

        insertCommand.Parameters.AddWithValue("@name", newCake.ProductId); // declares what the parameters retrieve their information from. theStore is the passed PizzaStore object
        insertCommand.Parameters.AddWithValue("@description", newCake.Description);
        insertCommand.Parameters.AddWithValue("@image", newCake.ImageFile);
        insertCommand.Parameters.AddWithValue("@unitPrice", newCake.UnitPrice);
        insertCommand.Parameters.AddWithValue("@onHand", newCake.OnHand);

        try
        {
            conn.Open(); // opens the connection to the database so that we can make sqlcommands
            numRows = insertCommand.ExecuteNonQuery(); // Says how many rows were added to the database
        }
        finally
        {
            conn.Close(); // Closes the database, so that we aren't accidently interacting with it anymore
        }

        return numRows;
    }

    public static void Update(Cake aCake)
    {
        int numRows = 0;

        // update statement
        string updateStatement = "UPDATE Products SET OnHand = @onHand WHERE ProductId = @productId";

        // command object
        SqlCommand updateCommand = new SqlCommand(updateStatement, conn);

        updateCommand.Parameters.AddWithValue("@onHand", aCake.OnHand);
        updateCommand.Parameters.AddWithValue("@productId", aCake.ProductId); // Where clause

        try
        {
            conn.Open();
            numRows = updateCommand.ExecuteNonQuery();
        }
        finally
        {
            conn.Close();
        }

    }
}