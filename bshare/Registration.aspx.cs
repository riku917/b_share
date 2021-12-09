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

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["type"] = 1;
            int hospitalid = 0;
            if(Session["type"].Equals(1))
            {
                cn.ConnectionString = cnstr;
                cn.Open();
                cmd.Connection = cn;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = "SELECT * FROM [dbo].[user] WHERE Id = N'" + Session["id"].ToString() + "'";
                SqlDataReader reader = cmd.ExecuteReader();
               
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
                    TextBox1.Text = reader["Hospitalname"].ToString();
                    TextBox2.Text = reader["Callnumber"].ToString();
                    TextBox3.Text = reader["Bedcount"].ToString();
                    TextBox4.Text = reader["log"].ToString();
                    TextBox5.Text = reader["Address"].ToString();
                    TextBox6.Text = reader["Bedtype"].ToString();
                    TextBox7.Text = reader["Bedinfected"].ToString();
                    TextBox8.Text = reader["Bedmental"].ToString();
                    TextBox9.Text = reader["Bedcovid"].ToString();
                    TextBox10.Text = reader["Bedsevere"].ToString();
                }

                cn.Close();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DateTime dt = DateTime.Now;
            string dt_str = DateTime.Now.ToString("yyyy/MM.dd HH:mm:ss");

            cn.ConnectionString = cnstr; //接続文字列のセット
            cn.Open(); //接続開始
            cmd.Connection = cn; //SQLコマンドに接続を渡す
            cmd.CommandType = CommandType.Text; //文字列型で命令を渡す宣言

            cmd.CommandText = "INSERT INTO [dbo].[Hospital] (Hospitalname,Callllnumber,Bedcount,log)VALUES(N'"
                + TextBox1.Text + "'," + TextBox2.Text + "," + TextBox3.Text + ",N'" + dt+"')";

            cmd.ExecuteNonQuery(); //SQLの実行(登録)
            cn.Close(); //接続終了

            Label1.Text = TextBox1.Text;
            Label2.Text = TextBox2.Text;
            Label3.Text = TextBox3.Text;
            Label4.Text = dt_str;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Search.aspx");
        }
    }
}