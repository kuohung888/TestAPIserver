using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_Default_book_GridView_Template_3_jQuery : System.Web.UI.Page
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
            LinkButton d_button = (LinkButton)e.Row.Cells[0].FindControl("Button1");
            //註解：先抓住第一格裡面的第一個控制項，是一個按鈕（Button）控制項。
            //          然後，在這個按鈕控制項上面，添加 JavaScript（如下）。

            //正確執行 ---- 
            //d_button.OnClientClick = "javascript:return deleteItem(&#39;" + GridView1.ID+ "&#39;, &#39;Delete$" + e.Row.RowIndex.ToString() + "&#39;, this.alt);";
            //d_button.OnClientClick = "javascript:return deleteItem(this.name, 0, this.alt);";

            //Response.Write("javascript:return deleteItem(&#39;" + GridView1.ID + "&#39;, &#39;Delete$" + e.Row.RowIndex.ToString() + "&#39;);");
            //Response.Write("<br/>");
            
            
            
            //d_button.Attributes.Add("onclick", "javascript:return deleteItem(" + d_button.UniqueID + ", " + d_button.CommandArgument + ");");
            //****************************************************************
            //** 寫在畫面前端的 function deleteItem(uniqueID, itemID)
            //** 第一個參數：控制項的ID。如 GridView1。
            //** 第二個參數：要刪除的那一筆記錄的PK值（主索引鍵）。如Delete$1。
        }
    }
}