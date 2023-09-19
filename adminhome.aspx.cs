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
    public partial class adminhome : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["techdicuss"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindGridview1();
            }
        }

        private void BindGridview1()
        {
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                using (MySqlCommand cmd = new MySqlCommand("procBindAllProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (MySqlDataAdapter da = new MySqlDataAdapter())
                    {
                        cmd.Connection = con;
                        da.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            da.Fill(dt);
                           // GridView1.DataSource = dt;
                            //GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                con.Open();
                string str3 = "INSERT INTO techdicuss.tbltopic(TName,Description) VALUES(@TName,@Description)";
                MySqlCommand cmd4 = new MySqlCommand(str3, con);
                cmd4.Parameters.AddWithValue("@TName", txtTopicName.Text);
                cmd4.Parameters.AddWithValue("@Description", txtdescription.Text);
                cmd4.CommandText = str3;                
                cmd4.ExecuteNonQuery();
                long LIID = cmd4.LastInsertedId;
                int TID = (int)LIID;
                                
                if (fuImg1.HasFile)
                {
                    string str = fuImg1.FileName;
                    string S = Server.MapPath("~/images/" + str);
                    fuImg1.PostedFile.SaveAs(Server.MapPath("~/images/" + str));
                    string Image = "~/images/" + str.ToString();
                    string str5 = "insert into tbltopicimages(TID,Image) values(@TID, '" + Image + "')";
                    MySqlCommand cmd6 = new MySqlCommand(str5, con);
                    cmd6.Parameters.AddWithValue("@TID", Convert.ToInt32(TID));
                    cmd6.ExecuteNonQuery();
                }
                //BindGridview1();
                Response.Write("<script> alert('Product Added Successfully ');  </script>");
                txtTopicName.Text = string.Empty;
                txtdescription.Text = string.Empty;
                con.Close();
            }
        }
    }
}