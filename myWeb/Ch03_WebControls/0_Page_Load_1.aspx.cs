using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_MIS2000Lab_book_image_0_Page_Load_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // 務必把「畫面上」 Label1的文字（Text屬性）預設為零。

        //// 方法一：=========================================
        int i = Convert.ToInt32(Label1.Text) + 1;
        //// 等號的兩邊，必須是相同的資料型態（在此為「整數」），不然 C#會報錯！VB會自動更正，所以比較簡單。

        //// 方法二：=========================================
        //int i = 0;
        //if (Int32.TryParse(Label1.Text, out i))
        //{   // 轉型成功，才會傳回 int結果
        //    i++;
        //}                
        //// 參考資料  http://www.dotblogs.com.tw/mis0800/archive/2014/01/29/142508.aspx
        ////                  http://hamiltonserena.blogspot.tw/2012/10/c-intparseinttryparseconverttoint32.html
        //// MSDN簡單說明  https://msdn.microsoft.com/zh-tw/library/bb384043.aspx
        ////  Int32.TryParse()  https://msdn.microsoft.com/zh-tw/library/f02979c7(v=vs.110).aspx


        Label1.Text = i.ToString();
        // i是整數，必須轉成字串（透過 .ToString()方法）。道理跟上面一樣。
        // 等號的兩邊，必須是相同的資料型態（在此為「字串」），不然 C#會報錯！VB會自動更正，所以比較簡單。
    }
}