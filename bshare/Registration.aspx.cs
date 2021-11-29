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
            //ページ読み込みイベントでログインしている病院の情報を取得(Hospitalname:aa)
            cn.ConnectionString = cnstr; //接続文字列のセット
            cn.Open(); //接続開始
            cmd.Connection = cn; //SQLコマンドに接続を渡す
            cmd.CommandType = CommandType.Text; //文字列型で命令を渡す宣言

            //cmd.CommandText = "SELECT * FROM [dbo].[Hospital] WHERE hosptal_id = " + Session["id"];
            //cmd.CommandText = "SELECT * FROM [dbo].[Hospital] WHERE Hospitalname = '三重県立病院'";//デバッグ(結果に何も取得できないHosptalnameのデータ定義が原因か)
            cmd.CommandText = "SELECT * FROM [dbo].[Hospital] WHERE Callnumber = 789213554";//デバッグ(成功)
            //cmd.ExecuteNonQuery(); //SQLの実行(登録)
            // SQLを実行します。
            SqlDataReader reader = cmd.ExecuteReader();
            // 結果を表示します。
            while (reader.Read())
            {
                string Hospitalname = (string)reader.GetValue(0);
                int Callnumber = (int)reader.GetValue(1);
                int Bedcount = (int)reader.GetValue(2);
                DateTime log = (DateTime)reader.GetValue(3);
                string Address = (string)reader.GetValue(4);
                int Bedtype = (int)reader.GetValue(5);
                int Bedinfected = (int)reader.GetValue(6);
                int Bedmental = (int)reader.GetValue(7);
                int Bedcovid = (int)reader.GetValue(8);
                int Bedsevere = (int)reader.GetValue(9);

                Label5.Text = "Hospitalname:" + Hospitalname
                    + "\nCallnumber:" + Callnumber
                    + "\nBedcount:" + Bedcount
                    + "\nlog" + log
                    + "\nAddress" + Address
                    + "\nBedtype" + Bedtype
                    + "\nBedinfected" + Bedinfected
                    + "\nBedmental" + Bedmental
                    + "\nBedcovid" + Bedcovid
                    + "\nBedsevere" + Bedsevere;//デバッグ
                TextBox1.Text = Hospitalname;
                TextBox2.Text = Callnumber.ToString();
                TextBox3.Text = Bedcount.ToString();
                TextBox4.Text = log.ToString();
                TextBox5.Text = Address.ToString();
                TextBox6.Text = Bedtype.ToString();
                TextBox7.Text = Bedinfected.ToString();
                TextBox8.Text = Bedmental.ToString();
                TextBox9.Text = Bedcovid.ToString();
                TextBox10.Text = Bedsevere.ToString();

            }
            cn.Close(); //接続終了
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
            Response.Redirect("~/List.aspx");
            //Response.Redirect("~/Search.aspx");
        }
    }
}