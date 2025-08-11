using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ch03_WebControls_4_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("1. 程式會首先執行 Page_Load事件這一區喔！" + System.DateTime.Now.ToLongTimeString());
        // 註解：畫面上的控制項，全部載入完成，這裡的程式就會被啟動。
        //            所以這一區是最早被執行的。

        Label1.Text = "1. 程式會首先執行 Page_Load這一區喔！" + System.DateTime.Now.ToLongTimeString();
        Label1.Visible = true;
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Response.Write("<br /><big>2. 謝謝您輸入資料！TextBox1_TextChanged事件～～～</big>" + System.DateTime.Now.ToLongTimeString());
        //註解：如果「TextBox1」不輸入任何文字，就不會執行到這一區的程式！
        //           簡單的說，沒有動作，就不會觸發這一區的程式。

        Label2.Text = "<big>2. 謝謝您輸入資料！TextBox1_TextChanged事件～～～</big>" + System.DateTime.Now.ToLongTimeString(); 
        Label2.Visible = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<br />3. 您按下按鈕囉！" + System.DateTime.Now.ToLongTimeString());
        Response.Write("<h3>您輸入的文字是----" + TextBox1.Text + "</h3>");


        Label3.Text = "3. 您按下按鈕囉！" + System.DateTime.Now.ToLongTimeString() + "<h3>您輸入的文字是----" + TextBox1.Text + "</h3>";
        Label3.Visible = true;
    }


}
