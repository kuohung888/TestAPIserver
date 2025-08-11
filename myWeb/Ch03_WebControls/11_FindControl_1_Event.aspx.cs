using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ch03_WebControls_11_FindControl_1 : System.Web.UI.Page
{
    //--正確執行--
    protected void Page_Init(object sender, EventArgs e)
    {
        Button Button1 = new Button();
        this.PlaceHolder1.Controls.Add(Button1);
        Button1.ID = "Button_DynaAdd";    //==重點！！==
        Button1.Text = "程式裡頭，動態產生的按鈕（按下之後，會執行自訂的事件--myButton1EventHandler）";
        

       //=========================================
        Button1.Click += new System.EventHandler(this.myButton1EventHandler);
        //-- 自訂的事件。建議寫在 Page_Init()裡面。
       //-- 資料來源：http://msdn.microsoft.com/zh-tw/library/t3d01ft1%28v=VS.100%29.aspx
       //=========================================


        TextBox TextBox1 = new TextBox();
        this.PlaceHolder1.Controls.Add(TextBox1);
        TextBox1.ID = "TextBox_DynaAdd";    //==重點！！==
        TextBox1.Text = "程式裡頭，動態產生的文字輸入方塊";
    }


    //--正確執行--但不建議使用！！！
    protected void Page_Load(object sender, EventArgs e)
    {
        //Button Button1 = new Button();
        //this.PlaceHolder1.Controls.Add(Button1);
        //Button1.ID = "Button_DynaAdd";    //==重點！！==
        //Button1.Text = "程式裡頭，動態產生的按鈕（按了也沒用）";
        
        
        //TextBox TextBox1 = new TextBox();
        //this.PlaceHolder1.Controls.Add(TextBox1);
        //TextBox1.ID = "TextBox_DynaAdd";    //==重點！！==
        //TextBox1.Text = "程式裡頭，動態產生的文字輸入方塊";
        
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        //== 透過 FindControl抓取 PlaceHolder裡面的「子控制項」
        TextBox getTextBox = new TextBox();
        getTextBox = (TextBox)this.PlaceHolder1.FindControl("TextBox_DynaAdd");

        Label1.Text = getTextBox.Text;
    }


    //=============================================
    protected void myButton1EventHandler(object sender, EventArgs e)
    {
        Response.Write("<script language=javascript>window.alert(\"自訂的事件-- myButton1EventHandler\");</script>");
    }
    //=============================================
}
