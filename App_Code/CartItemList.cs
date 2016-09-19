using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for CartItemList
/// </summary>
public class CartItemList  : IEnumerable<CartItem>
{
    private List<CartItem> cartItems;

    public IEnumerator<CartItem> GetEnumerator()
    {
        return cartItems.GetEnumerator();
    }

    IEnumerator IEnumerable.GetEnumerator()
    {
        return cartItems.GetEnumerator();
    }

    //IEnumerator IEnumerable.GetEnumerator()
    //{
    //    return GetEnumerator();
    //}
    //public MyEnumerator GetEnumerator()
    //{
    //    return new MyEnumerator(this);
    //}

    //public class MyEnumerator
    //{
    //    int nindex;
    //    MyCollection collection;
    //    public MyEnumerator(MyCollection coll)
    //    {
    //        collection = coll;
    //    }
    //}
    //Tokens(string source, char[] delimiters)
    //{
    //    // The constructor parses the string argument into tokens.
    //    cartItems = source.Split(delimiters);
    //}

    public CartItemList()
    {
        cartItems = new List<CartItem>();
    }

    public int Count
    {
        get { return cartItems.Count; }
    }

    public CartItem this[int index]
    {
        get { return cartItems[index]; }
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
            //subtotal += i.Cake.UnitPrice;
            subtotal += Math.Round((i.Quantity * i.Cake.UnitPrice), 2);
        }
        return subtotal;
    }

    public string GetNameOfCake(int x) //get name of cake at passed-in index
    {
        string selectedCakeName = cartItems[x].Cake.Name;
        return selectedCakeName;
    }

    public decimal ApplyCakeDiscount(decimal discountAmount, int x)//set discount amount at selected index
    { 
        decimal cakePrice = cartItems[x].Cake.UnitPrice; //get the matching cake's set price
        decimal amountOfDiscount = cakePrice * discountAmount;
        cakePrice = cakePrice - amountOfDiscount; //subtract discount from price
        cartItems[x].Cake.UnitPrice = Math.Round(cakePrice,2); //set new discounted price
        if(cartItems[x].Quantity > 0) //factor in quantity if there are 2+ of same cake
        {
            int quantity = cartItems[x].Quantity;
            amountOfDiscount = amountOfDiscount * quantity;
        }
         // returning the dollar amount of discount for later use in the receipt -b 
        return Math.Round(amountOfDiscount,2);
    }
  
    public decimal DiscountAmountForSummary(decimal discountAmount, int x)
    {
        decimal cakePrice = cartItems[x].Cake.UnitPrice; //get the matching cake's set price
        decimal amountOfDiscount = cakePrice * discountAmount; //gets the discount

        if (cartItems[x].Quantity > 0) //factor in quantity if there are 2+ of same cake
        {
            int quantity = cartItems[x].Quantity;
            amountOfDiscount = amountOfDiscount * quantity;
        }
        
        return Math.Round(amountOfDiscount, 2); //returns the amount of discount(hopefully)
    }
    public int IndexAdvance(int index)
    {
        if (Count > (index+1))
        {
            index++;
        }
        else
        {
            index = -1;
        }

        return index;
    }

    public decimal GetItemsPrice(int indx)
    {
        decimal prc=0;

        CartItem item = cartItems[indx];

        prc = item.Cake.UnitPrice;
        return prc;
    }

    public string GetProdID(int indx)
    {
        string prod="";
        CartItem item = cartItems[indx];

        prod = item.Cake.ProductId;
        return prod;
    }

    public int GetQuantity(int indx)
    {
        int quant=0;
        CartItem item = cartItems[indx];
        quant = item.Quantity;
        return quant;
    }

    public void UpdateStock(CartItemList cart)
    {
        foreach (CartItem c in cart)
        {
            Cake aCake = c.Cake;

            // subtract the quantity sold from product amount on hand
            aCake.OnHand = aCake.OnHand - c.Quantity; 

            // call to DA to update the DB
            CakeDA.Update(aCake);
        }
    }

    //public int GetQuantity() //probably won't use this?
    //{
    //    int quantity = 0;
    //    foreach(CartItem ci in cartItems)
    //    {
    //        quantity += ci.Quantity;
    //        string selectedCakeName = ci.Cake.Name;
    //    }
    //    return quantity;
    //}

}

