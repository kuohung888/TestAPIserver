using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_0_Page_Load_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 務必把 Label1的文字（Text屬性）預設為零。
        if (!Page.IsPostBack)
        {
            //-- 第一次執行網頁。
            Response.Write("網頁<b>第一次執行</b>....Page_Load事件......<br />");
        }
        else
        {
            int i = Convert.ToInt32(Label1.Text) + 1;
            Label1.Text = i.ToString();
            //*********************************************
            //-- 跟上一隻程式不同（第一次執行，Label就會變成 1）。
            //-- 本範例第一次執行，Label仍然保持 0。必須按下按鈕才會加一。

            Response.Write("網頁重新PostBack（回傳）....Page_Load事件......<br />");
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("按下[按鈕]....Button的 Click事件......<br />");
    }
}