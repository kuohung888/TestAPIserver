using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch02_8_TextBox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //註解：判別「使用者輸入的值」是否大於10？

        int a = Convert.ToInt32(TextBox1.Text);
        // C#語法比較嚴謹，務必先把輸入的值，轉成適當的格式
        //    （例如：本範例轉成 Int整數型態），否則就會報錯！

        if (a > 10)
        {
            Response.Write("恭喜！您輸入的值，大於10喔！");
        }
        else
        {
            Response.Write("抱歉！您輸入的值，小於10。");
        }
    }
}