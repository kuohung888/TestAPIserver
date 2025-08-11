using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_Default_book_GridView_Light_4_CSS_CodeBehind : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //-- 請參考微軟MSDN網站的說明：
        //   參考網址  http://msdn2.microsoft.com/zh-tw/library/system.web.ui.webcontrols.datacontrolrowtype(VS.80).aspx

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //==要加入 CSS的光棒效果，每一列（Row）都必須加入才行。<tr class="altrow">
            //== e.Row代表每一列，轉成HTML之後就是表格的 <tr>標籤。

            if (e.Row.RowIndex % 2 == 0)
            {   //隔列換色，所以只有偶數列要換底色
                e.Row.Attributes.Add("class", "altrow");
            }

        }
    }
}