using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_SubString_RowDataBound : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string summary = e.Row.Cells[2].Text;

            if (summary.Length > 60)
            {
                e.Row.Cells[2].Text = summary.Substring(0, 60) + "......";
                // .Substring()方法，從零算起的第幾個字「長度」。
            }

        }
    }
}