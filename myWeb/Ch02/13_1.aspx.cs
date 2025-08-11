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

public partial class Ch02_13_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int u_sum = 0;

        for (int i = 100; i >= 1; i--)
        {  //註解：請計算1+2+3+4+....+99+100 ，答案等於多少？
            u_sum = u_sum + i;
            Response.Write(i + "<br />");
        }
        Response.Write("從1累加到100；<hr />計算1+2+3+4+....+99+100，答案是--- " + u_sum);
    }
}
