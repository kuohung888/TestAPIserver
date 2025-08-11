using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GridView_RowDataBound_2_CaseStudy_PreRender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        // 在控制項呈現到畫面「之前」，做最後的處理
        int sum = 0;
               
        foreach (GridViewRow GV_Row in GridView1.Rows)
        {   // 參考範例  http://www.dotblogs.com.tw/mis2000lab/archive/2012/01/13/gridview_multi_row_updating_20120113.aspx

            sum += Convert.ToInt32(GV_Row.Cells[5].Text);
        }

        Label1.Text = "這一頁，數學成績的加總 = " + sum;
    }
}