using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for CartItemList
/// </summary>
public class CartItemList 
{
    private List<CartItem> cartItems;

	public CartItemList()
	{
        cartItems = new List<CartItem>();
	}

    public int Count {
        get { return cartItems.Count; }
    }

    public CartItem this[int index]
    {
        get { return cartItems[index];}
        set { cartItems[index] = value; }
    }

    public CartItem this[string id]
    {
        get { return cartItems.FirstOrDefault(c => c.Cake.ProductId == (id)); }
        //get { return cartItems.FirstOrDefault(c => c.Cake.ProductId == Convert.ToInt32(id)); }
    }

    public static CartItemList GetCart()
    {
        CartItemList cart = (CartItemList)HttpContext.Current.Session["Cart"];
        if (cart == null)
            HttpContext.Current.Session["Cart"] = new CartItemList();
        return (CartItemList)HttpContext.Current.Session["Cart"];
    }

    public void AddItem(Cake cake, int quantity)
    {
        CartItem c = new CartItem(cake, quantity);
        cartItems.Add(c);
    }
    public void RemoveAt(int index)
    {
        cartItems.RemoveAt(index);
    }
    public void Clear()
    {
        cartItems.Clear();
    }
    public decimal GetSubtotal()
    {
        decimal subtotal = 0;

        foreach (CartItem i in cartItems)
        {
            subtotal += i.ExtendedPrice;
        }
        return subtotal;
    }
}