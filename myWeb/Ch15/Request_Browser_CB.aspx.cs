using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch15_Request_Browser_CB : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // 傳統寫法（.NET 1.x）
       // HttpBrowserCapabilities rb = Request.Browser;


        // .NET 3.5起的新寫法 (xxxxxBase)。
        // http://blog.darkthread.net/post-2014-07-11-mock-httprequest.aspx
        // http://stackoverflow.com/questions/1452522/how-do-i-convert-an-httprequestbase-into-an-httprequest-object
        // 微軟MSDN。 http://msdn.microsoft.com/zh-tw/library/system.web.httprequestwrapper(v=vs.110).aspx
        HttpRequestBase HRB = new HttpRequestWrapper(Request);
        HttpBrowserCapabilitiesBase rb = HRB.Browser;
        
        Response.Write("<p>用戶端的瀏覽器支援功能：</p>");
        Response.Write("Type = " + rb.Type + "<br>");
        Response.Write("Name = " + rb.Browser + "<br>");
        Response.Write("Version = " + rb.Version + "<br>");
        Response.Write("Major Version = " + rb.MajorVersion + "<br>");
        Response.Write("Minor Version = " + rb.MinorVersion + "<br>");
        Response.Write("Platform 作業系統 = " + rb.Platform + "<br>");
        Response.Write("Is Beta = " + rb.Beta + "<br>");
        Response.Write("是否為 Web Crawler 搜尋引擎= " + rb.Crawler + "<br>");
        Response.Write("Is AOL = " + rb.AOL + "<br>");
        Response.Write("Is Win16 = " + rb.Win16 + "<br>");
        Response.Write("Is Win32 = " + rb.Win32 + "<br>");
        Response.Write("Supports Frames （網頁框架）= " + rb.Frames + "<br>");
        Response.Write("Supports Tables = " + rb.Tables + "<br>");
        Response.Write("Supports Cookies = " + rb.Cookies + "<br>");
        Response.Write("Supports VB Script = " + rb.VBScript + "<br>");
        // Response.Write("Supports JavaScript = " + rb.JavaScript + "<br>");  //--此作法已經過時。會出現警告。
        Response.Write("Supports Java Applets = " + rb.JavaApplets + "<br>");
        Response.Write("Supports ActiveX Controls = " + rb.ActiveXControls + "<br>");
        Response.Write("CDF（網路廣播，Webcasting） = " + rb.CDF + "<br>");
    }
}
