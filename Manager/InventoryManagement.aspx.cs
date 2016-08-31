using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Manager_InventoryManagement : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // raising an event when one of the rows is being updated
    protected void GridView1_RowUpdating(object send, GridViewUpdatedEventArgs e)
    {
        if(GridView1 == null) // save spot here!
        {
            lblError.Text = "Error has occurred.";
            e.KeepInEditMode = true;
        }
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
        // Manager can add cake to DB, I'll come back to this
    }
}