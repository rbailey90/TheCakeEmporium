using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for InvoiceItem
/// </summary>
public class CartItem
{
    Cake cake;
    int quantity;

	public CartItem()    {}

    public CartItem(Cake theCake, int theQuantity)
    {
        this.cake=theCake;
        this.quantity=theQuantity;
    }

    public Cake Cake
    {
        get{return cake;}
        set{cake=value;}
    }

    public int Quantity
    {
        get{return quantity;}
        set{quantity=value;}
    }
    
    public void AddQuantity(int quantity)
    {
        this.Quantity += quantity;
    }

    public string Display()
    {
        string displayString = string.Format("{0} ({1} at {2} each)",
            Cake.Name, Quantity.ToString(),
            Cake.UnitPrice.ToString("c"));
        return displayString;
    }
}