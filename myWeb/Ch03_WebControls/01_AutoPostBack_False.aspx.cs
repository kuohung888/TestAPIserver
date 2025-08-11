using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_01_AutoPostBack_False : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("程式會首先執行 Page_Load事件這一區喔！" + DateTime.Now.ToLongTimeString());
        // 註解：雖然有兩個事件副程式，但執行順序的先後，是有分別的！
    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        Response.Write("<h3>謝謝您輸入資料！～～～Bye Bye</h3>" + DateTime.Now.ToLongTimeString());
        // 註解：當第一個欄位（TextBox1）裡面的文字有任何更動，就會自動啟動本區塊的程式。
    }
}