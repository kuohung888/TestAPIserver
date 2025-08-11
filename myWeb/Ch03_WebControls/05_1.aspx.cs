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

public partial class Ch03_WebControls_5_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "Yahoo")
        {
            HyperLink1.Text = "台灣Yahoo!";
            HyperLink1.NavigateUrl = "http://www.yahoo.com.tw/";
            HyperLink1.Target = "_blank";
        }
    }

    protected void Button2_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "FIND")
        {
            HyperLink1.Text = "資策會FIND網站";
            HyperLink1.NavigateUrl = "http://www.find.org.tw/";
            HyperLink1.Target = "_blank";
        }
    }

    protected void Button3_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "MIS2000")
        {
            HyperLink1.Text = "MIS2000 Lab.網站";
            HyperLink1.NavigateUrl = "http://www.dotblogs.com.tw/mis2000lab/";
            HyperLink1.Target = "_blank";
        }
    }
}
