using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_RowCreated_RowDataBound_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Response.Write("<hr /><font color=red>RowCreated事件 ----");

            //==先把 GridView的每個欄位，轉成「樣版」之後，會比較好透過 .FindContrl()方法抓取。
            Label lb = (Label)e.Row.FindControl("Label1");
            Response.Write(lb.Text + "<br /></font>");
        }
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Response.Write("<font color=blue>RowDataBound事件 ----");

            Label lb = (Label)e.Row.FindControl("Label1");
            Response.Write(lb.Text + "<br /></font>");
        }
    }
}