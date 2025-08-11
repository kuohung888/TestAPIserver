using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_4_Calendar2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        Session["RowIndex"] = e.NewEditIndex;
    }


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        int rowIndex = Convert.ToInt32(Session["RowIndex"]);

        TextBox TB = (TextBox)GridView1.Rows[rowIndex].FindControl("TextBox1");

        //*************************************************
        Calendar CA = (Calendar)sender;   //***重點！！***
        //*************************************************
        //參考資料 http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD201409172008273OL.html

        TB.Text = CA.SelectedDate.ToShortDateString();

        //或是參閱我的範例 NamingContainer
        //http://www.dotblogs.com.tw/mis2000lab/archive/2012/11/23/gridview_inside_dropdownlist_namincontainer_20121122.aspx
    }
}