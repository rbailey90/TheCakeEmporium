using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Cake
/// </summary>
public class Cake
{


    public Cake() { }

    public int ProductId { get; set; }
    public string Name { get; set; }
    public string Description { get; set; }
    public decimal UnitPrice { get; set; }
    public string ImageFile { get; set; }
    public int OnHand { get; set; }
}