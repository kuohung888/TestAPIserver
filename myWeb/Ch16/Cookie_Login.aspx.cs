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

public partial class Ch16_Cookie_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "123" & TextBox2.Text == "123")
        {
            Response.Cookies["u_name"].Value = "123";

            Response.Cookies["Login"].Value = "OK";
            Response.Cookies["Login"].Expires = DateTime.Now.AddDays(30);
            //登入成功，這個Cookie的期限是三十天內都有效！

            //Response.Cookies["Login"].Secure = true;   //只能透過 HTTPS (SSL)來傳輸 Cookie
            Response.Cookies["Login"].HttpOnly = true;
            //*** 這兩個重點，均可增加 Cookies的安全性！很重要！！ ***
            // 如果您想學習更多 Cookies屬性，請上網搜尋MSDN網站的「HttpCookie類別」。

            // 請看看這兩篇文章：http://atic-tw.blogspot.tw/2013/07/cookie-secure-httponlyaspnet.html
            // http://blog.miniasp.com/post/2009/11/26/Using-HttpOnly-flag-to-avoid-XSS-attack.aspx 
        }

        Response.Redirect("Cookie_Login_end.aspx");
        //登入後，不管帳號密碼對不對，都會到下一個網頁。
        //帳號密碼正確的人，下一頁會看見正確訊息！
        //帳號密碼錯誤的人，下一頁會看見錯誤訊息。

    }
}
