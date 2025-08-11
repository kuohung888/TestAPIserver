<%@ WebHandler Language="C#" Class="FileUpload_DB_Image_02_Display" %>

using System;
using System.Web;
//----自己寫的（宣告)----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告)----


public class FileUpload_DB_Image_02_Display : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");

        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);

        SqlDataReader dr = null;

        SqlCommand cmd = new SqlCommand("Select * From FileUpload_DB2 Where FileUpload_DB_id =@FileUpload_DB_id", Conn);
        cmd.Parameters.AddWithValue("@FileUpload_DB_id", context.Request["id"]);

        try     //==== 以下程式，只放「執行期間」的指令！=====================
        {
            //== 第一，連結資料庫。
            Conn.Open();   //---- 這時候才連結DB

            //== 第二，執行SQL指令。
            dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

            //==第三，自由發揮，把執行後的結果呈現到畫面上。
            //==自己寫迴圈==
            while (dr.Read())
            {
                context.Response.ContentType = "image/" + dr["FileUpload_MIME"].ToString().Remove(0,1);
                //把附檔名 .jpg 前面那個句號（.）刪除。
                //MIME搭配Response，才能把圖片以正確格式呈現出來！

                context.Response.BinaryWrite((byte[])dr["FileUpload_FileName"]);
                //以陣列的方式，把二進位圖片檔讀取出來。
            }

        }
        catch (Exception ex)
        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            context.Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        }
        finally
        {
            // == 第四，釋放資源、關閉資料庫的連結。
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