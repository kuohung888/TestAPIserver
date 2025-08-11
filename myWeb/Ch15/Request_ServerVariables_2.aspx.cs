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

//=========自己寫========
using System.Collections.Specialized;
using System.Text;

public partial class Ch15_Request_ServerVariables_2 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        NameValueCollection ServerVars;   //需要用到「System.Collections.Specialized」NameSpace
        ServerVars = Request.ServerVariables;

        StringBuilder Output_Str = new StringBuilder();

        foreach (string serverVar in ServerVars)
        {   // foreach迴圈可以抓取物件集合，一次處理一個
            Output_Str.Append("<font color=red>" + serverVar + "</font> &nbsp; &nbsp; &nbsp; ");
            Output_Str.Append(Request.ServerVariables[serverVar] + "<hr>");
        }

        Label1.Text = Output_Str.ToString();
    }
}
