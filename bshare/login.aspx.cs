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
    public partial class login : System.Web.UI.Page
    {
        private SqlConnection cn = new SqlConnection();
        private SqlCommand cmd = new SqlCommand();

        private string cnstr =
            @"Data Source = (LocalDB)\MSSQLLocalDB;" +
            @"AttachDbFilename=|DataDirectory|\SampleDatabase1.mdf;" +
            @"Integrated Security = True;Connect Timeout = 30";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //ログイン認証機能
            cn.ConnectionString = cnstr; //接続文字列のセット
            cn.Open(); //接続開始
            cmd.Connection = cn; //SQLコマンドに接続を渡す
            cmd.CommandType = CommandType.Text; //文字列型で命令を渡す宣言

            cmd.CommandText = "SELECT [Id],[type] FROM [dbo].[user] WHERE  Id = N'" + loginID.Text + "' AND password = N'" + password.Text + "'" ;

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Session["id"] = reader["Id"];
                Session["type"] = reader["type"];
                Response.Redirect("~/Search.aspx");
            }
            cn.Close(); //接続終了
        }
    }
}