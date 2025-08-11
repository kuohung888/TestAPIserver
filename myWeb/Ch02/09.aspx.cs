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

public partial class Ch02_9 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ////註解：判別「使用者輸入的值」是否大於10？
        //// 傳統寫法（.NET 1.x）
        //if (Convert.ToInt32(Request.QueryString["u_number"]) > 10)
        //// 簡寫 if (Convert.ToInt32(Request["u_number"]) > 10)
        //{
        //    Response.Write("恭喜！您輸入的值，大於10喔！");
        //}
        //else
        //{
        //    Response.Write("抱歉！您輸入的值，小於10。");
        //}


        //===============================================
        // .NET 3.5起的新寫法 (xxxxxBase)。
        // http://blog.darkthread.net/post-2014-07-11-mock-httprequest.aspx
        // http://stackoverflow.com/questions/1452522/how-do-i-convert-an-httprequestbase-into-an-httprequest-object
        // 微軟MSDN。 http://msdn.microsoft.com/zh-tw/library/system.web.httprequestwrapper(v=vs.110).aspx

        HttpRequestBase HRB = new HttpRequestWrapper(Context.Request);
        HttpResponseBase HRBout = new HttpResponseWrapper(Context.Response);

        if (Convert.ToInt32(HRB.QueryString["u_number"]) > 10)
        //簡寫  if (Convert.ToInt32(HRB["u_number"]) > 10)
        {
            HRBout.Write("恭喜！您輸入的值，大於10喔！");
        }
        else
        {
            HRBout.Write("抱歉！您輸入的值，小於10。");
        }

    }
}
