using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowCreated_RowDataBound_0 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if(e.Row.RowType == DataControlRowType.DataRow)
        {
            Response.Write("<font color=blue>");
            Response.Write("<p>RowCreated事件--" + e.Row.Cells[1].Text.Length + "<br />");
            Response.Write("</font>");
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Response.Write("RowDataBound事件--" + e.Row.Cells[1].Text.Length + "</p>");
        }
    }
}