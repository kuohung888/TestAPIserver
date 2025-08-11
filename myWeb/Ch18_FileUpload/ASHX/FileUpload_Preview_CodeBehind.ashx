<%@ WebHandler Language="C#" Class="FileUpload_Preview_CodeBehind" %>

using System;
using System.Web;
//*****************************
using System.Web.SessionState;    //使用網頁的Session，所以要自己動手宣告。
//*****************************

// MSDN 逐步解說：建立同步的 HTTP 處理常式
// 參考資料：http://msdn.microsoft.com/zh-tw/library/ms228090(v=vs.90).aspx
//                http://diaosbook.com/Post/2012/1/7/output-images-using-ashx-in-aspnet


public class FileUpload_Preview_CodeBehind : IHttpHandler, IRequiresSessionState
{
    //*************************************************
    //  重點！！上面的介面需自己動手改一下。
    //        如果要「讀取」Session，需要自己動手補上 IReadOnlySessionState介面。
    //        如果要「寫入」Session，需要自己動手補上 IRequiresSessionState介面。
    //*************************************************
    
    public void ProcessRequest(HttpContext context)
    {
        //context.Response.ContentType = "text/plain";  //預設 .ashx的程式範例
        //context.Response.Write("Hello World");

        // 範例來源：http://www.dotblogs.com.tw/aquarius6913/archive/2013/04/26/102317.aspx
        if (context.Session["myFile"] != null)
        {
            HttpPostedFile myFile = (HttpPostedFile)context.Session["myFile"];
 
            // Allocate a buffer for reading of the file
            byte[] myData = new byte[myFile.ContentLength];  //以上傳檔案的大小，來設定buffer大小
            myFile.InputStream.Read(myData, 0, myFile.ContentLength);

            context.Response.ContentType = "image/jpeg";
            context.Response.Clear();
            context.Response.BufferOutput = true;
            context.Response.BinaryWrite(myData);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}