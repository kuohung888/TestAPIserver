using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_TextBox_TextMode_Password_02_AJAX : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != TextBox2.Text)
        {
            Label1.Text = "<big>密碼錯誤，請重新輸入</big>" + System.DateTime.Now.ToLongTimeString();
            //---- 寫成 JavaScript不會動。
            //Label1.Text = "<script language=javascript>window.alert('密碼錯誤，請重新輸入');</script>";
            TextBox1.Focus();
        }
        else
        {
            Label1.Text = "<hr />您輸入的密碼 -- " + TextBox1.Text + System.DateTime.Now.ToLongTimeString();
        }
        
    }
}