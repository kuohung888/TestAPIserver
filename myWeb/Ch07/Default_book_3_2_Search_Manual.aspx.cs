using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch07_Default_book_3_2_Search_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //==按下搜尋的 Button按鈕之後，才讓 GridView1做 DataBinding 並顯示資料

        GridView1.DataSourceID = "SqlDataSource1";
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //==按下GridView1的「Select」的按鈕之後，才讓 GridView2做 DataBinding 並顯示資料

        GridView2.DataSourceID = "SqlDataSource2";
    }

}