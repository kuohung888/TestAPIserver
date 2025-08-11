using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_TextWrap_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[2].Style.Add("word-break", "break-all");
            // 動態加入CSS的「Style」

            //執行成果，畫面的HTML原始檔：
            //    <td style="color:#CC0066;width:150px;word-break:break-all;">
            //    每一列的第三格（title欄位）都有這段CSS。
        }
    }
}