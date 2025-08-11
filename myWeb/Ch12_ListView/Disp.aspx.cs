using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的----



public partial class Book_Sample_CaseStudy_DIY_Disp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsNumeric(Request["id"]) && (Request["id"] != "")) 
        {
            SqlConnection Conn = new SqlConnection();
            //----上面已經事先寫好  System.Web.Configuration 命名空間----
            Conn.ConnectionString = WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;

            SqlDataReader dr = null;
            //**** 重 點！*************************************************
            SqlCommand cmd = new SqlCommand("select * from test where id = " + Request["id"], Conn);
            //************************************************************

            try
            {
                Conn.Open();   //---- 這時候才連結DB
                dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

                //****************************************(start)
                dr.Read();   // 只讀取一筆紀錄，所以不需要用到 Loop迴圈程式

                Label1_title.Text = dr["title"].ToString();
                Label2_summary.Text = dr["summary"].ToString();
                Label3_test_time.Text = dr["test_time"].ToString();
                Label4_article.Text = dr["article"].ToString();
                Label5_author.Text = dr["author"].ToString();
                //****************************************(end)
            }
            catch (Exception ex)   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            {
                Response.Write("<b>Error Message----  </b>" + ex.ToString());
            }            
            finally
            {
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
                    Conn.Dispose();  //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
                }
            }

        }
        else
        {
            Response.Write("<h2>Error...沒有這篇文章！</h2>");
            Response.End();
            //--程式中斷，不再執行。您也可以改寫成 Return。看看畫面有何不同？
        }

    }



    // IsNumeric Function ===========================
    //資料來源：http://support.microsoft.com/kb/329488/zh-tw
    static bool IsNumeric(object Expression)
    {
        // Variable to collect the Return value of the TryParse method.
        bool isNum;

        // Define variable to collect out parameter of the TryParse method. If the conversion fails, the out parameter is zero.
        double retNum;

        // The TryParse method converts a string in a specified style and culture-specific format to its double-precision floating point number equivalent.
        // The TryParse method does not generate an exception if the conversion fails. If the conversion passes, True is returned. If it does not, False is returned.
        isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
        return isNum;
    }
}