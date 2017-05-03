using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Security;


public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();

        }
    }

    protected void BindGrid()
    {

        SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["LocalSqlServer"].ConnectionString);
        string query = "Select Usr.UserName,RL.RoleName " +
                            "from dbo.aspnet_Users Usr inner join dbo.aspnet_UsersInRoles RLU  on  Usr.UserId=RLU.UserId " +
                                                      "inner join dbo.aspnet_Roles RL on Rl.RoleId=RLU.RoleId";
        SqlCommand command = new SqlCommand(query, connection);
        connection.Open();
        GridView1.DataSource = command.ExecuteReader();
        GridView1.DataBind();
        connection.Close();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!Roles.RoleExists(TextBox1.Text))
        {
            Roles.CreateRole(TextBox1.Text);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        Roles.AddUserToRole(TextBox2.Text, TextBox3.Text);
        BindGrid();


    }

    protected void ButtonDeleteUserRole_Click(object sender, EventArgs e)
    {
        Roles.RemoveUserFromRole(TextBox2.Text, TextBox3.Text);
        BindGrid();
    }
}