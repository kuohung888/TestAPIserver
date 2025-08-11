using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Sorting : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_Sorted(object sender, EventArgs e)
    {
        //-- 參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.sorting.aspx
        
        Label1.Text = "Sorting by <font color=red>" + GridView1.SortExpression.ToString() + "</font> in <font color=blue>" + 
                             GridView1.SortDirection.ToString() + "</font> order.";
    }
}