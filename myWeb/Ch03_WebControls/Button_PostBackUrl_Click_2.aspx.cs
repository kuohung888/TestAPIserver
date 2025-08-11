using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_Button_PostBackUrl_Click_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(10000);
        //--系統會沉睡10秒鐘（10,000毫秒）

        Response.Write("<script>window.alert(\"Hello...The World\");</script>");


        Response.Redirect("http://www.dotblogs.com.tw/mis2000lab/");
    }
}