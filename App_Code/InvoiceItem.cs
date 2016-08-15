using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for InvoiceItem
/// </summary>
public class InvoiceItem
{
    Cake item;
    int quantity;

	public InvoiceItem()    {}

    public InvoiceItem(Cake theCake, int theQuantity)
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