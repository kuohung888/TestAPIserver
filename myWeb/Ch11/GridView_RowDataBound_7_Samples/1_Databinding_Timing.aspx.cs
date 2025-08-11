using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_GridView_RowCreated_RowDataBound_1_Databinding_Timing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        Response.Write("<font color=red>*** RowCreated （優先執行）***" + System.DateTime.Now.ToLongTimeString() + "</font><br />");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        Response.Write("<h3>*** RowDataBound ***" + System.DateTime.Now.ToLongTimeString() + "</h3>");
    }


    protected void GridView1_DataBinding(object sender, EventArgs e)
    {
        Response.Write("<h3><font color=Green>*** GridView1_DataBinding***" + System.DateTime.Now.ToLongTimeString() + "</font></h3><br />");
    }
}