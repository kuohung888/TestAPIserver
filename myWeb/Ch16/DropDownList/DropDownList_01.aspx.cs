using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_DropDownList_DropDownList_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource2_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        DropDownList1.DataSourceID = "SqlDataSource1";
    }
}