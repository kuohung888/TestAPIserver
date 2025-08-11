using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch16_Cookie_04 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //--註解：第一種寫法。
        if (Request.Cookies["userName"] != null)
        {
            Label1.Text = Server.HtmlEncode(Request.Cookies["userName"].Value);
            //--註解：使用進行 HtmlEnCode編碼，比較安全。。
        }

        //--註解：第二種寫法。
        if (Request.Cookies["userName"] != null)
        {
            HttpCookie aCookie = Request.Cookies["userName"];
            Label2.Text = Server.HtmlEncode(aCookie.Value);
        }
    }
}
