using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch07_Default_book_GridView_Light_3_JavaScript_CodeBehind : System.Web.UI.Page
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
            //*** 方法一  ************************************************************************
            //==要加入 JavaScript的光棒效果，每一列（Row）都必須加入才行。
            //== e.Row代表每一列，轉成HTML之後就是表格的 <tr>標籤。
            e.Row.Attributes.Add("OnMouseover", "this.style.backgroundColor='#E3EAEB'");
            e.Row.Attributes.Add("OnMouseout", "this.style.backgroundColor='#FFFFFF'");


            //*** 方法二  ************************************************************************
            //== JavaScript的光棒效果，加到每一個格子（Cells）裡面。
            //for (int i = 0; i < e.Row.Cells.Count; i++)    //==計算每一列有幾個格子？
            //{
            //    e.Row.Cells[i].Attributes.Add("OnMouseover", "this.style.backgroundColor='#E3EAEB'");
            //    e.Row.Cells[i].Attributes.Add("OnMouseout", "this.style.backgroundColor='#FFFFFF'");
            //}
        }
    }

}