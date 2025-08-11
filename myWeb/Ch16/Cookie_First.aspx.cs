using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch16_Cookie_First : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // 測試「是否接受 Cookie？」
            if (Request.QueryString["AcceptsCookies"] == null)
            {
                //—註解：判斷是否接受 Cookie 的一種方法，是嘗試寫入 Cookie然後再次嘗試讀取 Cookie。
                Response.Cookies["TestCookie"].Value = "ok";

                Response.Cookies["TestCookie"].Expires = DateTime.Now.AddMinutes(1);
                //—註解：讓 Cookie過期時間為一分鐘之後，就會失效。

                Response.Redirect("Cookie_Second.aspx?redirect=" + Server.UrlEncode(Request.Url.ToString()));
                //—導向到第二個網頁(檔名Cookie_Second.aspx)。
            }
            else
            {
                Label1.Text = "接受 Cookie，且Cookie的值為： " + Server.UrlEncode(Request.QueryString["AcceptsCookies"]);
            }

        }
    }
}
