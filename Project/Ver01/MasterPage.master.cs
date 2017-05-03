using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        System.Web.Security.MembershipUser usr = System.Web.Security.Membership.GetUser();
        if (usr != null)
        {
            //LabelDebug.Text = ":::" + usr.ToString() + "\n";
            //LabelDebug.Text = usr.ProviderUserKey.ToString();

            string script = "alert(\"Hello " + usr.UserName + ": " + usr.ProviderUserKey + "!\");";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script, true);

            

        }


    }
}
