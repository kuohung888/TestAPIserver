using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_0_Concept_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label lb = (Label)GridView1.Rows[0].Cells[2].Controls[0];
        Response.Write("GridView1.Rows[0].Cells[2].Controls[0]的值 ---" + lb.Text);

        // (1).  上面的程式會出錯，必須把 Label改成 LiteralControl才對！
        //-- 任何不在伺服器上處理的 HTML 標記或文字字串，都會被視為 LiteralControl 物件。
        //-- 參考網址  http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.controls%28v=vs.80%29

        // (2). 修正以後，還是錯！！！
        //--     還是抓不到！  ......錯誤訊息：指定的引數超出有效值的範圍。


    }
}