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
    public partial class Topic : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["techdicuss"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_name"] != null)
            {
                if (!IsPostBack)
                {                    
                    BindTopicRepeater();
                }
            }
            else
            {
                    Response.Redirect("WebForm1.aspx");                
            }
        }

        protected void txtFilterGrid1Record_TextChanged(object sender, EventArgs e)
        {
            if (txtFilterGrid1Record.Text != string.Empty)
            {
                MySqlConnection con = new MySqlConnection(CS);
                con.Open();
                string qr = "select A.*,B.* from tbltopic as A inner join tbltopicimages as B on A.TID = B.TID where  A.TName like '" + txtFilterGrid1Record.Text + "' order by A.TID desc";
                MySqlDataAdapter da = new MySqlDataAdapter(qr, con);
                string text = ((TextBox)sender).Text;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    rptrTopic.DataSource = ds.Tables[0];
                    rptrTopic.DataBind();
                }
                else
                {

                }
            }
            else
            {
                BindTopicRepeater();
            }
        }

        private void BindTopicRepeater()
        {
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                using (MySqlCommand cmd = new MySqlCommand("procBindAllTopic", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrTopic.DataSource = dt;
                        rptrTopic.DataBind();
                        if (dt.Rows.Count <= 0)
                        {
                            Label1.Text = "Sorry! Currently no Topic here if you want to add topic than contact us.";
                        }
                        else
                        {
                            Label1.Text = "Showing All Topic";
                        }
                    }
                }
            }
        }
    }
}