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
    public static string connStr1 = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
    public static SqlConnection conn1 = new SqlConnection(connStr1);

    public static void AddNewOrder(Order theOrder)
    {

        try
        {
            conn1.Open();
            //the action that writes to Order table
            //insertCommand.ExecuteNonQuery();
            //get order number
            int ID;
            string insertStatement = "INSERT INTO ORDERS (Username, subtotal, tax, total) values (@userName, @subtotal,@tax,@total);SELECT CAST(scope_identity() AS int)";
            //string insertStatement = "INSERT INTO ORDERS (Username, subtotal, tax, total) values (@userName, @subtotal,@tax,@total)";
            //string query2 = "Select @@Identity";
            //string selectStatement = "SELECT IDENT_CURRENT('OrderId') FROM Orders";
            using (SqlCommand insertCommand = new SqlCommand(insertStatement, conn1))
            {
                insertCommand.Parameters.AddWithValue("@userName", theOrder.UserName);
                insertCommand.Parameters.AddWithValue("@subtotal", theOrder.Subtotal);
                insertCommand.Parameters.AddWithValue("@tax", theOrder.Tax);
                insertCommand.Parameters.AddWithValue("@total", theOrder.OrderTotal);

                //Just did this conn1.Open();
                //ID = (int)insertCommand.ExecuteScalar();
                //insertCommand.ExecuteNonQuery();
                //insertCommand.CommandText = query2;
                ID = (int)insertCommand.ExecuteScalar();
            }
            theOrder.OrderID = ID.ToString();// Convert.ToInt32(selectCommand.ExecuteScalar());


            /*save payment*/
            //first set it up          
            //string insertStatement2 = "INSERT INTO ORDERPAYMENT (order, cardNumber, expDate,CVV,billingStreet1,billingStreet2,billingCity,billingState,billingZip) values (@order, @cardNumber,@expDate, @CVV, @billingStreet1,@billingStreet2,@billingCity,@billingState,@billingZip)";
            string insertStatement2 = "INSERT INTO ORDERPAYMENT (OrdNo, cardNumber, expDate,CVV,billingStreet1,billingStreet2,billingCity,billingState,billingZip,cardName) values (@ordno, @cardNumber,@expDate, @CVV, @billingStreet1,@billingStreet2,@billingCity,@billingState,@billingZip,@cardName)";
            SqlCommand insertCommand2 = new SqlCommand(insertStatement2, conn1);
            //need to supply this one with the order number and use it
            insertCommand2.Parameters.AddWithValue("@ordno", theOrder.OrderID);
            insertCommand2.Parameters.AddWithValue("@cardNumber", theOrder.Card);
            insertCommand2.Parameters.AddWithValue("@expDate", theOrder.Exp);
            insertCommand2.Parameters.AddWithValue("@CVV", theOrder.Cvv);
            insertCommand2.Parameters.AddWithValue("@billingStreet1", theOrder.BillAddr1);
            insertCommand2.Parameters.AddWithValue("@billingStreet2", theOrder.BillAddr2);
            insertCommand2.Parameters.AddWithValue("@billingCity", theOrder.Billcity);
            insertCommand2.Parameters.AddWithValue("@billingState", theOrder.Billstate);
            insertCommand2.Parameters.AddWithValue("@billingZip", theOrder.Billzip);
            insertCommand2.Parameters.AddWithValue("@cardName", theOrder.PymtName);
            //then write
            insertCommand2.ExecuteNonQuery();

            /*save shipping details*/
            //first set it up
            //string insertStatement4 = "INSERT INTO ORDERSHIPPINGDETAILS (order, shipTo, Street1,Street2,City,State,Zip) values (@order, @shipTo, @Street1,@Street2,@City,@State,@Zip)";
            string insertStatement4 = "INSERT INTO ORDERSHIPPINGDETAILS (ordId,shipTo, Street1,Street2,City,State,Zip) values (@order, @shipTo, @Street1,@Street2,@City,@State,@Zip)";
            SqlCommand insertCommand4 = new SqlCommand(insertStatement4, conn1);
            insertCommand4.Parameters.AddWithValue("@order", theOrder.OrderID);
            insertCommand4.Parameters.AddWithValue("@shipTo", theOrder.ShipTo);
            insertCommand4.Parameters.AddWithValue("@Street1", theOrder.ShipToAdd1);
            insertCommand4.Parameters.AddWithValue("@Street2", theOrder.ShiptoAdd2);
            insertCommand4.Parameters.AddWithValue("@City", theOrder.ShipCity);
            insertCommand4.Parameters.AddWithValue("@State", theOrder.ShipSt);
            insertCommand4.Parameters.AddWithValue("@Zip", theOrder.ShipZip);
            //then write

            insertCommand4.ExecuteNonQuery();

            /* Save Order Details */
            WriteDetails(theOrder, ID);
            int testid = ID; //just to see if it gets here
        }
        finally
        {
            conn1.Close();
        }

    }


    public static void WriteDetails(Order theOrder, int orderID)
    {            /*save order details*/
                 //first set it up
                 //need to adapt this idea to looping through each CartItem
        string insertStatement3;
        

        //then write
        //foreach (CartItem i in theOrder.cartList)
        int index = 0;
        while (index != -1)
        {

            insertStatement3 = "INSERT INTO ORDERDETAILS (OrderId, ProductId,Quantity, PriceEach,OrderDate) values (@orderid, @productid,@quantity, @priceeach,@orderDate)";
            SqlCommand insertCommand3 = new SqlCommand(insertStatement3, conn1);
            insertCommand3.Parameters.AddWithValue("@orderid", orderID);
            insertCommand3.Parameters.AddWithValue("@productid", theOrder.Subtotal);
            insertCommand3.Parameters.AddWithValue("@quantity", theOrder.Tax);
            insertCommand3.Parameters.AddWithValue("@priceeach", theOrder.CartList);
            insertCommand3.Parameters.AddWithValue("@orderDate", theOrder.OrderDate);

            insertCommand3.ExecuteNonQuery();

            index = theOrder.CartList.IndexAdvance(index);

        }


    }
}