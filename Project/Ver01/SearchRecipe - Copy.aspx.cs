using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddRecipe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // If it's not a POST request.
        if (!IsPostBack)
        {
            LoadCategoryList();
        }
    }

    private void LoadCategoryList()
    {
        SqlConnection conn;
        SqlCommand comm, comm2;
        SqlDataReader reader;
        string connectionString =
        ConfigurationManager.ConnectionStrings[
        "Assignment4"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
        "SELECT CategoryId, CategoryName FROM Category", conn);
        comm2 = new SqlCommand(
        "SELECT CuisineId, CuisineName FROM Cuisine", conn);
        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            categoryList.DataSource = reader;
            categoryList.DataValueField = "CategoryId";
            categoryList.DataTextField = "CategoryName";
            categoryList.DataBind();
            reader.Close();

            reader = comm2.ExecuteReader();
            cuisineList.DataSource = reader;
            cuisineList.DataValueField = "CuisineId";
            cuisineList.DataTextField = "CuisineName";
            cuisineList.DataBind();
            reader.Close();

        }
        catch
        {
            dbErrorLabel.Text =
            "Error loading the list of category!<br />";
        }
        finally
        {
            conn.Close();
        }
        // Clear the TextBoxes.
        recipeNameTextBox.Text = "";
        cookingTimeTextBox.Text = "";
        portionsTextBox.Text = "";
        //privacyTextBox.Text = "";
        //privacyList.SelectedItem.Value = 0;
        descriptionTextBox.Text = "";
    }

    protected void searchButton_Click(object sender, EventArgs e)
    {
        //SqlConnection conn;
        //SqlCommand comm;
        //SqlDataReader reader;
        //string connectionString =
        //ConfigurationManager.ConnectionStrings[
        //"Assignment4"].ConnectionString;
        //conn = new SqlConnection(connectionString);
        // OldSearch();
        // Long SQL command version.
        //comm = new SqlCommand(
        //"SELECT RecipeName, CategoryName, CuisineName, CookingTime, Portions, Privacy, Description " +
        //"FROM Recipe " +
        //"INNER JOIN Category ON Recipe.CategoryId = Category.CategoryId " +
        //"INNER JOIN Cuisine ON Recipe.CuisineId = Cuisine.CuisineId " +
        //"WHERE RecipeName LIKE @RecipeName " +
        //"AND CategoryName LIKE @CategoryName " +
        //"AND CuisineName LIKE @CuisineName " +
        //"AND CookingTime LIKE @CookingTime " +
        //"AND Portions LIKE @Portions " +
        //"AND Privacy LIKE @Privacy " +
        //"AND Description LIKE @Description ", conn);

        // Store Procedure SQL command version.

        NewSearch();
        //    SqlConnection conn;
        //    SqlCommand comm;
        //    SqlDataReader reader;
        //    string connectionString =
        //    ConfigurationManager.ConnectionStrings[
        //    "Assignment4"].ConnectionString;
        //    conn = new SqlConnection(connectionString);
        //    comm = new SqlCommand(
        // "Select RecipeName, CookingTime, Portions, Description, UserName, Privacy " +
        //"From [Assignment4].[dbo].[User] " +
        //"inner Join UserRecipe on UserRecipe.UserId = [Assignment4].[dbo].[User].UserId " +
        //"inner Join Recipe on Recipe.RecipeId=UserRecipe.RecipeId " +
        //"where Privacy = 0" +
        //" Union " +
        //"Select RecipeName, CookingTime, Portions, Description, UserName, Privacy " +
        //"From [Assignment4].[dbo].[User] " +
        //"inner Join UserRecipe on UserRecipe.UserId = [Assignment4].[dbo].[User].UserId " +
        //"inner Join Recipe on Recipe.RecipeId=UserRecipe.RecipeId " +
        //"where privacy = 1 and UserName= 2", conn);

        //    try
        //    {
        //        conn.Open();
        //        reader = comm.ExecuteReader();
        //        //myRepeater.DataSource = reader;
        //        //myRepeater.DataBind();
        //        myGridView.DataSource = reader;
        //        myGridView.DataBind();
        //        reader.Close();
        //        searchResultsLabel.Text = "Search Results:";
        //        //myRepeater.Visible = true;
        //    }
        //    catch
        //    {
        //        dbErrorLabel.Text =
        //        "Error loading the details!<br />";
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }


    }
    private void OldSearch()
    {
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString =
        ConfigurationManager.ConnectionStrings[
        "Assignment4"].ConnectionString;
        conn = new SqlConnection(connectionString);

        comm = new SqlCommand("MySearchProcedure", conn);
        comm.CommandType = System.Data.CommandType.StoredProcedure;

        comm.Parameters.Add("@RecipeName", System.Data.SqlDbType.NVarChar);
        comm.Parameters["@RecipeName"].Value = string.Format("%{0}%", recipeNameTextBox.Text);
        comm.Parameters.Add("@CategoryName", System.Data.SqlDbType.NVarChar);
        comm.Parameters["@CategoryName"].Value = string.Format("%{0}%", categoryList.SelectedItem.Text);
        comm.Parameters.Add("@CuisineName", System.Data.SqlDbType.NVarChar);
        comm.Parameters["@CuisineName"].Value = string.Format("%{0}%", cuisineList.SelectedItem.Text); ;
        comm.Parameters.Add("@CookingTime", System.Data.SqlDbType.NVarChar);
        comm.Parameters["@CookingTime"].Value = string.Format("%{0}%", cookingTimeTextBox.Text);
        comm.Parameters.Add("@Portions", System.Data.SqlDbType.NVarChar);
        comm.Parameters["@Portions"].Value = string.Format("%{0}%", portionsTextBox.Text);

        //comm.Parameters.Add("@Privacy", System.Data.SqlDbType.NVarChar);
        //comm.Parameters["@Privacy"].Value = string.Format("%{0}%", privacyTextBox.Text);
        comm.Parameters.Add("@Privacy", System.Data.SqlDbType.NVarChar);
        comm.Parameters["@Privacy"].Value = string.Format("%{0}%", privacyList.SelectedItem.Value);

        comm.Parameters.Add("@Description", System.Data.SqlDbType.NVarChar);
        comm.Parameters["@Description"].Value = string.Format("%{0}%", descriptionTextBox.Text);

        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            //myRepeater.DataSource = reader;
            //myRepeater.DataBind();
            myGridView.DataSource = reader;
            myGridView.DataBind();
            reader.Close();
            searchResultsLabel.Text = "Search Results:";
            //myRepeater.Visible = true;
        }
        catch
        {
            dbErrorLabel.Text =
            "Error loading the details!<br />";
        }
        finally
        {
            conn.Close();
        }
    }
     private void NewSearch()
    {
        System.Web.Security.MembershipUser usr = System.Web.Security.Membership.GetUser();
        SqlConnection conn;
        SqlCommand comm;
        SqlDataReader reader;
        string connectionString =
        ConfigurationManager.ConnectionStrings[
        "Assignment4"].ConnectionString;
        conn = new SqlConnection(connectionString);
        comm = new SqlCommand(
     "Select RecipeName, CookingTime, Portions, Description, UserName, Privacy " +
    "From [Assignment4].[dbo].[User] " +
    "inner Join UserRecipe on UserRecipe.UserId = [Assignment4].[dbo].[User].UserId " +
    "inner Join Recipe on Recipe.RecipeId=UserRecipe.RecipeId " +
    "where Privacy = 0"+
        "Union " +
       "Select RecipeName, CookingTime, Portions, Description, UserName, Privacy " +
       "From [Assignment4].[dbo].[User] " +
       "inner Join UserRecipe on UserRecipe.UserId = [Assignment4].[dbo].[User].UserId " +
       "inner Join Recipe on Recipe.RecipeId=UserRecipe.RecipeId " +
       "where privacy = 1 and UserName=" + usr.ToString() , conn);
    



        try
        {
            conn.Open();
            reader = comm.ExecuteReader();
            //myRepeater.DataSource = reader;
            //myRepeater.DataBind();
            myGridView.DataSource = reader;
            myGridView.DataBind();
            reader.Close();
            searchResultsLabel.Text = "Search Results:";
            //myRepeater.Visible = true;
        }
        catch
        {
            dbErrorLabel.Text =
            "Error loading the details!<br />";
        }
        finally
        {
            conn.Close();
        }
    }
}