using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Collections.Generic;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        int daysUntil = getDaysUntilHalloween();
        int daysUntilBirthday = getDaysUntilBirthday();

        if (daysUntil <= 31)
        {
            Page.Theme = "halloween";  
        }
        if (daysUntilBirthday <= 131)
        {
            Page.Theme = "birthday";
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        int daysUntilHalloween = getDaysUntilHalloween();
        if (lblSecondaryMessage != null && Page.Theme=="halloween" && Page.Theme != "birthday")
        {
            switch (daysUntilHalloween)
            {
                case 0: //if it's october 31st
                    lblSecondaryMessage.Text = "Happy Halloween!";
                    break;
                case 1: //if it's october 30th
                    lblSecondaryMessage.Text = "Tomorrow is Halloween Day!";
                    break;
                default:
                    lblSecondaryMessage.Text = string.Format("There are only {0} days left until Halloween!", daysUntilHalloween);
                    break;
            }
        }
        getNewProduct();
        //  List<Cake> getCake = CakeDA.GetAllCake();
    }
    public int getDaysUntilBirthday()
    {
        double daysUntilBirthday = 1000; //change this when there's a user birthday field!!!!!
        return (int)daysUntilBirthday;
    }
    public int getDaysUntilHalloween()
    {
        DateTime todaysDate = new DateTime();
        todaysDate = System.DateTime.Now.Date;
        DateTime halloweenDay = new DateTime(DateTime.Today.Year, 10, 31); //year set to current year so it will constantly update

        TimeSpan t = halloweenDay - todaysDate;
        double daysUntil = t.TotalDays;

        return (int)daysUntil;
    }
    public void getNewProduct() //Gets random products to display on default page.
    {
        List<string> images = new List<string>();
        images.Add("~/Images/Products/carrotcake.png");
        images.Add("~/Images/Products/matchacake.png");
        images.Add("~/Images/Products/confetticake.png");
        images.Add("~/Images/Products/chocolatehalloweencake.png");
        images.Add("~/Images/Products/chocolateraspberrycake.png");
        images.Add("~/Images/Products/christmasicecreampudding.png");
        images.Add("~/Images/Products/lemoncake.png");
       

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