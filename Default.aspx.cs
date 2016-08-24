using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        getNewProduct();
        //  List<Cake> getCake = CakeDA.GetAllCake();
    }

    public void getNewProduct() //Gets random products to display on default page.
    {
        Random rnd = new Random();

        List<string> images = new List<string>();
        images.Add("~/Images/ombrecake.jpg");
        images.Add("~/Images/smchococake.jpg");
        images.Add("~/Images/rumcake.jpg");
        images.Add("~/Images/redvelvet.jpg");
        images.Add("~/Images/rainbowcake.jpg");
        images.Add("~/Images/purplecake.jpg");


        List<string> descriptions = new List<string>();
        descriptions.Add("This is an Ombrecake");
        descriptions.Add("This is a smChococake... your guess is as good as ours on what that even is.");
        descriptions.Add("This is a rum cake, It will get you drunk");
        descriptions.Add("This is a red velvet cake, made from 100% velvet");
        descriptions.Add("This is a rainbow cake, it has many colors in it.");
        descriptions.Add("This is a purple cake, it's Purple!!!!!!!");

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

    protected void btnSubmitFAQ_Click(object sender, EventArgs e)
    {
       
    }
}