using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_TextBox_TextMode_Password_01_Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        if (TextBox1.Text != TextBox2.Text)
        {
            Response.Write("<script language=javascript>window.alert('密碼錯誤，請重新輸入');</script>");
            TextBox1.Focus();
        }
        else
        {
            Response.Write("您輸入的密碼 -- " + TextBox1.Text);
        }
        
    }
}