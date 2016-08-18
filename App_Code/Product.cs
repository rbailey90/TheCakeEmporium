using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Products
/// </summary>
public class Product
{
    public int ProductID { get; set; }
    public string Name { get; set; }
    public string Desc { get; set; }
    public string Image { get; set; }
    public float Price { get; set; }
    public int OnHand { get; set; }

    public Product()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public Product(int productId, string name, string desc, string imageLink, float price, int onHand)
    {
        this.ProductID = productId;
        this.Name = name;
        this.Desc = desc;
        this.Image = imageLink;
        this.Price = price;
        this.OnHand = onHand;
    }

}