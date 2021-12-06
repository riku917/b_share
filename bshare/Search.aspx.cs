using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

/*using System.Windows.Forms;*/ 

using System.Data;
using System.Data.SqlClient;

namespace Bshare001
{
    public partial class Search : System.Web.UI.Page
    {
        private SqlConnection cn = new SqlConnection();
        private SqlCommand cmd = new SqlCommand();
        private SqlDataReader rd;

        private string cnstr =
            @"Data Source = (LocalDB)\MSSQLLocalDB;" +
            @"AttachDbFilename=|DataDirectory|\SampleDatabase1.mdf;" +
            @"Integrated Security = True;Connect Timeout = 30";

        //都道府県
        string pref = "0";
        //イメージマップかドロップダウンリストが選択されたとき１になる
        int count = 0;
        [System.Web.UI.Themeable(false)]
        public virtual string GroupName
        {
            get; set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {            

            if (Session["type"] != null)
            {
                Label1.Text = Session["type"].ToString();//デバッグ

                //Session["id"]からアカウントを判別
                if (Session["type"].Equals(0))
                {
                    Label1.Text += "管理者[0]全てのボタンを表示";
                }
                else if (Session["type"].Equals(1))
                {
                    Label1.Text += "病院[1]管理ボタンを非表示";
                    Button2.Visible = false;
                }
                else if (Session["type"].Equals(2))
                {
                    Label1.Text += "その他(消防)[2]全てのボタンを非表示";
                    Button1.Visible = false;
                    Button2.Visible = false;
                }
            }
        }
        protected void TbChanged(object sender, EventArgs e)
        {
            count = 1;
        }
        protected void DdlChange(object sender, EventArgs e)
        {
            count = 1;
        }
        protected void Search_button_Click(object sender, EventArgs e)
        {
            string RadioButtonChecked;

            if (RadioButton1.Checked)
            {
                RadioButtonChecked = "Bedtype";
            }
            else if (RadioButton2.Checked)
            {
                RadioButtonChecked = "Bedinfected";
            }
            else if (RadioButton3.Checked)
            {
                RadioButtonChecked = "Bedmental";
            }
            else if (RadioButton4.Checked)
            {
                RadioButtonChecked = "Bedcovid";
            }
            else if (RadioButton5.Checked)
            {
                RadioButtonChecked = "Bedsevere";
            }
            else
            {
                RadioButtonChecked = "Bedcount";
            }
            //一度も都道府県が選択されなければ、都道府県の絞り込みはしない
            string sql_text = "";
            if (count == 1)
            {
                pref = TextBox1.Text;
                sql_text = "SELECT [Hospitalname],[Callnumber],[" + RadioButtonChecked + "],[Address] FROM [dbo].[Hospital] WHERE  [prefecture] = N'" + pref + "'";
            }
            else if (count == 0)
            {
                pref = DropDownList1.SelectedValue;
                sql_text = "SELECT [Hospitalname],[Callnumber],[" + RadioButtonChecked + "],[Address] FROM [dbo].[Hospital]";
            }


            cn.ConnectionString = cnstr; //接続文字列のセット
            cn.Open(); //接続開始
            cmd.Connection = cn; //SQLコマンドに接続を渡す
            cmd.CommandType = CommandType.Text; //文字列型で命令を渡す宣言
            cmd.CommandText = sql_text;
            rd = cmd.ExecuteReader(); //SQLの実行(登録)
            ListBox1.Items.Clear();
            
            // 結果を表示します。
            while (rd.Read())
            {
                ListBox1.Items.Add(String.Format("{0},{1},{2},{3}", rd["Hospitalname"], rd["Callnumber"], rd[RadioButtonChecked], rd["Address"]));
            }
            rd.Close();
            cn.Close(); //接続終了

            TextBox1.Text = "";
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
