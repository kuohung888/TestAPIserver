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

public partial class Ch02_14 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //在畫面上，連續印出a1，a2，a3……，a100
        for (int i = 1; i < 101; i++)
        {
            Response.Write("a" + i);  //註解：”a”是字串，而後面的I是變數。
            Response.Write(" ，<br />");   
        }
    }
}
