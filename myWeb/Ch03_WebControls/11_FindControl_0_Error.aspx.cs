using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ch03_WebControls_11_FindControl_0_Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button Button1 = new Button();
        Button1.Text = "程式裡頭，動態產生的按鈕";
        PlaceHolder1.Controls.Add(Button1);


        TextBox TextBox1 = new TextBox();
        TextBox1.ID = "TextBox_DynaAdd";    //==重點！！==
        TextBox1.Text = "程式裡頭，動態產生的文字輸入方塊";
        PlaceHolder1.Controls.Add(TextBox1);
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        //== 透過 FindControl抓取 PlaceHolder裡面的「子控制項」
        TextBox getTextBox = new TextBox();
        getTextBox =  (TextBox)PlaceHolder1.FindControl("TextBox_DynaAdd");

        Label1.Text = getTextBox.Text;
    }
}
