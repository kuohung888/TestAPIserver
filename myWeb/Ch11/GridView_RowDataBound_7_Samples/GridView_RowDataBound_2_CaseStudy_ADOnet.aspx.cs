using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//----自己寫的（宣告)----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告)----


public partial class Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowDataBound_2_CaseStudy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("select [name], [math] from [student_test]", Conn);

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {        //== 第一，連結資料庫。
            Conn.Open();   //---- 這時候才連結DB

            //== 第二，執行SQL指令。
            dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

            //==第三，自由發揮，把執行後的結果呈現到畫面上。
            //==自己寫迴圈==
            Label1.Text = "<table border=1>";
            while (dr.Read())
            {
                Label1.Text += "<tr>";
                Label1.Text += "<td>" + dr["name"] + "</td>";

                if (Convert.ToInt32(dr["math"]) < 60)
                {   //不及格，出現紅字！
                    Label1.Text += "<td><font color=red>" + dr["math"] + "</font></td>";                    
                }
                else
                {
                    Label1.Text += "<td>" + dr["math"] + "</td>";
                }
                Label1.Text += "</tr>";
            }
            Label1.Text += "</table>";   //若資料量大，請用StringBuilder來做（命名空間 System.Text）

        }
        catch (Exception ex)
        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        }
        finally
        {   // == 第四，釋放資源、關閉資料庫的連結。
            //---- Always call Close when done reading.
            if (dr != null)
            {
                cmd.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
                dr.Close();
            }
            //---- Close the connection when done with it.
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
                Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }

    }
 
}