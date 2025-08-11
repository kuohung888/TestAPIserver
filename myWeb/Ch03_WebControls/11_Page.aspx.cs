using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ch03_WebControls_11_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button Button1 = new Button();
        Button1.Text = "程式裡頭，動態產生的按鈕";
        Button1.ID = "Button1";
        Page.Form.Controls.Add(Button1);
        


        TextBox TextBox1 = new TextBox();
        TextBox1.Text = "程式裡頭，動態產生的文字輸入方塊";
        TextBox1.ID = "TextBox1";
        Page.Form.Controls.Add(TextBox1);
    }
}
