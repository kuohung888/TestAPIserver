using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch03_WebControls_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("程式會首先執行 Page_Load事件，這一區喔！" + DateTime.Now.ToLongTimeString());
        // 註解：雖然有兩個事件副程式，但執行順序的先後，是有分別的！
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Response.Write("<h3>謝謝您輸入資料！～～～Bye Bye</h3>....TextBox1_TextChanged" + DateTime.Now.ToLongTimeString());
        // 註解：當第一個欄位（TextBox1）裡面的文字有任何更動，就會自動啟動本區塊的程式。
    }


    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        Response.Write("<h3>必須按下 Button，才觸發TextBox2_TextChanged</h3>" + DateTime.Now.ToLongTimeString());
    }
}
