using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_TextBox_DefaultValue_TextChanged : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        //TextBox1.Text = "@@@ Page_Init事件給予的預設值 @@@" + DateTime.Now.ToLongTimeString();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            //-- 第一次執行網頁
            TextBox1.Text = "Page_Load事件，「第一次」給予的預設值" + DateTime.Now.ToLongTimeString();
        else
            TextBox1.Text = "=== Page_Load事件，「第N次」給予的預設值 ===" + DateTime.Now.ToLongTimeString();
        
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //-- 按下按鈕，輸入一個 TextBox的預設值
        TextBox1.Text = "*** Button給予的預設值 ***" + DateTime.Now.ToLongTimeString();
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Label1.Text = "*** TextBox1_TextChanged觸發事件！！***" + DateTime.Now.ToLongTimeString();
    }
}