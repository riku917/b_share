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
            cn_b.ConnectionString = cnstr_b; //接続文字列のセット
            cn_b.Open(); //接続開始
            cmd_b.Connection = cn_b; //SQLコマンドに接続を渡す
            cmd_b.CommandType = CommandType.Text; //文字列型で命令を渡す宣言

            cmd_b.CommandText = "SELECT DISTINCT [prefecture] FROM [Hospital]";               
            
            reader_b = cmd_b.ExecuteReader();

            while (reader_b.Read())
            {
                ListItem selectedListItem = DropDownList1.Items.FindByValue(reader_b["prefecture"].ToString());

                if (selectedListItem != null)
                {
                    selectedListItem.Enabled = true;
                }
            }
            cn_b.Close(); //接続終了     

            if (Session["type"] != null)
            {
                //Label1.Text = Session["type"].ToString();//デバッグ

                //Session["id"]からアカウントを判別
                if (Session["type"].Equals(0))
                {
                    //Label1.Text += "管理者[0]更新ボタンを非表示";
                    Button1.Visible = false;
                }
                else if (Session["type"].Equals(1))
                {
                    //Label1.Text += "病院[1]管理ボタンを非表示";
                    Button2.Visible = false;
                }
                else if (Session["type"].Equals(2))
                {
                    //Label1.Text += "その他(消防)[2]全てのボタンを非表示";
                    Button1.Visible = false;
                    Button2.Visible = false;
                }
            }
            ListBox1.Items.Add("------------------------------------------------------------------------------------------------------------------------");
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
            //一度も都道府県が選択されなければ、都道府県の絞り込みはしないcount=0
            string sql_text = "";
            if (count == 1)//count=1(かつ空白以外なら)
            {
                pref = TextBox1.Text;
                sql_text = "SELECT [Hospitalname],[Callnumber],[" + RadioButtonChecked + "],[Address] FROM [dbo].[Hospital] WHERE  [prefecture] = N'" + pref + "'";
            }
            else if (count == 0)//count=0(かつ空白なら)
            {
                pref = DropDownList1.SelectedValue;
                sql_text = "SELECT [Hospitalname],[Callnumber],[" + RadioButtonChecked + "],[Address] FROM [dbo].[Hospital]";
            }

            cn_b.ConnectionString = cnstr_b; //接続文字列のセット
            cn_b.Open(); //接続開始
            cmd_b.Connection = cn_b; //SQLコマンドに接続を渡す
            cmd_b.CommandType = CommandType.Text; //文字列型で命令を渡す宣言
            cmd_b.CommandText = sql_text;
            reader_b = cmd_b.ExecuteReader(); //SQLの実行(登録)
            ListBox1.Items.Clear();
            
            
            // 結果を表示します。
            while (reader_b.Read())
            {
                ListBox1.Items.Add(String.Format("{0},{1},{2},{3}",
                    " 病院名：" + reader_b["Hospitalname"],
                    " 電話番号：" + reader_b["Callnumber"],
                    " 病床数：" + reader_b[RadioButtonChecked],
                    " 住所：" + reader_b["Address"]));
            }
            reader_b.Close();
            cn_b.Close(); //接続終了

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
