using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Collections.Generic;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        getNewProduct();
        //  List<Cake> getCake = CakeDA.GetAllCake();
    }

    public void getNewProduct() //Gets random products to display on default page.
    {
        List<string> images = new List<string>();
        images.Add("~/Images/carrotcake.png");
        images.Add("~/Images/matchacake.png");
        images.Add("~/Images/confetticake.png");
        images.Add("~/Images/chocolatehalloweencake.png");
        images.Add("~/Images/chocolateraspberrycake.png");
        images.Add("~/Images/christmasicecreampudding.png");
        images.Add("~/Images/lemoncake.png");
       

        List<string> descriptions = new List<string>();
        descriptions.Add("Carrot Cake");
        descriptions.Add("Matcha Cake");
        descriptions.Add("Confetti Cake");
        descriptions.Add("Chocolate Halloween Cake");
        descriptions.Add("Chocolate Raspberry Cake");
        descriptions.Add("Ice Cream Cake");
        descriptions.Add("Lemon Cake");


        Random rnd = new Random(); //creates new random
        //gets four random indexes within the size of the Image List
        //then adds those four indexes to the adSpace list
        List<int> adSpace = new List<int>();

        while (adSpace.Count < 4)
        {
            int r = rnd.Next(0, images.Count);
            do
            {
                r = rnd.Next(0, images.Count);
            }while (adSpace.Contains(r));
           
            adSpace.Add(r);
        }

        //takes the four indexes and adds them to each add section for both the description and image
        Image1.ImageUrl = images[adSpace[0]]; // "~/Images/ombrecake.jpg";
        Image2.ImageUrl = images[adSpace[1]];
        Image3.ImageUrl = images[adSpace[2]];
        Image4.ImageUrl = images[adSpace[3]];
        Label1.Text = descriptions[adSpace[0]];
        Label2.Text = descriptions[adSpace[1]];
        Label3.Text = descriptions[adSpace[2]];
        Label4.Text = descriptions[adSpace[3]];
    }
}