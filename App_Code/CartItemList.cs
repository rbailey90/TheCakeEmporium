using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Collections;

/// <summary>
/// Summary description for CartItemList
/// </summary>
public class CartItemList  //: IEnumerable
{
    private List<CartItem> cartItems;

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

    ////get enumerator??


    // Declare the enumerator class:
    //public class MyEnumerator
    //{
    //    int nIndex;
    //    CartItemList collection;
    //    public MyEnumerator(CartItemList coll)
    //    {
    //        collection = coll;
    //        nIndex = -1;
    //    }

    //    public bool MoveNext()
    //    {
    //        nIndex++;
    //        return (nIndex < collection.cartItems.GetLength(0));
    //    }

    //    public int Current
    //    {
    //        get
    //        {
    //            return (collection.CartItems([nIndex]);
    //        }
    //    }
    //}

    //public interface IEnumerable
    //{
    //    IEnumerator GetEnumerator();
    //}

}



    // The IEnumerable interface requires implementation of method GetEnumerator.
   /* public IEnumerator GetEnumerator()
    {
        return new TokenEnumerator(this);
    }*/
    // Declare an inner class that implements the IEnumerator interface.
    /*private class TokenEnumerator : IEnumerator
    {
        private int _currentIndex = -1;
        private CartItemList t;

        public TokenEnumerator(CartItemList t)
        {
            this.t = t;
        }*/

        // The IEnumerator interface requires a MoveNext method.
        //public bool MoveNext()
        //{
        //    if (position < t.cartItems.Length - 1)
        //    {
        //        position++;
        //        return true;
        //    }
        //    else
        //    {
        //        return false;
        //    }
        //}



        //// The IEnumerator interface requires a Reset method.
        //public void Reset()
        //{
        //    position = -1;
        //}

        //// The IEnumerator interface requires a Current method.
        //public object Current
        //{
        //    get
        //    {
        //        return t.cartItems[position];
        //    }
        //}
