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


public partial class DataReader_Parameter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //----上面已經事先寫好NameSpace --  using System.Web.Configuration; ----     
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);

        try   {
            Conn.Open();  //== 第一，連結資料庫。

            //== 第二，執行SQL指令，取出資料（自己寫function，名為 myGetDR）
            String SQLstr = "select id, test_time, title, summary from test where title LIKE '%' + @title + '%' and summary LIKE '%' + @summary + '%'";
            // 資料來源 http://www.allenkuo.com/EBook5/view.aspx?TreeNodeID=13&id=251
            List<SqlParameter> list = new List<SqlParameter>();
                list.Add(new SqlParameter("@title", "1"));              // 搜尋資料暫時寫死，只有1。
                list.Add(new SqlParameter("@summary", "1"));    // 搜尋資料暫時寫死，只有1。

            //== 第三，自由發揮，把執行後的結果呈現到畫面上。
            GridView1.DataSource = myGetDR(Conn, SQLstr, list); ;
            GridView1.DataBind();
        }
        catch (Exception ex)  {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
            //---- http://www.dotblogs.com.tw/billchung/archive/2009/03/31/7779.aspx
        }
        finally  {
            // == 第四，釋放資源、關閉資料庫的連結。
            //if (dr != null)  {
            //    //cmd.Cancel();
            //    //----關閉DataReader之前，一定要先「取消」SqlCommand
            //    //參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
            //    dr.Close();
            //}
            if (Conn.State == ConnectionState.Open)  {
                Conn.Close();
                Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            }
        }

    } 


    protected SqlDataReader myGetDR(SqlConnection conn, String sqlstr, List<SqlParameter> paralist)
    {
        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand(sqlstr, conn);

        cmd.Parameters.Clear();
        cmd.Parameters.AddRange(paralist.ToArray<SqlParameter>());  // 把「陣列」值，批次加入參數裡面

        dr = cmd.ExecuteReader();
        return dr;
    }


}