using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ch03_WebControls_11_FindControl_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button Button1 = new Button();
        this.PlaceHolder1.Controls.Add(Button1);
        Button1.ID = "Button_DynaAdd";    //==重點！！==
        Button1.Text = "程式裡頭，動態產生的按鈕";
        

        TextBox TextBox1 = new TextBox();
        this.PlaceHolder1.Controls.Add(TextBox1);
        TextBox1.ID = "TextBox_DynaAdd";    //==重點！！==
        TextBox1.Text = "程式裡頭，動態產生的文字輸入方塊";
        

        //==============================================
        //== 透過 FindControl抓取 PlaceHolder裡面的「子控制項」
        TextBox getTextBox = new TextBox();
        getTextBox = (TextBox)this.PlaceHolder1.FindControl("TextBox_DynaAdd");

        Label1.Text = getTextBox.Text;


        //***********************************************
        //*** 當您修改「動態產生的Text」身體裡面的值，再按下一次按鈕。
        //*** ......還能抓到您修改後的文字（值）嗎？
        Label2.Text = (String)Request[getTextBox.UniqueID];
        //重點！寫成這樣會報錯！！  Label2.Text = Request[getTextBox.UniqueID].ToString();
    }
}
