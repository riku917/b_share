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

            cmd.CommandText = "SELECT [Id],[password],[type] FROM [dbo].[user] WHERE  Id = N'" + loginID.Text + "' AND password = N'" + password.Text + "'" ;

            //cmd.ExecuteNonQuery(); //SQLの実行(登録)

            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                string user_id = (string)reader.GetValue(0);
                string user_password = (string)reader.GetValue(1);
                string user_type = (string)reader.GetValue(2);
                if (user_id == loginID.Text && user_password == password.Text)
                {
                    //ログインしたアカウントを区別してSearch画面にデータを受け渡し
                    //userテーブルからidを取得してSession["id"]に代入してSearch画面に遷移
                    Session["id"] = user_id;
                    Session["type"] = user_type;
                    Response.Redirect("~/List.aspx");
                    //Response.Redirect("~/Search.aspx");
                }
                else
                {
                    Button1.Text = "ログイン失敗！" + user_id + user_password + user_type ;
                }
            }
                cn.Close(); //接続終了
        }
    }
}