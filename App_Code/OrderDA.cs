using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for OrderDA
/// </summary>
public class OrderDA
{
    public static string connectionString = "Data Source=groupCake.db.2823567.hostedresource.com;Initial Catalog=groupCake;Persist Security Info=True;User ID=groupCake;Password=oNe1@cAke";
    public static SqlConnection conn = new SqlConnection(connectionString);

    public static int AddNewOrder(Order theOrder)
    {
        int numRows = 0;
        string insertStatement = "INSERT INTO ORDERS (Username, subtotal, tax, OrderTotal,OrderDate) values (@userName, @subtotal,@tax, @total,@orderDate)";
        SqlCommand insertCommand = new SqlCommand(insertStatement, conn);

        insertCommand.Parameters.AddWithValue("@userName", theOrder.UserName);
        insertCommand.Parameters.AddWithValue("@subtotal", theOrder.Subtotal);
        insertCommand.Parameters.AddWithValue("@tax", theOrder.Tax);
        insertCommand.Parameters.AddWithValue("@total", theOrder.OrderTotal);
        /*
        string insertStatement2 = "INSERT INTO ORDERPAYMENT (order, cardNumber, expDate,CVV) values (@order, @cardNumber,@expDate, @CVV)";
        SqlCommand insertCommand2 = new SqlCommand(insertStatement, conn);

        insertCommand.Parameters.AddWithValue("@order", theOrder.UserName);
        insertCommand.Parameters.AddWithValue("@cardNumber", theOrder.Subtotal);
        insertCommand.Parameters.AddWithValue("@expDate", theOrder.Tax);
        insertCommand.Parameters.AddWithValue("@CVV", theOrder.OrderTotal);

        string insertStatement3 = "INSERT INTO ORDERDETAILS (OrderId, ProductId,Quantity, PriceEach,OrderDate) values (@orderid, @productid,@quantity, @priceeach,@orderDate)";
        SqlCommand insertCommand3 = new SqlCommand(insertStatement, conn);

        insertCommand.Parameters.AddWithValue("@orderid", theOrder.UserName);
        insertCommand.Parameters.AddWithValue("@productid", theOrder.Subtotal);
        insertCommand.Parameters.AddWithValue("@quantity", theOrder.Tax);
        insertCommand.Parameters.AddWithValue("@priceeach", theOrder.OrderTotal);
        insertCommand.Parameters.AddWithValue("@orderDate", theOrder.OrderTotal);
        */
        DateTime orderDate = DateTime.Today;

        try
        {
            conn.Open();
            //the action that puts it in the DB and returns the value back
            numRows = insertCommand.ExecuteNonQuery();
            //get order number

            //save payment
            //save details
        }
        finally
        {
            conn.Close();
        }
        return numRows;
    }
}