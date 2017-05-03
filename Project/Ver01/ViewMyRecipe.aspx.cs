using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewMyRecipe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NewSearch();
    }



    private void NewSearch()
    {
        System.Web.Security.MembershipUser usr = System.Web.Security.Membership.GetUser();
        if (usr != null)
        {
            //LabelDebug.Text = ":::" + usr.ToString() + "\n";
            //LabelDebug.Text = usr.ProviderUserKey.ToString();

            SqlConnection conn;
            SqlCommand comm;
            SqlDataReader reader;
            string connectionString =
            ConfigurationManager.ConnectionStrings[
            "Assignment4"].ConnectionString;
            conn = new SqlConnection(connectionString);
            comm = new SqlCommand("SELECT UserName, RecipeName, SubmissionDate " +
        "FROM aspnet_Users INNER JOIN ProjectUserRecipe ON aspnet_Users.UserId = ProjectUserRecipe.UserId " +
        "INNER JOIN Project_Recipe ON ProjectUserRecipe.RecipeId = Project_Recipe.RecipeId " +
        "WHERE aspnet_Users.UserId = '" + usr.ProviderUserKey.ToString() + "' " +
        "ORDER BY SubmissionDate DESC", conn);




            try
            {
                conn.Open();
                reader = comm.ExecuteReader();
                //myRepeater.DataSource = reader;
                //myRepeater.DataBind();
                myGridView.DataSource = reader;
                myGridView.DataBind();
                reader.Close();
            }
            catch (Exception ex)
            {
                string script = "alert(\"ERROR BRO!: " + ex.ToString() + "\");";
                ScriptManager.RegisterStartupScript(this, GetType(),
                                      "ServerControlScript", script, true);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}