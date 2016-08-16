using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for InvoiceItem
/// </summary>
public class CartItem
{
    Cake item;
    int quantity;

	public CartItem()    {}

    public CartItem(Cake theCake, int theQuantity)
    {
        this.item=theCake;
        this.quantity=theQuantity;
    }

    public Cake Item
    {
        get{return item;}
        set{item=value;}
    }

    public int Quantity
    {
        get{return quantity;}
        set{quantity=value;}
    }

}