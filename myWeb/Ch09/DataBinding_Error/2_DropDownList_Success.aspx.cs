using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch09_DataBinding_Error_2_DropDownList_Success : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource2_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        DropDownList1.DataSourceID = "SqlDataSource1";
        //也可以寫成 DropDownList1.DataBind();

        //或是寫成
        // DropDownList1.DataSource = SqlDataSource1;  //注意！這裡的 SqlDataSource 沒有「雙引號」
        // DropDownList1.DataBind();
    }
}