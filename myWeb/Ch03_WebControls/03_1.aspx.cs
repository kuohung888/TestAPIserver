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

public partial class Ch03_WebControls_3_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Command(object sender, CommandEventArgs e)
    {
        if (e.CommandName == "ABC")  
        {
            Response.Write("<br>2.  您剛剛按下的Button按鈕，其內建的CommandArgument是----");
            Response.Write(e.CommandArgument);
        }    
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //註解： Button1_Click()事件會被優先執行！
        Response.Write("<br> 1. Button按鈕 的 .Click()事件~~");
    }
    
}
