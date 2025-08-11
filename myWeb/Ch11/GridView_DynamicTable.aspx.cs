using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GridView_DynamicTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource1";
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource2";
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        //**** 抓不到數據！！***************
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    Label LB = (Label)e.Row.Cells[1].FindControl("Label1");
        //    LB.Text = e.Row.Cells[5].Text;
        //}
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label LB = (Label)e.Row.Cells[1].FindControl("Label1");
            LB.Text = e.Row.Cells[5].Text;
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write("Hello");
    }
}