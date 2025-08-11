using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch02_14_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //在畫面上，連續印出a1，a2，a3……，a100（解決範例14.aspx的缺失）
        for (int i = 1; i < 101; i++)
        {
            Response.Write("a" + i);  //註解：”a”是字串，而後面的 i是變數。

            //*************************************************
            // 範例14.aspx還有一個小缺點，就是到了最後一個 a100。程式就該結束，
            // 但畫面上卻多了一個「，」號，讓輸出畫面不美觀。
            // 我加上一個if判別式來解決這個問題
            //*************************************************
            if (i < 100)      //註解：寫成 if (i != 100)也可以。  != 表示「不」等於
            {
                Response.Write(" ，<br />");
            }

        }
    }
}
