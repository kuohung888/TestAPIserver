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

public partial class Ch15_Page_PostBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {


            
            Response.Write("網頁 [<font color=blue><b>第一次</b></font>] 被執行，才會出現這一行。時間點：" + 
                DateTime.Now.ToLongTimeString() + "<hr />");
        }

        Response.Write("*** 網頁「每次」只要被執行，就出現這行。時間點：" + DateTime.Now.ToLongTimeString() + 
            " ***<hr />");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<font color=Red>您輸入的文字是---" + TextBox1.Text);
        Response.Write("<br/>。時間點：" + DateTime.Now.ToLongTimeString() + "</font><hr />");
    }
}
