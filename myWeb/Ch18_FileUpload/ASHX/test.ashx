<%@ WebHandler Language="C#" Class="test" %>

using System;
using System.Web;

public class test : IHttpHandler {
    //*************************************************
    //  重點！！上面的介面需自己動手改一下。
    //        如果要「讀取」Session，需要自己動手補上 IReadOnlySessionState介面。
    //        如果要「寫入」Session，需要自己動手補上 IRequiresSessionState介面。
    //*************************************************
    
    
    public void ProcessRequest (HttpContext context) {
        // 最原始的 .ashx雛形。
        // 資料來源：http://msdn.microsoft.com/zh-tw/library/ms228090(v=vs.90).aspx
        
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}