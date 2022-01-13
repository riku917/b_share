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
        //ローカルデータベース
        //private SqlConnection cn = new SqlConnection();
        //private SqlCommand cmd = new SqlCommand();
        //private string cnstr =
        //    @"Data Source = (LocalDB)\MSSQLLocalDB;" +
        //    @"AttachDbFilename=|DataDirectory|\SampleDatabase1.mdf;" +
        //    @"Integrated Security = True;Connect Timeout = 30";
        
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
        

        protected void Button1_Click(object sender, EventArgs e)
        {
            //ローカルデータベース
            ////ログイン認証機能
            //cn.ConnectionString = cnstr; //接続文字列のセット
            //cn.Open(); //接続開始
            //cmd.Connection = cn; //SQLコマンドに接続を渡す
            //cmd.CommandType = CommandType.Text; //文字列型で命令を渡す宣言

            //cmd.CommandText = "SELECT [Id],[type] FROM [dbo].[user] WHERE  Id = N'" + loginID.Text + "' AND password = N'" + password.Text + "'" ;

            //SqlDataReader reader = cmd.ExecuteReader();
            //while (reader.Read())
            //{
            //    Session["id"] = reader["Id"];
            //    Session["type"] = reader["type"];
            //    Response.Redirect("~/Search.aspx");
            //}
            //cn.Close(); //接続終了

            //Azure SQL DataBase
            //ログイン認証機能
            cn_b.ConnectionString = cnstr_b; //接続文字列のセット
            cn_b.Open(); //接続開始
            cmd_b.Connection = cn_b; //SQLコマンドに接続を渡す
            cmd_b.CommandType = CommandType.Text; //文字列型で命令を渡す宣言

            cmd_b.CommandText = "SELECT [Id],[type] FROM [dbo].[user] WHERE  Id = N'" + loginID.Text + "' AND password = N'" + password.Text + "'";

            reader_b = cmd_b.ExecuteReader();
            while (reader_b.Read())
            {
                Session["id"] = reader_b["Id"];
                Session["type"] = reader_b["type"];
                Response.Redirect("~/Search.aspx");
            }
            cn_b.Close(); //接続終了
        }
    }
}