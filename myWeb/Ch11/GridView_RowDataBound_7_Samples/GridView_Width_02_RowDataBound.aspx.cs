using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_Width_02_RowDataBound : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        System.Data.DataRowView drv  = (System.Data.DataRowView)e.Row.DataItem;
        //-- e.Row.DataItem 呈現這一筆記錄的「那一列」

        if (e.Row.RowType == DataControlRowType.DataRow)    //-- 重 點！！
        {
            if (drv != null)
            {
                //-- Response.Write("<br>" + drv[2].ToString());  
                //-- drv(2)就是畫面上，第三個 title欄位

                int catNameLen = (drv[2].ToString()).Length;  //-- 計算這一欄位（第三個，title欄位）的寬度！

                GridView1.Columns[2].ItemStyle.Width = (catNameLen * 50);
                GridView1.Columns[2].ItemStyle.Wrap = false;  //-- 取消「字太多，自動換列」。
            }
        }

    }
}