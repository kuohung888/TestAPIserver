using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch02_TextBox_ViewState_TextChanged : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
        Label2.Text = "";
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Label1.Text = "*** TextBox1_TextChanged觸發事件！！***" + DateTime.Now.ToLongTimeString();
    }


    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        Label2.Text = "*** TextBox2_TextChanged觸發事件！！***" + DateTime.Now.ToLongTimeString();
    }
}