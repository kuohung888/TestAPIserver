using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_03_Multi_Button : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //-- 重點(1)：共用同一個事件。VB語法必須寫在後面的「Handles」，用逗點(,)區隔。
        //                C#則是寫在HTML畫面的每一個「控制項」裡頭，例如： onclick="Button1_Click"。

        Button btn = (Button)sender;
        Response.Write("<hr />您剛剛按下的按鈕，其CommandArgument屬性為：" + btn.CommandArgument + "<hr />");
    }
}