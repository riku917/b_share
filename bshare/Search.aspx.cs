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

        [System.Web.UI.Themeable(false)]
        public virtual string GroupName
        {
            get; set;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void Search_button_Click(object sender, EventArgs e)
        {
            string RadioButtonChecked = "";

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

            cn.ConnectionString = cnstr; //接続文字列のセット
            cn.Open(); //接続開始
            cmd.Connection = cn; //SQLコマンドに接続を渡す
            cmd.CommandType = CommandType.Text; //文字列型で命令を渡す宣言

            cmd.CommandText = "SELECT [Hospitalname],[Callnumber],[" + RadioButtonChecked + "],[Address] FROM [dbo].[Hospital] WHERE  [prefecture] = N'" + DropDownList1.SelectedValue + "' ";
            rd = cmd.ExecuteReader(); //SQLの実行(登録)
            
            ListBox1.Items.Clear();
            
            // 結果を表示します。
            while (rd.Read())
            {
                //string Hospitalname = (string)reader.GetValue(0);
                //int Callnumber = (int)reader.GetValue(1);
                //int Bedcount = (int)reader.GetValue(2);
                //DateTime log = (DateTime)reader.GetValue(3);
                //string Address = (string)reader.GetValue(4);
                //int Bedtype = (int)reader.GetValue(5);
                //int Bedinfected = (int)reader.GetValue(6);
                //int Bedmental = (int)reader.GetValue(7);
                //int Bedcovid = (int)reader.GetValue(8);
                //int Bedsevere = (int)reader.GetValue(9);
                string Hospitalname = (string)rd.GetValue(0);
                int Callnumber = (int)rd.GetValue(1);
                int Bed = (int)rd.GetValue(2);
                string Address = (string)rd.GetValue(3);

                ListBox1.Items.Add(String.Format("{0},{1},{2},{3}", rd["Hospitalname"], rd["Callnumber"], rd[RadioButtonChecked], rd["Address"]));
            }
            rd.Close();
            cn.Close(); //接続終了
        }
    }
}
