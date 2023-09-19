using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace karma
{
    public partial class QNA : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["techdicuss"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["TID"] != null)
            {
                if (!IsPostBack)
                {
                    BindTopicImageSlider();
                    BindQuestionRepeater();
                }
            }
            else
            {
                Response.Redirect("~/Topic.aspx");
            }            
        }

        private void BindQuestionRepeater()
        {
            Int64 TID = Convert.ToInt64(Request.QueryString["TID"]);
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                using (MySqlCommand cmd = new MySqlCommand("select * from tblquestion where TID='" + TID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrQuestion.DataSource = dt;
                        rptrQuestion.DataBind();
                        if (dt.Rows.Count <= 0)
                        {
                            Label2.Text = "Sorry! Currently no Question here if you want to add Question.";
                        }
                        else
                        {
                            Label2.Text = "Showing All Questions";
                        }
                    }
                }
            }
        }

        private void BindTopicImageSlider()
        {
            Int64 TID = Convert.ToInt64(Request.QueryString["TID"]);
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                using (MySqlCommand cmd = new MySqlCommand("select * from tbltopic where TID='" + TID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (MySqlDataAdapter sda = new MySqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrImage1.DataSource = dt;
                        rptrImage1.DataBind();
                        rptrImage2.DataSource = dt;
                        rptrImage2.DataBind();
                        rptrImage3.DataSource = dt;
                        rptrImage3.DataBind();
                        rptrdes1.DataSource = dt;
                        rptrdes1.DataBind();
                        rptrdes2.DataSource = dt;
                        rptrdes2.DataBind();
                        rptrdes3.DataSource = dt;
                        rptrdes3.DataBind();
                    }
                }
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Int64 TID = Convert.ToInt64(Request.QueryString["TID"]);
            using (MySqlConnection con = new MySqlConnection(CS))
            {
                con.Open();
                string str3 = "INSERT INTO techdicuss.tblquestion(TID,Question) VALUES(@TID,@Question)";
                MySqlCommand cmd4 = new MySqlCommand(str3, con);
                cmd4.Parameters.AddWithValue("@Question", txtQuestion.Text);
                cmd4.Parameters.AddWithValue("@TID", TID);
                cmd4.CommandText = str3;
                cmd4.ExecuteNonQuery();
                long LIID = cmd4.LastInsertedId;
                int QID = (int)LIID;

                if (fuImg1.HasFile)
                {
                    string str = fuImg1.FileName;
                    string S = Server.MapPath("~/images/" + str);
                    fuImg1.PostedFile.SaveAs(Server.MapPath("~/images/" + str));
                    string Image = "~/images/" + str.ToString();
                    string str5 = "insert into tblquestionimages(QID,QImage) values(@QID, '" + Image + "')";
                    MySqlCommand cmd6 = new MySqlCommand(str5, con);
                    cmd6.Parameters.AddWithValue("@QID", Convert.ToInt32(QID));
                    cmd6.ExecuteNonQuery();
                }
                BindQuestionRepeater();
                Response.Write("<script> alert('Question Added Successfully ');  </script>");
                txtQuestion.Text = string.Empty;
                con.Close();
            }
        }

        protected void txtFilterGrid1Record_TextChanged(object sender, EventArgs e)
        {
            Int64 TID = Convert.ToInt64(Request.QueryString["TID"]);

            if (txtFilterGrid1Record.Text != string.Empty)
            {
                using (MySqlConnection con = new MySqlConnection(CS))
                {
                    using (MySqlCommand cmd = new MySqlCommand("select * from tblquestion where TID='" + TID + "'", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        con.Open();
                        string qr = "select * from tblquestion where Question like '" + txtFilterGrid1Record.Text + "' order by QID desc";
                        MySqlDataAdapter da = new MySqlDataAdapter(qr, con);
                        string text = ((TextBox)sender).Text;
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            rptrQuestion.DataSource = ds.Tables[0];
                            rptrQuestion.DataBind();
                        }
                        else
                        {

                        }
                    }
                }            
            }
            else
            {
                BindQuestionRepeater();
            }
        }
    }
}