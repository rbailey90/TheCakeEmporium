using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

/// <summary>
/// Summary description for OrderDA
/// </summary>
public class OrderDACopy
{
    public static string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    //public static string connectionString = "Data Source=groupCake.db.2823567.hostedresource.com;Initial Catalog=groupCake;Persist Security Info=True;User ID=groupCake;Password=oNe1@cAke";
    public static SqlConnection conn = new SqlConnection(connStr);

    public static void AddNewOrder(Order theOrder)
    {
        //string insertStatement = "INSERT INTO ORDERS (OrderId, Username, subtotal, tax, OrderTotal,OrderDate) values (@OrderId, @userName, @subtotal,@tax, @total,@orderDate)";
        string insertStatement = "INSERT INTO ORDERS (Username, subtotal, tax, total) values (@userName, @subtotal,@tax,@total)";
        SqlCommand insertCommand = new SqlCommand(insertStatement, conn);
        insertCommand.Parameters.AddWithValue("@userName", theOrder.UserName);
        insertCommand.Parameters.AddWithValue("@subtotal", theOrder.Subtotal);
        insertCommand.Parameters.AddWithValue("@tax", theOrder.Tax);
        insertCommand.Parameters.AddWithValue("@total", theOrder.OrderTotal);

        try
        {
            conn.Open();
            //the action that writes to Order table
            insertCommand.ExecuteNonQuery();
            //get order number
            int ID;
 
            string selectStatement = "SELECT IDENT_CURRENT('OrderId') FROM Orders";
            using ( SqlCommand selectCommand = new SqlCommand(selectStatement, conn))
            {
                ID = (int)selectCommand.ExecuteScalar();
            }
            int orderID = ID;// Convert.ToInt32(selectCommand.ExecuteScalar());

 


            
            /*save payment*/
            //first set it up          
            string insertStatement2 = "INSERT INTO ORDERPAYMENT (order, cardNumber, expDate,CVV,billingStreet1,billingStreet2,billingCity,billingState,billingZip) values (@order, @cardNumber,@expDate, @CVV, @billingStreet1,@billingStreet2,@billingCity,@billingState,@billingZip)";
            SqlCommand insertCommand2 = new SqlCommand(insertStatement2, conn);
            //need to supply this one with the order number and use it
            insertCommand2.Parameters.AddWithValue("@order", orderID);
            insertCommand2.Parameters.AddWithValue("@cardNumber", theOrder.Subtotal);
            insertCommand2.Parameters.AddWithValue("@expDate", theOrder.Tax);
            insertCommand2.Parameters.AddWithValue("@CVV", theOrder.OrderTotal);
            insertCommand2.Parameters.AddWithValue("@billingStreet1", theOrder.BillAddr1);
            insertCommand2.Parameters.AddWithValue("@billingStreet2", theOrder.BillAddr2);
            insertCommand2.Parameters.AddWithValue("@billingCity", theOrder.Billcity);
            insertCommand2.Parameters.AddWithValue("@billingState", theOrder.Billstate);
            insertCommand2.Parameters.AddWithValue("@billingZip", theOrder.Billzip);
            //then write
            insertCommand2.ExecuteNonQuery();

            /*save shipping details*/
            //first set it up
            string insertStatement4 = "INSERT INTO ORDERSHIPPINGDETAILS (order, shipTo, Street1,Street2,City,State,Zip) values (@order, @shipTo, @Street1,@Street2,@City,@State,@Zip)";
            SqlCommand insertCommand4 = new SqlCommand(insertStatement4, conn);
            insertCommand4.Parameters.AddWithValue("@order", orderID);
            insertCommand4.Parameters.AddWithValue("@shipTo", theOrder.ShipTo);
            insertCommand4.Parameters.AddWithValue("@Street1", theOrder.ShipToAdd1);
            insertCommand4.Parameters.AddWithValue("@Street2", theOrder.ShiptoAdd2);
            insertCommand4.Parameters.AddWithValue("@City", theOrder.ShipCity);
            insertCommand4.Parameters.AddWithValue("@State", theOrder.ShipSt);
            insertCommand4.Parameters.AddWithValue("@Zip", theOrder.ShipZip);
            //then write

            insertCommand4.ExecuteNonQuery();
            /* Save Order Details */
            //WriteDetails(theOrder, orderID);
        }
        finally
        {
            conn.Close();
        }
        
    }

    public static void WriteDetails(Order theOrder, int orderID)
    {            /*save order details*/
                 //first set it up
                 //need to adapt this idea to looping through each CartItem
        string insertStatement3;
        

        //then write
       // foreach (CartItem i in )
        {
            insertStatement3 = "INSERT INTO ORDERDETAILS (OrderId, ProductId,Quantity, PriceEach,OrderDate) values (@orderid, @productid,@quantity, @priceeach,@orderDate)";
            SqlCommand insertCommand3 = new SqlCommand(insertStatement3, conn);
            insertCommand3.Parameters.AddWithValue("@orderid", orderID);
            insertCommand3.Parameters.AddWithValue("@productid", theOrder.Subtotal);
            insertCommand3.Parameters.AddWithValue("@quantity", theOrder.Tax);
            insertCommand3.Parameters.AddWithValue("@priceeach", theOrder.OrderTotal);
            insertCommand3.Parameters.AddWithValue("@orderDate", theOrder.OrderTotal);

            insertCommand3.ExecuteNonQuery();
            //i++;

        }


    }
}