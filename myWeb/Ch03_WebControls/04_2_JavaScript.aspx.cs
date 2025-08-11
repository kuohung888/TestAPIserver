using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_4_2_JavaScript : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "1. 程式會首先執行 Page_Load()這一區喔！";
        Label1.Visible = true;
        // 如果不把 Label的 Text清空，就必須用這種方法把他隱形。畫面才好看！
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Label2.Text = "<h3>2. 謝謝您輸入資料！～～～Bye Bye</h3>";
        Label2.Visible = true;
        // 如果不把 Label的 Text清空，就必須用這種方法把他隱形。畫面才好看！
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label3.Text = "<font color=blue>";
        Label3.Text += "3. 您按下按鈕囉！您輸入的文字是---- <Script Language=\"Javascript\">window.alert(\"警告視窗！\");</Script>" + TextBox1.Text;
        Label3.Text += "</font>";
        //註解：要輸出雙引號（"），請寫成 \"


        //======================================
        // 關於 C#字串，請參閱：  http://msdn.microsoft.com/zh-tw/library/ms228362(v=vs.80).aspx
        //                                   http://www.allenkuo.com/GenericArticle/view.aspx?id=28
        // 不想使用「\"」符號的話，請改用＠放在字串前面。變可以使用兩個「雙引號("""")」來代替。
        //======================================
        //Label3.Text = @"<font color=""blue"">";
        //Label3.Text += "3. 您按下按鈕囉！您輸入的文字是---- ";
        //Label3.Text +=@"<Script Language=""Javascript"">window.alert(""警告視窗！"");</Script>" + TextBox1.Text;
        //Label3.Text += "</font>";
    }

}