using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Order
/// </summary>
public class Order
{   
    //DateTime orderDate = DateTime.Today;
    DateTime theorderDate = DateTime.Today;
    string orderDate;

    const decimal taxrate = 0.07m;
    string orderID;
    //DateTime orderDate = DateTime.Today;
    //List<InvoiceItem> itemList = new List<InvoiceItem>(); 
    
    decimal subtotal;
    decimal discount;
    decimal tax;
    decimal orderTotal;
    string userName;
    public CartItemList cartList;

    string shipTo;
    string shiptoadd1;
    string shiptoadd2;
    string shipCity;
    string shipSt;
    string shipZip;
    string billAddr1;
    string billAddr2;
    string billcity;
    string billstate;
    string billzip;
    string card;
    string exp;
    string cvv; 
    string pymtName;
    

    public Order() 
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public Order(CartItemList theCart,string theShipTo,string theShiptoadd1,string theShiptoadd2,string theShipCity,string theShipSt,
        string theShipZip, string theBillAddr1, string theBillAddr2, string theBillcity, string theBillstate,
        string theBillzip, string theCard, string theExp,string theCvv, string thePymtName, string theUserName)
    {
        this.CartList = (theCart);
        this.ShipTo=theShipTo;
        this.ShipToAdd1=theShiptoadd1;
        this.ShiptoAdd2=theShiptoadd2;
        this.ShipCity=theShipCity;
        this.ShipSt=theShipSt;
        this.ShipZip=theShipZip;
        this.BillAddr1=theBillAddr1;
        this.BillAddr2=theBillAddr2;
        this.Billcity=theBillcity;
        this.Billstate=theBillstate;
        this.Billzip=theBillzip;
        this.Card=theCard;
        this.Exp=theExp;
        this.Cvv=theCvv;
        this.PymtName=thePymtName;
        this.UserName = theUserName;
        //this.UserName=("Jane").ToString(); //for testing
        this.OrderDate = theorderDate.ToString("MM/dd/yyyy");
    }

    public CartItemList CartList
    {
        get { return cartList; }
        set { cartList = value; }
    }

    public decimal OrderTotal
    {
        get { return orderTotal; }
        set { orderTotal = value; }
    }
    public string OrderDate
    {
        get { return orderDate; }
        set { orderDate = value; }
    }
    //public DateTime OrderDate
    //{
    //    get { return orderDate; }
    //    set { orderDate = Convert.ToDateTime; }
    //}
    public string OrderID
    {
        get { return orderID; }
        set { orderID = value; }
    }
    public decimal Discount
    {
        get { return discount; }
        set { discount = value; }
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
            //string signedInUser = HttpContext.Current.User.Identity.GetUserId();
            //UserName = signedInUser;
            userName = value;
        }
    }
    public string ShipTo 
    { 
        get {return shipTo;}
        set {shipTo=value;}
    }
    public string ShipToAdd1
    {
        get { return shiptoadd1; }
        set { shiptoadd1 = value; }
    }
    public string ShiptoAdd2
    {
        get { return shiptoadd2; }
        set { shiptoadd2 = value; }
    }
    public string ShipCity
    {
        get { return shipCity; }
        set {shipCity=value;}
    }
    public string ShipSt
    {
        get { return shipSt; }
        set {shipSt=value; }
    }
    public string ShipZip
    {
        get { return shipZip; }
        set { shipZip = value; }
    }
    public string BillAddr1
    {
        get { return billAddr1; }
        set {billAddr1 =value;}
    }
    public string BillAddr2
    {
        get { return billAddr2; }
        set { billAddr2 = value; }
    }
    public string Billcity
    {
        get { return billcity; }
        set { billcity = value; }
    }
    public string Billstate
    {
        get{return billstate;}
        set{billstate=value;}
    }
    public string Billzip
    {
        get { return billzip; }
        set { billzip = value; }
    }
    public string Card
    {
        get { return card; }
        set { card = value; }
    }
    public string Exp
    {
        get { return exp; }
        set { exp = value; }
    }
    public string Cvv
    {
        get { return cvv; }
        set { cvv = value; }
    }
    public string PymtName
    {
        get { return pymtName; }
        set { pymtName = value; }
    }
   
   public decimal CalculateDiscount() // i think this can be void? -b
   {
        DiscountDA discount = new DiscountDA();

        List<string> cakeNames = new List<string>();
        List<decimal> cakeDiscount = new List<decimal>();

        cakeNames = discount.getDiscountCakeName(); //get discount cakes from DA -working -b
        cakeDiscount = discount.getDiscountCakeAmount(); //get discount amounts from DA -working -b

        //accumulator for amount of discounts for all cakes 
        decimal amountOfDiscount = 0; 
        for(int x=0; x < CartList.Count ; x++)//for each item in the cart
        {
            //need to loop through the cakeNames list to see if selectedCakeName matches any of them
            string selectedCakeName = CartList.GetNameOfCake(x);
            int counter = 0;
            while (counter < cakeNames.Count)
            {
                if (selectedCakeName == cakeNames[counter]) //if the cake names match
                {
                    //get the discount amount out of the list
                    decimal discountAmount = cakeDiscount[counter]; 
                    //set new cake price with discount
                    amountOfDiscount = CartList.ApplyCakeDiscount(discountAmount, x); 
                    //exit loop if it matches and test the next cake
                    counter = cakeNames.Count;
                }
                else
                {
                    counter++;
                }
            }
        }

        //int quantity = CartList.GetQuantity();
        //Subtotal = 0;
        //Subtotal = CartList.GetSubtotal();

        return amountOfDiscount;
   }
    public decimal CalculateSubtotal()
    {
        Subtotal = CartList.GetSubtotal();
        return Subtotal;
    }

   public decimal CalculateTax()
   {
        Tax=0;
        //Subtotal = 0;
        Tax = Math.Round((Subtotal * taxrate),2);
        //Tax = Math.Round(((Subtotal -Discount)* taxrate), 2);
        return Tax;
   }   
    public decimal TotalOrder()
    { 
        OrderTotal = 0;
        // OrderTotal=(Subtotal-Discount)+tax;
        OrderTotal = Math.Round((Subtotal + Tax),2);
        return orderTotal;
    }


//save order method
public void SaveOrder(Order theOrder)
    {
        try
        {
                //save to DB
                OrderDA.AddNewOrder(theOrder);
        }
        catch(SqlException ex)
        {
            throw new SavingException("Something went wrong saving your order. Please send us a message via the Contact Page.");
            //error saving to DB         
        }

        finally { }
    }

public string ReorderInfo(int orderid)
{
    try
    {
        string prod ="";
        prod=OrderDA.ReorderInfo(orderid);
        return prod;
    }
    finally { }
}
    }



