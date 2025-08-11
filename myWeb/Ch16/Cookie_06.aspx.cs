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
using System.Text;

public partial class Ch16_Cookie_06 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //本範例將會讀取 Cookie_02.aspx的成果，請您務必「先執行」Cookie_02.aspx一次！
        //========================================================
        StringBuilder output = new StringBuilder();
        HttpCookie aCookie;
        string subkeyName, subkeyValue;

        for(int i = 0; i < (Request.Cookies.Count); i++)
        {
            aCookie = Request.Cookies[i];
            output.Append("Cookie’s Name is " + aCookie.Name + "<br />");
            if (aCookie.HasKeys)
            {
                for(int j = 0; j< (aCookie.Values.Count); j++)
                {
                    subkeyName = Server.HtmlEncode(aCookie.Values.AllKeys[j]);
                    subkeyValue = Server.HtmlEncode(aCookie.Values[j]);
                    output.Append("Subkey name is " + subkeyName + "<br />");
                    output.Append("Subkey value is " + subkeyValue + "<hr />");
                }
            }
            else
            {
                output.Append("Value is " + Server.HtmlEncode(aCookie.Value) + "<hr />");
            }
        }

        Label1.Text = output.ToString();

    }
}
