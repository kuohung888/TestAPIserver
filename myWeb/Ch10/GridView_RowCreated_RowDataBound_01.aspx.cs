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
        Response.Clear();
    }


    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        Response.Write("<hr /><font color=red>RowCreated事件 ----<br />");
        Response.Write("&nbsp;&nbsp;      e.Row.RowType = " + e.Row.RowType + "<br />");
        Response.Write("&nbsp;&nbsp;      e.Row.RowState  = " + e.Row.RowState + "<br /></font>");
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Response.Write("<font color=blue>RowDataBound事件 ----<br />");
        Response.Write("&nbsp;&nbsp;      e.Row.RowType = " + e.Row.RowType + "<br />");
        Response.Write("&nbsp;&nbsp;      e.Row.RowState  = " + e.Row.RowState + "<br /></font>");
    }
}