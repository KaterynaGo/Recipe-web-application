using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCusine : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void cuisineDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        grid.DataBind();
    }

    protected void cuisineDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        grid.DataBind();
    }

    protected void cuisineDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        grid.DataBind();
    }

    protected void addCuisineButton_Click(object sender, EventArgs e)
    {
        cuisineDetailsView.ChangeMode(DetailsViewMode.Insert);
    }
}