<%@ WebHandler Language="C#" Class="test_02_DB" %>

using System;
using System.Web;
//----自己寫的（宣告)----
using System.Web.Configuration;  // Web.Config檔的DB連結字串。
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告)----


public class test_02_DB : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        //=======微軟SDK文件的範本=======
        //----上面已經事先寫好NameSpace --  using System.Web.Configuration; ----     
        //----或是寫成下面這一行 (連結資料庫)----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
              
        SqlDataReader dr = null;
        SqlCommand cmd = new SqlCommand("select id,test_time,title from test where id = " + context.Request["id"], Conn);
        //// 註解：請使用參數來處理，避免SQL Injection攻擊
        // SqlCommand cmd = new SqlCommand("select id,test_time,title from test where id = @id", Conn);
        // cmd.Parameters.AddWithValue("@id", context.Request["id"]);

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {   //== 第一，連結資料庫。
            Conn.Open();   //---- 這時候才連結DB

            //== 第二，執行SQL指令。
            dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

            //==第三，自由發揮，把執行後的結果呈現到畫面上。
            dr.Read();
            ////=== 純文字 ========================================
            //context.Response.ContentType = "text/plain";
            //context.Response.Write("      <h3>Hello from a synchronous custom HTTP handler.</h3>");
            //context.Response.Write("      *****" + dr["title"].ToString());

            ////=== HTML網頁 ======================================
            context.Response.ContentType = "text/html";
            context.Response.Write("<!DOCTYPE html>");    // 不加上這一句，VS 2013會出現怪現象。
            context.Response.Write("<html>");
            context.Response.Write("  <body>");
            context.Response.Write("      <h3>Hello from a synchronous custom HTTP handler.</h3>");
            context.Response.Write("      *****" + dr["title"].ToString());
            context.Response.Write("  </body>");
            context.Response.Write("</html>"); 
            
        }
        catch (Exception ex)
        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            //---- http://www.dotblogs.com.tw/billchung/archive/2009/03/31/7779.aspx
            context.Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR />");
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
                Conn.Dispose(); //---- 一開始宣告有用到 new的,最後必須以 .Dispose()結束
            }
        }
                
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}