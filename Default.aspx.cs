using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
//using System.Collections.Generic;

public partial class _Default : System.Web.UI.Page
{
   
    protected void Page_PreInit(object sender, EventArgs e)
    {
        int daysUntil = getDaysUntilHalloween();
        if (!IsPostBack)

        //int daysUntilBirthday == getDaysUntilBirthday();

        if (daysUntil <= 31)
        {
            Page.Theme = "halloween";  
        }
        if (getDaysUntilBirthday() <= 131)
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
        double daysUntilBirthday = 1000;
        var signedInUser = HttpContext.Current.User.Identity.GetUserName();
        //if there is a user currently signed in 
        //then get the users date of birth and do calculations
        if (User.Identity.IsAuthenticated) //if current user is signed in
        {            
            var userId = User.Identity.GetUserId(); //get current users id

            UserManager<IdentityUser> userManager = new UserManager<IdentityUser>(new UserStore<IdentityUser>());

            //ok now i have birthday stuff
            DateTime userBirthday = UserDA.getBirthday(userId);
            DateTime todaysDate = System.DateTime.Now.Date;
            TimeSpan t = todaysDate.Subtract(userBirthday);


            //Am able to get total days from when was born to current day 
            //Need to figure out way to remove the amount of years and only focus on 
            //Days left in current month, right now it says there are 27 days left till bday
            //On Admin but it's actually only 5 days.

            //Might need to get Year, Day, Month in seperate variables
            //Then only Subtract Days.... maybe
            //TimeSpan t = todaysDate.Date - userBirthday.Date;
            daysUntilBirthday = (int) t.TotalDays;
            double dyears = daysUntilBirthday / 360;
            int years = Convert.ToInt16(dyears);
            int yearsToDays = years * 360;
            double timeleft = daysUntilBirthday - yearsToDays;

        }

        return Convert.ToInt16(daysUntilBirthday);
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
        images.Add("~/Images/HomepageImages/carrotcake.png");
        images.Add("~/Images/HomepageImages/matchacake.png");
        images.Add("~/Images/HomepageImages/rainbowconfetticake.png");
        images.Add("~/Images/HomepageImages/poppyseedcake.png");
        images.Add("~/Images/HomepageImages/lemoncake.png");
        //can add more images later
 
        List<string> descriptions = new List<string>();
        descriptions.Add("Carrot Cake");
        descriptions.Add("Matcha Cake");
        descriptions.Add("Confetti Cake");
        descriptions.Add("Poppyseed Cake");
        descriptions.Add("Lemon Cake");
        //descriptions must match images in order

//CAKE DISCOUNTS start here
        //string names must match the cake name in Product table
        List<string> cakeNames = new List<string>();
        cakeNames.Add("Carrot Cake");
        cakeNames.Add("Matcha Mousse Cake");
        cakeNames.Add("Rainbow Confetti Cake");
        cakeNames.Add("Poppy Seed Cake");
        cakeNames.Add("Lemon Cake");
        //can maybe make a discountDA class that will read the cake names in from DA?
        
        //save list of cakes to a session variable
        Session["cakeSpecials"] = cakeNames;

        Random rnd = new Random(); //creates new random
        //gets four random indexes within the size of the Image List
        //then adds those four indexes to the adSpace list
        List<int> featuredProducts = new List<int>();

        while (featuredProducts.Count < 4)
        {
            int r = rnd.Next(0, images.Count);
            do
            {
                r = rnd.Next(0, images.Count);
            }while (featuredProducts.Contains(r));
           
            featuredProducts.Add(r);
        }

        //takes the four indexes and adds them to each add section for both the description and image
        Image1.ImageUrl = images[featuredProducts[0]]; // "~/Images/ombrecake.jpg";
        Image2.ImageUrl = images[featuredProducts[1]];
        Image3.ImageUrl = images[featuredProducts[2]];
        Image4.ImageUrl = images[featuredProducts[3]];
        Label1.Text = descriptions[featuredProducts[0]];
        Label2.Text = descriptions[featuredProducts[1]];
        Label3.Text = descriptions[featuredProducts[2]];
        Label4.Text = descriptions[featuredProducts[3]];
    }
}