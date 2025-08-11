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

public partial class Ch02_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //註解：這是我的第一支ASP.NET程式
        // 傳統寫法（.NET 1.x）
        Response.Write("Hello! The World");


        ////===============================================
        //// .NET 3.5起的新寫法 (xxxxxBase)。
        //// http://blog.darkthread.net/post-2014-07-11-mock-httprequest.aspx
        //// http://stackoverflow.com/questions/1452522/how-do-i-convert-an-httprequestbase-into-an-httprequest-object
        //// 微軟MSDN。 http://msdn.microsoft.com/zh-tw/library/system.web.httpresponsewrapper(v=vs.110).aspx

        //HttpResponseBase HRB = new HttpResponseWrapper(Context.Response);
        //HRB.Write("Hello! The World");
    }
}
