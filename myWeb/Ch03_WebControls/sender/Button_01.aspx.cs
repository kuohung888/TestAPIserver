using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_sender_Button_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("Hello! The World!  <br>");
        Response.Write("網頁執行時間：" + DateTime.Now.ToLongTimeString());
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Write("Hello! The World!  <br>");
        Response.Write("網頁執行時間：" + DateTime.Now.ToLongTimeString());
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Write("Hello! The World!  <br>");
        Response.Write("網頁執行時間：" + DateTime.Now.ToLongTimeString());
    }
}