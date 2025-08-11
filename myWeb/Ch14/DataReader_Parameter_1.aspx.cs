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


public partial class _Book_New_Samples_DB_DataReader_Default_1_DataReader_Parameter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //----上面已經事先寫好NameSpace --  using System.Web.Configuration; ----     
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("select id,test_time,summary,author from test where id = @id", Conn);
        
        if (IsNumeric(Request["id"]))  {
            //== 參數！！ ============================(start)
            cmd.Parameters.Add("@id", SqlDbType.Int, 4);
            cmd.Parameters["@id"].Value = Convert.ToInt32(Request["id"]);

            // 簡易寫法。 cmd.Parameters.AddWithValue("@參數名稱", 輸入的數值);
            // 上面兩段參數，可以寫成  cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Request["id"]));
            //== 參數！！ ============================(end)
        }
        else  {
            Response.Write("<h2>URL網址傳來的 id 並非數字！</h2>");
            return;
        }
        //--參考資料：http://msdn.microsoft.com/zh-tw/library/system.data.sqlclient.sqlparametercollection_methods(v=VS.100).aspx
        

        try 
        {
            Conn.Open();   //== 第一，連結資料庫。
            dr = cmd.ExecuteReader();   //== 第二，執行SQL指令，取出資料

            GridView1.DataSource = dr;   //==第三，自由發揮，把執行後的結果呈現到畫面上。
            GridView1.DataBind(); 
        }
        catch (Exception ex)  {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            //---- http://www.dotblogs.com.tw/billchung/archive/2009/03/31/7779.aspx
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        }
        finally  {
            // == 第四，釋放資源、關閉資料庫的連結。
            if (dr != null)  {
                cmd.Cancel();
                //----關閉DataReader之前，一定要先「取消」SqlCommand
                //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
                dr.Close();
            }
            if (Conn.State == ConnectionState.Open)  {
                Conn.Close();
                Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }
    }
    

    // C#的 IsNumeric Function
    //資料來源：http://www.died.tw/2009/04/aspnet-c-isnumber.html
    static bool IsNumeric(object Expression)
    {
        bool isNum;
        double retNum;
        isNum = Double.TryParse(Convert.ToString(Expression), System.Globalization.NumberStyles.Any, System.Globalization.NumberFormatInfo.InvariantInfo, out retNum);
        return isNum;
    } 
}