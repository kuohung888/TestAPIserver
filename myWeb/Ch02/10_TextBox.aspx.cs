using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch02_10_TextBox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //註解：判別「使用者輸入的值」是否大於10？

        if (Convert.ToInt32(TextBox1.Text) > 10)
        {
            Response.Write("恭喜！您輸入的值，大於10喔！");
        }
        else
        {
            //註解：「不大於10」代表：使用者輸入的值，一定是「小於」或「等於」10，
            //     我們只需再利用一次 if判別式，就能正確得到答案了。

            if (Convert.ToInt32(TextBox1.Text) == 10)
            {
                Response.Write("您輸入的值，剛好等於10。");
            }
            else
            {
                Response.Write("抱歉！您輸入的值，小於10。");
            }

        }

    }
}