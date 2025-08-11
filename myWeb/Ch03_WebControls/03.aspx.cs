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

public partial class Ch03_WebControls_3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Command(object sender, CommandEventArgs e)
    {
        Response.Write("<br />2.  Command事件 **** 您剛剛按下的Button按鈕，其內建的CommandArgument是----");
        Response.Write(e.CommandArgument);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.Write("<br />2.  Click事件 **** 您剛剛按下的Button按鈕，其內建的CommandArgument是----");
        //Response.Write(e.CommandArgument);

        //*************** 上面的兩句錯誤程式！！ ***************
        // 因為Button控制項的CommandName、CommandArgument這兩個屬性，
        // 只能夠搭配Button1_Command( )事件副程式來撰寫程式而已。請切記此重點！！
        //---------------------------------------------------------------
        //-- 不然的話，您寫成 Button1.CommandArgument 也可以。

        Response.Write("<br />1.  Click事件 **** 您剛剛按下的Button按鈕，其內建的CommandArgument是----");
        Response.Write(Button1.CommandArgument);
    }
}
