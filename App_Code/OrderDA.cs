using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for OrderDA
/// </summary>
public class OrderDA
{
    public static string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    //public static string connectionString = "Data Source=groupCake.db.2823567.hostedresource.com;Initial Catalog=groupCake;Persist Security Info=True;User ID=groupCake;Password=oNe1@cAke";
    public static SqlConnection conn = new SqlConnection(connStr);

    public static int AddNewOrder(Order theOrder)
    {
        
        int numRows = 0;
        string insertStatement = "INSERT INTO ORDERS (Username, subtotal, tax, OrderTotal,OrderDate) values (@userName, @subtotal,@tax, @total,@orderDate)";
        SqlCommand insertCommand = new SqlCommand(insertStatement, conn);

        insertCommand.Parameters.AddWithValue("@userName", theOrder.UserName);
        insertCommand.Parameters.AddWithValue("@subtotal", theOrder.Subtotal);
        insertCommand.Parameters.AddWithValue("@tax", theOrder.Tax);
        insertCommand.Parameters.AddWithValue("@total", theOrder.OrderTotal);
        insertCommand.Parameters.AddWithValue("@orderDate", theOrder.OrderDate);
        /*
        string insertStatement2 = "INSERT INTO ORDERPAYMENT (order, cardNumber, expDate,CVV,billingStreet1,billingStreet2,billingCity,billingState,billingZip) values (@order, @cardNumber,@expDate, @CVV, @billingStreet1,@billingStreet2,@billingCity,@billingState,@billingZip)";
        SqlCommand insertCommand2 = new SqlCommand(insertStatement, conn);
        //need to supply this one with the order number and use it
        insertCommand.Parameters.AddWithValue("@order", theOrder.UserName);
        insertCommand.Parameters.AddWithValue("@cardNumber", theOrder.Subtotal);
        insertCommand.Parameters.AddWithValue("@expDate", theOrder.Tax);
        insertCommand.Parameters.AddWithValue("@CVV", theOrder.OrderTotal);
        insertCommand.Parameters.AddWithValue("@billingStreet1",theOrder.BillAddr1);
        insertCommand.Parameters.AddWithValue("@billingStreet2",theOrder.BillAddr2);
        insertCommand.Parameters.AddWithValue("@billingCity",theOrder.Billcity);
        insertCommand.Parameters.AddWithValue("@billingState",theOrder.Billstate);
        insertCommand.Parameters.AddWithValue("@billingZip",theOrder.Billzip);

        //need to supply next one with order number
        string insertStatement4 = "INSERT INTO ORDERSHIPPINGDETAILS (shipTo, Street1,Street2,City,State,Zip) values (@shipTo, @Street1,@Street2,@City,@State,@Zip)";
        SqlCommand insertCommand4 = new SqlCommand(insertStatement, conn);
        //insertCommand.Parameters.AddWithValue("@order", theOrder.UserName);
        insertCommand.Parameters.AddWithValue("@shipTo", theOrder.ShipTo);
        insertCommand.Parameters.AddWithValue("@Street1", theOrder.ShipToAdd1);
        insertCommand.Parameters.AddWithValue("@Street2", theOrder.ShiptoAdd2);
        insertCommand.Parameters.AddWithValue("@City", theOrder.ShipCity);
        insertCommand.Parameters.AddWithValue("@State", theOrder.ShipSt);
        insertCommand.Parameters.AddWithValue("@Zip", theOrder.ShipZip);

        //need to adapt this idea to looping through each CartItem
        //need to supply next one with order number 
        string insertStatement3 = "INSERT INTO ORDERDETAILS (OrderId, ProductId,Quantity, PriceEach,OrderDate) values (@orderid, @productid,@quantity, @priceeach,@orderDate)";
        SqlCommand insertCommand3 = new SqlCommand(insertStatement, conn);
        //insertCommand.Parameters.AddWithValue("@orderid", theOrder.UserName);
        insertCommand.Parameters.AddWithValue("@productid", theOrder.Subtotal);
        insertCommand.Parameters.AddWithValue("@quantity", theOrder.Tax);
        insertCommand.Parameters.AddWithValue("@priceeach", theOrder.OrderTotal);
        insertCommand.Parameters.AddWithValue("@orderDate", theOrder.OrderTotal);
        */

        try
        {
            conn.Open();
            //the action that puts it in the DB and returns the value back
            numRows = insertCommand.ExecuteNonQuery();
            
            //get order number

            //save payment
            //save details
            //save shipping details
        }
        finally
        {
            conn.Close();
        }
        return numRows;
    }
}