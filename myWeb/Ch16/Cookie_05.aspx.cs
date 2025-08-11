using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Ch16_Cookie_05 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        StringBuilder output = new StringBuilder();
        HttpCookie aCookie;

        for (int i = 0; i <= (Request.Cookies.Count); i++)
        {
            aCookie = Request.Cookies[i];
            output.Append("Cookie name is <font color=red>" + Server.HtmlEncode(aCookie.Name) + "</font><br />");
            output.Append("Cookie value is <font color=red>" + Server.HtmlEncode(aCookie.Value) + "</font><hr />");
        }

        Label1.Text = output.ToString();

    }
}
