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

public partial class Ch08_Default_book_GridView_Template_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //請參考微軟MSDN網站的說明：
        //   參考網址  http://msdn2.microsoft.com/zh-tw/library/system.web.ui.webcontrols.datacontrolrowtype(VS.80).aspx

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Button d_button = (Button)e.Row.Cells[0].FindControl("Button1");
            //註解：先抓住第一格裡面的第一個控制項，是一個按鈕（Button）控制項。
            //          然後，在這個按鈕控制項上面，添加 JavaScript（如下）。

            //正確執行 ---- 
            d_button.OnClientClick = "javascript:return confirm('再一次確認，您確定要對 id編號-- " + e.Row.Cells[1].Text + " 的資料，進行處置動作嗎？')";
            //d_button.Attributes.Add("onclick", "javascript:if (confirm('再一次確認，您確定要刪除嗎？')){return true;} else {return false;}");
        }
    }

}
