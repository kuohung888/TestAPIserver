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

public partial class Ch16_Cookie_Second : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string redirect = Request.QueryString["redirect"];
        string acceptsCookies;

        if (Request.Cookies["TestCookie"] == null)
        {
            acceptsCookies = "no";    
        }
        else  
        {
            acceptsCookies = "yes";
            //—註解：讓 Cookie過期失效。
            Response.Cookies["TestCookie"].Expires = DateTime.Now.AddDays(-1);
        }

        Response.Redirect(redirect + "?AcceptsCookies=" + acceptsCookies, true);
        //又回到第一個網頁 Cookie_First.aspx
    }
}
