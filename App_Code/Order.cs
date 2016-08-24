using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

/// <summary>
/// Summary description for Order
/// </summary>
public class Order
{
    const decimal taxrate = 0.07m;
    int orderID;
    //DateTime orderDate = DateTime.Today;
    //List<InvoiceItem> itemList = new List<InvoiceItem>(); 
    
    decimal subtotal;
    decimal tax;
    decimal orderTotal;
    string userName;
    

    public Order() 
	{
		//
		// TODO: Add constructor logic here
		//
	}

    /* List<InvoiceItem> ItemList
    {
        get { return itemList; }
        set { itemList = value; }
    }*/

    public decimal OrderTotal
    {
        get { return orderTotal; }
        set { orderTotal = value; }
    }

    /*public DateTime OrderDate
    {
        get { return orderDate; }
        set { orderDate = value; }
    }*/
    public int OrderID
    {
        get { return orderID; }
        set { orderID = value; }
    }
    public decimal Subtotal
    {
        get { return subtotal; }
        set { subtotal = value; }
    }
    public decimal Tax
    {
        get{return tax;}
        set{tax=value;}
    }
    public string UserName
    {
        get { return userName; }
        set {
            string signedInUser = HttpContext.Current.User.Identity.GetUserId();
            UserName = signedInUser;
        }
    }
    /*
   public void AddItem(InvoiceItem item)
   {
       itemList.Add(item);            
   }
   public void DeleteItem(InvoiceItem item)
   {
       itemList.Remove(item);
   }
   
   public decimal CalculateTax()
   {
       Tax=0;
       Subtotal=0;
       foreach(InvoiceItem i in ItemList)
       {
           Subtotal+=i.Item.Price;
       }
       Tax = Math.Round((Subtotal * taxrate), 2);
       return Tax;
   }   */
    public decimal TotalOrder()
    { 
        OrderTotal = 0;
        OrderTotal=Subtotal+tax;
        return orderTotal;
    }
    
//save order method



}