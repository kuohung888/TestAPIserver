<%@ WebHandler Language="C#" Class="FileUpload_DB_Image_03_2Display" %>

using System;
using System.Web;
//----自己寫的（宣告)----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告)----


public class FileUpload_DB_Image_03_2Display : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataReader dr = null;

        SqlCommand cmd = new SqlCommand("Select FileUpload_FileName From FileUpload_DB3 Where FileUpload_DB_id =@FileUpload_DB_id", Conn);
        cmd.Parameters.AddWithValue("@FileUpload_DB_id", context.Request["id"]);

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            //== 第一，連結資料庫。
            Conn.Open();   //---- 這時候才連結DB

            //== 第二，執行SQL指令。
            dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料
            
            //==第三，自由發揮，把執行後的結果呈現到畫面上。
            // 資料來源：http://www.dotblogs.com.tw/shadow/archive/2011/06/12/28113.aspx
            context.Response.Clear();
            //************************************
            context.Response.ContentType = "image/jpeg";
            // 也可以設定成 application/octet-stream為任意的二進位檔案，搭配資料表的欄位（資料型態 varbinary(MAX)）
            //************************************    

            //作法一：
            dr.Read();
            context.Response.BinaryWrite((byte[])dr["FileUpload_FileName"]);   // 以陣列的方式，把二進位圖片檔讀取出來。

            //作法二： 因為這裡只有抓出一個欄位，可以改用 .ExecuteScalar()方法來做。
            //context.Response.BinaryWrite((byte[])cmd.ExecuteScalar());    // 以陣列的方式，把二進位圖片檔讀取出來。
            
                    
        }
        catch (Exception ex)
        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            context.Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
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
    
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}