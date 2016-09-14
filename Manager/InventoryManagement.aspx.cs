using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Manager_InventoryManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

 
    protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        // if attempting to store a null value where the database does not allow
        if(e.Exception != null)
        {
            lblError.Text = "A database error has occured. " + "Message: " + e.Exception.Message;
            e.ExceptionHandled = true;
            e.KeepInEditMode = true;
        }
        // if the row has already been update or deleted
        else if(e.AffectedRows == 0)
        {
            lblError.Text = "Another user may have updated that category. Please try again. ";
        }

    }

    protected void btnAddCake_Click(object sender, EventArgs e)
    {
        // Manager can add cake to DB
        SqlDataSource1.InsertParameters["ProductId"].DefaultValue = txtID.Text;
        SqlDataSource1.InsertParameters["Name"].DefaultValue = txtName.Text;
        SqlDataSource1.InsertParameters["Description"].DefaultValue = txtDescript.Text;
        SqlDataSource1.InsertParameters["Image"].DefaultValue = txtImageFile.Text;
        SqlDataSource1.InsertParameters["UnitPrice"].DefaultValue = txtPrice.Text;
        SqlDataSource1.InsertParameters["OnHand"].DefaultValue = txtOnHand.Text;

        try
        {
            // insert to Products table in database
            SqlDataSource1.Insert();

            // clear textboxes
            txtID.Text = "";
            txtName.Text = "";
            txtDescript.Text = "";
            txtImageFile.Text = "";
            txtPrice.Text = "";
            txtOnHand.Text = "";
        }
        catch (Exception ex)
        {
            lblError.Text = "A database error has occurred. " + "Message: " + ex.Message;
        }

        
    }


    protected void btnUpload_Click(object sender, EventArgs e)
    {
        // Manager is able to upload a file to see product on site
        if (FileUpload1.HasFile)
        {
            try
            {
                // only allowing .png files to be uploaded
                if (FileUpload1.PostedFile.ContentType == "image/png")
                {
                    // only allowing the file to be 500 kb or less
                    if (FileUpload1.PostedFile.ContentLength <= 500000)
                    {
                        string fileName = Path.GetFileName(FileUpload1.PostedFile.FileName);
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/Products/") + fileName);
                        lblErrorImage.Text = "Image file was uploaded.";
                    }
                    else
                    {
                        lblErrorImage.Text = "File must be less than 150 kb.";
                    }
                }
                else
                {
                    lblErrorImage.Text = "Only .png files are accepted.";
                }
            }
            catch (Exception ex)
            {
                lblErrorImage.Text = "Image file was not uploaded. The following error occured: " + ex.Message;
            }
        }
    }
}