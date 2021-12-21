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
        private SqlConnection cn = new SqlConnection();
        private SqlCommand cmd = new SqlCommand();
        private string cnstr =
            @"Data Source = (LocalDB)\MSSQLLocalDB;" +
            @"AttachDbFilename=|DataDirectory|\SampleDatabase1.mdf;" +
            @"Integrated Security = True;Connect Timeout = 30";
        SqlDataReader reader;
        string update_col = "";
        string update_str = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            int hospitalid = 0;
            /*-------*/
            Session["type"] = 1;//デバッグ用
            Session["id"] = "ab";//デバッグ用
            /*-------*/
            if (!IsPostBack)
            {
                if (Session["type"].Equals(1))
                {
                    cn.ConnectionString = cnstr;
                    cn.Open();
                    cmd.Connection = cn;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM [dbo].[user] WHERE Id = N'" + Session["id"].ToString() + "'";
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        hospitalid = (int)reader["HospitalID"];
                    }
                    cn.Close();

                    cn.Open();
                    cmd.CommandText = "SELECT * FROM [dbo].[Hospital] WHERE HospitalID = " + hospitalid;
                    reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        Label1.Text = reader["Hospitalname"].ToString();
                        TextBox3.Text = reader["Bedcount"].ToString();
                        TextBox6.Text = reader["Bedtype"].ToString();
                        TextBox7.Text = reader["Bedinfected"].ToString();
                        TextBox8.Text = reader["Bedmental"].ToString();
                        TextBox9.Text = reader["Bedcovid"].ToString();
                        TextBox10.Text = reader["Bedsevere"].ToString();
                    }
                    cn.Close();
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
            cn.ConnectionString = cnstr;
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "UPDATE [dbo].[Hospital] SET " + update_col + " = " + int.Parse(update_str) + ",log = N'" + dt_str + "' WHERE Hospitalname = N'" + Label1.Text + "'";
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        protected void Button0_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Search.aspx");
        }
    }
}