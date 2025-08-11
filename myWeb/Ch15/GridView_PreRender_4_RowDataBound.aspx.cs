using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowDataBound_2_CaseStudy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //-- 當 GridView呈現「每一列」資料列（記錄）的時候，才會執行這裡！
            //-- 所以這裡就像迴圈一樣，會反覆執行喔！！

            if (Convert.ToInt32(e.Row.Cells[5].Text) < 60)
            {
                e.Row.Cells[5].ForeColor = System.Drawing.Color.Red;   //-- 把第六格的資料列（記錄）"格子"，變成紅色。
                e.Row.Cells[5].Font.Bold = true;
            }

            //*********************************************************
            //*** 重點！！請您瞭解這個事件的參數 e代表什麼意思？ ***
            //*********************************************************
            //-- 這個事件的「e」，代表 GridView產生畫面上的「每一列」。
        }

    }
}