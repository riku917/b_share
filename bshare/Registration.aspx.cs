using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data.SqlClient;
using System.Data;


namespace bshare
{
    public partial class Registration : System.Web.UI.Page
    {
        //Azure SQL DataBase
        private SqlConnection cn_b = new SqlConnection();
        private SqlCommand cmd_b = new SqlCommand();
        private string cnstr_b =
            @"Server=tcp:bsharedbserver.database.windows.net,1433;" +
            @"Initial Catalog = bshare_db;" +
            @"Persist Security Info=False;" +
            @"User ID = bshare_db;" +
            @"Password=Pa$$w0rd;" +
            @"MultipleActiveResultSets=False;" +
            @"Encrypt=True;" +
            @"TrustServerCertificate=False;" +
            @"Connection Timeout = 30";
        SqlDataReader reader_b;
        string update_col = "";
        string update_str = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            int hospitalid = 0;
            /*-------*/
            //Session["type"] = 1;//デバッグ用
            //Session["id"] = "ab";//デバッグ用
            /*-------*/
            if (!IsPostBack)
            {
                if (Session["type"].Equals(1))
                {
                    //Azure SQL DataBase
                    cn_b.ConnectionString = cnstr_b;
                    cn_b.Open();
                    cmd_b.Connection = cn_b;
                    cmd_b.CommandType = CommandType.Text;
                    cmd_b.CommandText = "SELECT * FROM [dbo].[user] WHERE Id = N'" + Session["id"].ToString() + "'";
                    reader_b = cmd_b.ExecuteReader();
                    while (reader_b.Read())
                    {
                        hospitalid = (int)reader_b["HospitalID"];
                    }
                    cn_b.Close();
                    cn_b.Open();
                    cmd_b.CommandText = "SELECT * FROM [dbo].[Hospital] WHERE HospitalID = " + hospitalid;
                    reader_b = cmd_b.ExecuteReader();
                    while (reader_b.Read())
                    {
                        Label1.Text = reader_b["Hospitalname"].ToString();
                        TextBox3.Text = reader_b["Bedcount"].ToString();
                        TextBox6.Text = reader_b["Bedtype"].ToString();
                        TextBox7.Text = reader_b["Bedinfected"].ToString();
                        TextBox8.Text = reader_b["Bedmental"].ToString();
                        TextBox9.Text = reader_b["Bedcovid"].ToString();
                        TextBox10.Text = reader_b["Bedsevere"].ToString();
                    }
                    cn_b.Close();
                }
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            update_col = "Bedcount";
            update_str = TextBox3.Text;
            Button_Click();
        }


        protected void Button6_Click(object sender, EventArgs e)
        {
            update_col = "Bedtype";
            update_str = TextBox6.Text;
            Button_Click();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            update_col = "Bedinfected";
            update_str = TextBox7.Text;
            Button_Click();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            update_col = "Bedmental";
            update_str = TextBox8.Text;
            Button_Click();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            update_col = "Bedcovid";
            update_str = TextBox9.Text;
            Button_Click();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            update_col = "Bedsevere";
            update_str = TextBox10.Text;
            Button_Click();
        }

        protected void Button_Click()
        {
            string dt_str = DateTime.Now.ToString("yyyy/MM.dd HH:mm:ss");
            cn_b.ConnectionString = cnstr_b;
            cn_b.Open();
            cmd_b.Connection = cn_b;
            cmd_b.CommandType = CommandType.Text;
            cmd_b.CommandText = "UPDATE [dbo].[Hospital] SET " + update_col + " = " + int.Parse(update_str) + ",log = N'" + dt_str + "' WHERE Hospitalname = N'" + Label1.Text + "'";
            cmd_b.ExecuteNonQuery();
            cn_b.Close();
        }

        protected void Button0_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Search.aspx");
        }
    }
}