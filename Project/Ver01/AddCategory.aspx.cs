using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddCategory : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //category
    }

    protected void categoryDetails_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        grid.DataBind();
    }

    protected void categoryDetails_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
    {
        grid.DataBind();
    }

    protected void categoryDetails_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        grid.DataBind();
    }

    protected void addCategoryButton_Click(object sender, EventArgs e)
    {
        categoryDetailsView.ChangeMode(DetailsViewMode.Insert);
    }
}