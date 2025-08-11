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

public partial class Ch02_8_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //註解：判別「使用者輸入的值」是否大於10？
        int a = 15;

        if (a > 10)
        {
            Response.Write("恭喜！a的值，大於10喔！");
        }
        else
        {
            Response.Write("抱歉！a的值，小於10。");
        }
    }
}
