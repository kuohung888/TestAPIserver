using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_sender_Button_021 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // *** 三個按鈕，都指向同一個事件 ***
        Button1.Click += new System.EventHandler(this.Button1_MIS2000Click);  // "事件名稱"寫在最後
        Button2.Click += new System.EventHandler(this.Button1_MIS2000Click);
        Button3.Click += new System.EventHandler(this.Button1_MIS2000Click);
    }

    protected void Button1_MIS2000Click(object sender, EventArgs e)
    {
        Response.Write("Hello! The World!  <br>");
        Response.Write("網頁執行時間：" + DateTime.Now.ToLongTimeString());
    }

    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    Response.Write("Hello! The World!  <br>");
    //    Response.Write("網頁執行時間：" + DateTime.Now.ToLongTimeString());
    //}

    //protected void Button3_Click(object sender, EventArgs e)
    //{
    //    Response.Write("Hello! The World!  <br>");
    //    Response.Write("網頁執行時間：" + DateTime.Now.ToLongTimeString());
    //}
}