using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Sorting_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (ViewState["mySorting"] == null)
        {
            e.SortDirection = SortDirection.Ascending;
            ViewState["mySorting"] = "Ascending";
        }
        else  {
            //-- 如果目前的排序方法，已經是「正排序」，那再度按下排序欄位之後，就變成「反排序」。
            if (ViewState["mySorting"].ToString() == "Ascending")
            // C#語法這裡不太一樣!!務必加上 .ToString()才能正常運作
            {
                e.SortDirection = SortDirection.Descending;
                ViewState["mySorting"] = "Descending";
            }
            else  {
                e.SortDirection = SortDirection.Ascending;
                ViewState["mySorting"] = "Ascending";
            }

        }
        
        TextBox1.Text = e.SortDirection.ToString();

        TextBox2.Text = e.SortExpression.ToString();
    }


    protected void GridView1_Sorted(object sender, EventArgs e)
    {
        //-- 參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.sorting.aspx

        Label1.Text = "Sorting by <font color=red>" + GridView1.SortExpression.ToString() + "</font> in <font color=blue>" +
                             GridView1.SortDirection.ToString() + "</font> order.";
    }
}