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

public partial class Ch02_5_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
           Response.End();    
           //註解：程式在此中斷停止，下一行程式碼將永遠無法被執行之。

           Response.Redirect("http://www.find.org.tw/");

    }
}
