using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_Case_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DetailsView1_PageIndexChanging(object sender, DetailsViewPageEventArgs e)
    {
        DetailsView1.PageIndex = e.NewPageIndex;
        DetailsView1.DataSourceID = "SqlDataSource2";
        //Response.Write(e.NewPageIndex)   //--頁數從「零」算起

        //====================================
        //-- 這個問題的主角是「DetailsView」，當他一筆一筆的換頁
        //-- GridView的頁數必須隨之連動。
        //====================================
        //-- 運算子「/」表示除法裡面的商數
        GridView1.PageIndex = (e.NewPageIndex / 5);

        //====================================
        //--移動 DetaislView的資料，上面的GridView「光棒」功能也會移動
        //====================================
        GridView1.SelectedIndex = (e.NewPageIndex % 5);
        //-- 5是代表 GridView每一頁有五筆資料
        //-- 運算子 %代表除法所得的「餘數」。

        GridView1.DataSourceID = "SqlDataSource1";
    }


   protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)  
   {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataSourceID = "SqlDataSource1";

        GridView1.SelectedIndex = -1;

        //-- GridView每一頁有五筆資料
        //-- 當 GridView換頁的時候，DetailsView一次要跳五筆資料
        DetailsView1.PageIndex = (e.NewPageIndex * 5);
        DetailsView1.DataSourceID = "SqlDataSource2";
    }
}