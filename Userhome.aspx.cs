using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace karma
{
    public partial class Userhome : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["techdicuss"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_name"] != null)
            {
                if (!this.IsPostBack)
                {
                  //  BindProductRepeater();
                    btnSignUP.Visible = false;
                    btnSignIN.Visible = false;
                    btnlogout.Visible = true;
                }
            }
            else
            {
                //BindProductRepeater();
                btnSignUP.Visible = true;
                btnSignIN.Visible = true;
                btnlogout.Visible = false;
            }
        }

        private void BindProductRepeater()
        {
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                using (MySqlCommand cmd = new MySqlCommand("procBindAllProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProducts.DataSource = dt;
                        rptrProducts.DataBind();
                    }
                }
            }
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Session["Username"] = null;
            Response.Redirect("~/WebForm1.aspx");
        }

        protected void txtFilterGrid1Record_TextChanged(object sender, EventArgs e)
        {
            if (txtFilterGrid1Record.Text != string.Empty)
            {
                MySqlConnection con = new MySqlConnection(CS);
                con.Open();
                string qr = "select A.*,B.*,c.Name as BrandName from tblproducts as A inner join tblbrands as c on A.PBrandID = c.BrandID inner join tblproductimages as B on A.PID = B.PID where  A.PName = '" + txtFilterGrid1Record.Text + "' OR c.Name = '" + txtFilterGrid1Record.Text + "' order by A.PID desc";
                MySqlDataAdapter da = new MySqlDataAdapter(qr, con);
                string text = ((TextBox)sender).Text;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rptrProducts.DataSource = ds.Tables[0];
                    rptrProducts.DataBind();
                }
                else
                {
                }
            }
            else
            {
                BindProductRepeater();
            }
        }
    }
}