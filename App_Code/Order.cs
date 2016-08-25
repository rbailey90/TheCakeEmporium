﻿using System;
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
    DateTime orderDate = DateTime.Today;
    const decimal taxrate = 0.07m;
    int orderID;
    //DateTime orderDate = DateTime.Today;
    //List<InvoiceItem> itemList = new List<InvoiceItem>(); 
    
    decimal subtotal;
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
        string theBillzip, string theCard, string theExp,string theCvv, string thePymtName)
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

    public DateTime OrderDate
    {
        get { return orderDate; }
        set { orderDate = value; }
    }
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
    
   public decimal CalculateTax()
   {
       Tax=0;
       Subtotal = 0;
       Subtotal = CartList.GetSubtotal();
       Tax = Math.Round((Subtotal * taxrate), 2);
       return Tax;
   }   
    public decimal TotalOrder()
    { 
        OrderTotal = 0;
        OrderTotal=Subtotal+tax;
        return orderTotal;
    }

    
//save order method



}