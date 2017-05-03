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
            LoadLists();
        }
    }

    protected void addButton_Click(object sender, EventArgs e)
    {
        System.Web.Security.MembershipUser usr = System.Web.Security.Membership.GetUser();
        if (usr != null)
        {
            //LabelDebug.Text = ":::" + usr.ToString() + "\n";
            //LabelDebug.Text = usr.ProviderUserKey.ToString();

            
            string script = "alert(\"date: " + Calendar1.SelectedDate.ToShortDateString() + "\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);





            if (Page.IsValid)
            {
                SqlConnection conn;
                SqlCommand comm;
                SqlDataReader reader;
                string connectionString =
                ConfigurationManager.ConnectionStrings[
                "Assignment4"].ConnectionString;
                conn = new SqlConnection(connectionString);

                comm = new SqlCommand("MyAddProcedure2", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;

                comm.Parameters.Add("@RecipeName", System.Data.SqlDbType.NVarChar, 50);
                comm.Parameters["@RecipeName"].Value = recipeNameTextBox.Text;

                comm.Parameters.Add("@CategoryId", System.Data.SqlDbType.Int);
                comm.Parameters["@CategoryId"].Value = categoryList.SelectedItem.Value;

                comm.Parameters.Add("@CuisineId", System.Data.SqlDbType.Int);
                comm.Parameters["@CuisineId"].Value = cuisineList.SelectedItem.Value;

                comm.Parameters.Add("@CookingTime", System.Data.SqlDbType.Int);
                comm.Parameters["@CookingTime"].Value = cookingTimeTextBox.Text;

                comm.Parameters.Add("@Portions", System.Data.SqlDbType.Int);
                comm.Parameters["@Portions"].Value = portionsTextBox.Text;

                comm.Parameters.Add("@Privacy", System.Data.SqlDbType.Int);
                comm.Parameters["@Privacy"].Value = privacyList.SelectedItem.Value;

                comm.Parameters.Add("@Description", System.Data.SqlDbType.NVarChar, 500);
                comm.Parameters["@Description"].Value = descriptionTextBox.Text;

                comm.Parameters.Add("@SubmissionDate", System.Data.SqlDbType.NVarChar, 10);
                comm.Parameters["@SubmissionDate"].Value = Calendar1.SelectedDate.ToShortDateString();

                // Output
                comm.Parameters.Add("@AddedRecipeId", System.Data.SqlDbType.Int);
                comm.Parameters["@AddedRecipeId"].Direction = System.Data.ParameterDirection.Output;

                int returnId = -1;

                try
                {
                    conn.Open();
                    //////reader = comm.ExecuteReader();
                    //myRepeater.DataSource = reader;
                    //myRepeater.DataBind();
                    //////reader.Close();
                    //myRepeater.Visible = true;

                    //using (var dr = comm.ExecuteReader())
                    //{
                    //    // do some work here
                    //    int returnId = Convert.ToInt32(comm.Parameters["@AddedRecipeId"].Value);
                    //    dbErrorLabel.ForeColor = System.Drawing.Color.Green;
                    //    dbErrorLabel.Text = "Succes ADDING the RECIPE!<br />" +
                    //                        "Added Recipe Id: " + returnId;
                    //}


                    comm.ExecuteNonQuery();

                    returnId = Convert.ToInt32(comm.Parameters["@AddedRecipeId"].Value);
                    dbErrorLabel.ForeColor = System.Drawing.Color.Green;
                    dbErrorLabel.Text = "Succes ADDING the RECIPE!<br />" +
                                        "Added Recipe Id: " + returnId;

                }
                catch (Exception ex)
                {
                    dbErrorLabel.ForeColor = System.Drawing.Color.Red;
                    dbErrorLabel.Text = "Error ADDING the RECIPE!<br /> + " + ex.ToString();
                }



                comm = new SqlCommand("InsertToProjectUserRecipe", conn);
                comm.CommandType = System.Data.CommandType.StoredProcedure;


                // Add to mapping table.
                comm.Parameters.Add("@UserId", System.Data.SqlDbType.UniqueIdentifier);
                comm.Parameters["@UserId"].Value = usr.ProviderUserKey;

                comm.Parameters.Add("@RecipeId", System.Data.SqlDbType.Int);
                comm.Parameters["@RecipeId"].Value = returnId;

                try
                {

                    
                    comm.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    dbErrorLabel.ForeColor = System.Drawing.Color.Red;
                    dbErrorLabel.Text = "Error ADDING to ProjectUserRecipe!<br /> + " + ex.ToString();
                }
                finally
                {
                    conn.Close();
                }


            }

        }
        else
        {
            string script = "alert(\"ERROR: usr is NULL!!\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);
        }

        //Add2();
    }

    private void Add()
    {
        //if (Page.IsValid)
        //{
        //    SqlConnection conn;
        //    SqlCommand comm;
        //    SqlDataReader reader;
        //    string connectionString =
        //    ConfigurationManager.ConnectionStrings[
        //    "Assignment4"].ConnectionString;
        //    conn = new SqlConnection(connectionString);

        //    comm = new SqlCommand("MyAddProcedure", conn);
        //    comm.CommandType = System.Data.CommandType.StoredProcedure;

        //    comm.Parameters.Add("@RecipeName", System.Data.SqlDbType.NVarChar, 50);
        //    comm.Parameters["@RecipeName"].Value = recipeNameTextBox.Text;

        //    comm.Parameters.Add("@CategoryId", System.Data.SqlDbType.Int);
        //    comm.Parameters["@CategoryId"].Value = categoryList.SelectedItem.Value;

        //    comm.Parameters.Add("@CuisineId", System.Data.SqlDbType.Int);
        //    comm.Parameters["@CuisineId"].Value = cuisineList.SelectedItem.Value;

        //    comm.Parameters.Add("@CookingTime", System.Data.SqlDbType.Int);
        //    comm.Parameters["@CookingTime"].Value = cookingTimeTextBox.Text;

        //    comm.Parameters.Add("@Portions", System.Data.SqlDbType.Int);
        //    comm.Parameters["@Portions"].Value = portionsTextBox.Text;

        //    comm.Parameters.Add("@Privacy", System.Data.SqlDbType.Int);
        //    comm.Parameters["@Privacy"].Value = privacyList.SelectedItem.Value;

        //    comm.Parameters.Add("@Description", System.Data.SqlDbType.NVarChar, 500);
        //    comm.Parameters["@Description"].Value = descriptionTextBox.Text;

        //    try
        //    {
        //        conn.Open();
        //        reader = comm.ExecuteReader();
        //        //myRepeater.DataSource = reader;
        //        //myRepeater.DataBind();
        //        reader.Close();
        //        //myRepeater.Visible = true;
        //        dbErrorLabel.ForeColor = System.Drawing.Color.Green;
        //        dbErrorLabel.Text = "Succes ADDING the RECIPE!<br />";
        //    }
        //    catch
        //    {
        //        dbErrorLabel.ForeColor = System.Drawing.Color.Red;
        //        dbErrorLabel.Text = "Error ADDING the RECIPE!<br />";
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }
        //}
    }

    // Insert UserRecipe MappingTable.
    private void AddToMappingTable() { }


    // Insert Recipe.
    private void Add2()
    {
        //if (Page.IsValid)
        //{
        //    SqlConnection conn;
        //    SqlCommand comm;
        //    SqlDataReader reader;
        //    string connectionString =
        //    ConfigurationManager.ConnectionStrings[
        //    "Assignment4"].ConnectionString;
        //    conn = new SqlConnection(connectionString);

        //    comm = new SqlCommand("MyAddProcedure2", conn);
        //    comm.CommandType = System.Data.CommandType.StoredProcedure;

        //    comm.Parameters.Add("@RecipeName", System.Data.SqlDbType.NVarChar, 50);
        //    comm.Parameters["@RecipeName"].Value = recipeNameTextBox.Text;

        //    comm.Parameters.Add("@CategoryId", System.Data.SqlDbType.Int);
        //    comm.Parameters["@CategoryId"].Value = categoryList.SelectedItem.Value;

        //    comm.Parameters.Add("@CuisineId", System.Data.SqlDbType.Int);
        //    comm.Parameters["@CuisineId"].Value = cuisineList.SelectedItem.Value;

        //    comm.Parameters.Add("@CookingTime", System.Data.SqlDbType.Int);
        //    comm.Parameters["@CookingTime"].Value = cookingTimeTextBox.Text;

        //    comm.Parameters.Add("@Portions", System.Data.SqlDbType.Int);
        //    comm.Parameters["@Portions"].Value = portionsTextBox.Text;

        //    comm.Parameters.Add("@Privacy", System.Data.SqlDbType.Int);
        //    comm.Parameters["@Privacy"].Value = privacyList.SelectedItem.Value;

        //    comm.Parameters.Add("@Description", System.Data.SqlDbType.NVarChar, 500);
        //    comm.Parameters["@Description"].Value = descriptionTextBox.Text;

        //    comm.Parameters.Add("@SubmissionDate", System.Data.SqlDbType.NVarChar, 10);
        //    comm.Parameters["@SubmissionDate"].Value = Calendar1.SelectedDate.ToShortDateString();

        //    // Output
        //    comm.Parameters.Add("@AddedRecipeId", System.Data.SqlDbType.Int);
        //    comm.Parameters["@AddedRecipeId"].Direction = System.Data.ParameterDirection.Output;



        //    try
        //    {
        //        conn.Open();
        //        //////reader = comm.ExecuteReader();
        //        //myRepeater.DataSource = reader;
        //        //myRepeater.DataBind();
        //        //////reader.Close();
        //        //myRepeater.Visible = true;

        //        //using (var dr = comm.ExecuteReader())
        //        //{
        //        //    // do some work here
        //        //    int returnId = Convert.ToInt32(comm.Parameters["@AddedRecipeId"].Value);
        //        //    dbErrorLabel.ForeColor = System.Drawing.Color.Green;
        //        //    dbErrorLabel.Text = "Succes ADDING the RECIPE!<br />" +
        //        //                        "Added Recipe Id: " + returnId;
        //        //}


        //        comm.ExecuteNonQuery();
                
        //        dbErrorLabel.ForeColor = System.Drawing.Color.Green;
        //        dbErrorLabel.Text = "Succes ADDING the RECIPE!<br />" +
        //                            "Added Recipe Id: " + comm.Parameters["@AddedRecipeId"].Value;

        //    }
        //    catch(Exception e)
        //    {
        //        dbErrorLabel.ForeColor = System.Drawing.Color.Red;
        //        dbErrorLabel.Text = "Error ADDING the RECIPE!<br /> + " + e.ToString();
        //    }






        //    // Add to mapping table.
        //    comm.Parameters.Add("@UserId", System.Data.SqlDbType.UniqueIdentifier);
        //    comm.Parameters["@UserId"].Value = usr.ProviderUserKey.ToString();

        //    comm.Parameters.Add("@RecipeId", System.Data.SqlDbType.Int);
        //    comm.Parameters["@@RecipeId"].Value = Convert.ToInt32(comm.Parameters["@AddedRecipeId"].Value);

        //    try
        //    {
 
        //        comm = new SqlCommand("InsertToProjectUserRecipe", conn);
        //        comm.ExecuteNonQuery();
        //    }
        //    catch (Exception e)
        //    {
        //        dbErrorLabel.ForeColor = System.Drawing.Color.Red;
        //        dbErrorLabel.Text = "Error ADDING to ProjectUserRecipe!<br /> + " + e.ToString();
        //    }
        //    finally
        //    {
        //        conn.Close();
        //    }


        //}
    }

    private void LoadLists()
    {
        SqlConnection conn;
        SqlCommand comm, comm2;
        SqlDataReader reader;
        string connectionString =
        ConfigurationManager.ConnectionStrings[
        "Assignment4"].ConnectionString;
        conn = new SqlConnection(connectionString);

        // Command for populating the list:category.
        comm = new SqlCommand(
        "SELECT CategoryId, CategoryName FROM Category", conn);
        // Command for populating the list:cuisine.
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
        descriptionTextBox.Text = "";
    }
}