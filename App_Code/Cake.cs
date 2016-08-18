using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cake
/// </summary>
public class Cake
{
    string productId;
    string name;
    string description;
    decimal unitPrice;
    string imageFile;

    public Cake() { }

    public Cake(string theProductId, string theName, string theDescription, decimal theUnitPrice, string theImageFile)
    {
        this.ProductId = theProductId;
        this.Name = theName;
        this.Description = theDescription;
        this.UnitPrice = theUnitPrice;
        this.ImageFile = theImageFile;
    }

    public string ProductId 
    { 
        get { return productId; }
        set { productId = value; }
    }
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    public string Description
    {
        get { return description; }
        set { description = value; }
    }
    public decimal UnitPrice
    {
        get { return unitPrice; }
        set { unitPrice = value; }
    }
    public string ImageFile
    {
        get { return imageFile; }
        set { imageFile = value; }
    }
}