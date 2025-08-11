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

public partial class Ch02_12 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int u_int = Convert.ToInt32(Request["u_number"]);

        switch(u_int)
        {   // 改寫 範例11.aspx
            case 1:
                Response.Redirect("http://www.find.org.tw/");
                break;
            case 2:
                Response.Redirect("http://www.iii.org.tw/");
                break;
            case 3:
                Response.Redirect("http://www.yahoo.com.tw/");
                break;
            default:
                //註解：如果使用者不輸入數字的話，就會出現警告訊息。
                Response.Write("使用者務必輸入一個數字！限定1~3 ---- [switch...case版]");
                break;
        }
    }
}
