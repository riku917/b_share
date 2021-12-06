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
    public partial class List : System.Web.UI.Page
    {
        private SqlConnection cn = new SqlConnection();
        private SqlCommand cmd = new SqlCommand();

        private string cnstr =
            @"Data Source = (LocalDB)\MSSQLLocalDB;" +
            @"AttachDbFilename=|DataDirectory|\SampleDatabase1.mdf;" +
            @"Integrated Security = True;Connect Timeout = 30";
        protected void Page_Load(object sender, EventArgs e)
        {
            cn.ConnectionString = cnstr; //接続文字列のセット
            cn.Open(); //接続開始
            cmd.Connection = cn; //SQLコマンドに接続を渡す
            cmd.CommandType = CommandType.Text; //文字列型で命令を渡す宣言

            cmd.CommandText = "SELECT DISTINCT [prefecture] FROM [Hospital]";

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                string rd = reader["prefecture"].ToString();
                ListItem selectedListItem = DropDownList1.Items.FindByValue(rd);
                
                if (selectedListItem != null)
                {
                    selectedListItem.Enabled = false;
                }
            }
            cn.Close(); //接続終了

            if (Session["type"] != null)
            {
                Label1.Text = (string)Session["type"];//デバッグ

                //Session["id"]からアカウントを判別
                if (Session["type"].Equals("0"))
                {
                    Label1.Text += "管理者[0]全てのボタンを表示";
                }
                else if (Session["type"].Equals("1"))
                {
                    Label1.Text += "病院[1]管理ボタンを非表示";
                    Button2.Visible = false;
                }
                else if (Session["type"].Equals("2")) 
                {
                    Label1.Text += "その他(消防)[2]全てのボタンを表示";
                    Button1.Visible = false;
                    Button2.Visible = false;
                }
            }
            //cn.ConnectionString = cnstr; //接続文字列のセット
            //cn.Open(); //接続開始
            //cmd.Connection = cn; //SQLコマンドに接続を渡す
            //cmd.CommandType = CommandType.Text; //文字列型で命令を渡す宣言

            //cmd.CommandText = "SELECT Hospitalname FROM [dbo].[Hospital] WHERE hosptal_id = " + Session["id"];

            //SqlDataReader reader = cmd.ExecuteReader();

            //while (reader.Read())
            //{
            //    string user_name = (string)reader.GetValue(0);
            //    if (user_Id == loginID.Text && user_password == password.Text)
            //    {
            //        Label1.Text = Label1.Text + user_name;
            //    }
            //}
            //cn.Close(); //接続終了
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Management.aspx");
        }
    }
}