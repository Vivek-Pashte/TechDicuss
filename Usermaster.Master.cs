using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace karma
{
    public partial class Usermaster : System.Web.UI.MasterPage
    {
        public static String CS = ConfigurationManager.ConnectionStrings["techdicuss"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_name"] != null)
            {
                btnSignUP.Visible = false;
                btnlogout.Visible = true;
                btnSignIN.Visible = false;
                Button1.Text = "Welcome: " + Session["user_name"].ToString().ToUpper();
            }
            else
            {
                btnSignUP.Visible = true;
                btnlogout.Visible = false;
                btnSignIN.Visible = true;
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session["user_name"] = null;
            Response.Redirect("~/WebForm1.aspx");
        }
    }
}