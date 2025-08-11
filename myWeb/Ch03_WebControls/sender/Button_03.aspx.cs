using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_sender_Button_03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button BTN = (Button)sender;
        //另外一種寫法 Button BTN = sender as Button;   // 只有C#這樣寫。

        Response.Write("Hello! The World! -- " + BTN.ID);

        Response.Write("<br>網頁執行時間：" + DateTime.Now.ToLongTimeString());
    }

}