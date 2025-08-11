using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Multi_Edit : System.Web.UI.Page
{
    //****************************************************
    private bool tableCopied = false;
    private System.Data.DataTable originalDataTable;
    //****************************************************


    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (!tableCopied)
            {
                originalDataTable = ((System.Data.DataRowView)e.Row.DataItem).Row.Table.Copy();
                //先把每一列的DataTable「結構」，複製下來。

                ViewState["originalValuesDataTable"] = originalDataTable;
                tableCopied = true;
            }
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        originalDataTable = (System.Data.DataTable)ViewState["originalValuesDataTable"];

        foreach (GridViewRow r in GridView1.Rows)
        {
            if (IsRowModified(r))   //底下有一個function，自己寫的。
            {
                GridView1.UpdateRow(r.RowIndex, false);
                // 程式裡面，還有一個重點，
                //就是 GridView的 .UpdateRow()方法
                //http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.updaterow%28v=VS.100%29.aspx
                //我們要在這個方法加入的參數，有兩個，
                //分別是「要修改的那一列的索引（RowIndex）」與「是否進行驗證？（預設值為 false）」
            }
        }

        // Rebind the Grid to repopulate the original values table.
        tableCopied = false;

        GridView1.Visible = false;

        GridView2.Visible = true;
        GridView2.DataBind();   // 重新DataBinding，展示「批次更新」以後的最新紀錄。
    }


    protected bool IsRowModified(GridViewRow r)
    {
        int currentID;
        string currentTest_Time;
        string currentTitle;

        currentID = Convert.ToInt32(GridView1.DataKeys[r.RowIndex].Value);
        // 主索引鍵！PK！

        currentTest_Time = ((TextBox)r.FindControl("test_timeTextBox")).Text;
        currentTitle = ((TextBox)r.FindControl("titleTextBox")).Text;

        System.Data.DataRow row = originalDataTable.Select(String.Format("ID = {0}", currentID))[0];
        // DataTable裡面的資料列（DataRow）

        // 下面是資料表的「欄位名稱」。
        if (!currentTest_Time.Equals(row["test_time"].ToString())) { return true; }
        if (!currentTitle.Equals(row["title"].ToString())) { return true; }

        return false;
    }
}