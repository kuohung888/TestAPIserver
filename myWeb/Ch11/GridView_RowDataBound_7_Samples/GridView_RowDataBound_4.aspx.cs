using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_RowDataBound_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        Response.Write("<br /><br /><b>RowCreated事件</b><hr />");
        //== 通常都會搭配這幾段 if 判別式
        if (e.Row.RowType == DataControlRowType.Header)
        {
            //-- 只有 GridView呈現「表頭」列的時候，才會執行這裡！
            Response.Write("「表頭」列<font color=blue>DataControlRowType.Header </font><br />");
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //-- 當 GridView呈現「每一列」資料列（記錄）的時候，才會執行這裡！
            //-- 所以這裡就像迴圈一樣，會反覆執行喔！！
            Response.Write("「每一列」資料列（記錄）DataControlRowType.DataRow<br />");
        }

        //*********************************************************
        //*** 重點！！請您瞭解這個事件的參數 e代表什麼意思？ ***
        //*********************************************************
        //-- 這個事件的「e」，代表 GridView產生畫面上的「每一列」。
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Response.Write("<hr /><font color=red>RowDataBound事件</font><hr />");
        //== 通常都會搭配這幾段 if 判別式
        if (e.Row.RowType == DataControlRowType.Header)
        {
            //-- 只有 GridView呈現「表頭」列的時候，才會執行這裡！
            Response.Write("「表頭」列<font color=blue>DataControlRowType.Header </font><hr /><br />");
        }

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //-- 當 GridView呈現「每一列」資料列（記錄）的時候，才會執行這裡！
            //-- 所以這裡就像迴圈一樣，會反覆執行喔！！
            Response.Write("「每一列」資料列（記錄）<font color=red>DataControlRowType.DataRow</font><br />");
        }

        //*********************************************************
        //*** 重點！！請您瞭解這個事件的參數 e代表什麼意思？ ***
        //*********************************************************
        //-- 這個事件的「e」，代表 GridView產生畫面上的「每一列」。
    }
}