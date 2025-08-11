using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_RowCreated_RowDataBound_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Response.Write("<hr /><font color=red>RowCreated事件 ----");
            Response.Write("e.Row.RowIndex = " + e.Row.RowIndex + "<br /></font>");
        }
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Response.Write("<font color=blue>RowDataBound事件 ----");
            Response.Write("e.Row.RowIndex = " + e.Row.RowIndex + "<br /></font>");
        }
    }
}