using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_TopPagerRow : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //-- TopPagerRow的屬性值()
        //-- 型別:     System.Web.UI.WebControls.GridViewRow()
        //-- GridViewRow，表示控制項中的 [頂端]頁面巡覽列。注意！有另外一個 BottomPagerRow 屬性
        GridViewRow pagerRow = GridView1.TopPagerRow;

        DropDownList DDL = (DropDownList)pagerRow.FindControl("DropDownList1");

        //-- 使用者在 DropDownList選擇的頁數，傳給 GridView來展示這一頁
        GridView1.PageIndex = DDL.SelectedIndex;
    }


    //*************************************************
    //  注意這個事件！不是 RowDataBound事件喔～
    //*************************************************
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        //-- TopPagerRow的屬性值()
        //-- 型別:     System.Web.UI.WebControls.GridViewRow()
        //-- GridViewRow，表示控制項中的 [頂端]頁面巡覽列。注意！有另外一個 BottomPagerRow 屬性
        GridViewRow pagerRow = GridView1.TopPagerRow;

        DropDownList DDL = (DropDownList)pagerRow.FindControl("DropDownList1");
        Label LB  = (Label)pagerRow.FindControl("Label1");

        if(DDL != null)
        {
            //-- 把 GridView的頁數，逐一放進下拉式選單的「子選項」
            for(int i = 0; i < GridView1.PageCount; i++)
            {
                // Create a ListItem object to represent a page.
                int pageNumber= i + 1;
                ListItem item = new ListItem(pageNumber.ToString());

                //-- 把目前 GridView頁數，當成 DropDownList的（頁數）預設值
                if(i==GridView1.PageIndex)
                    item.Selected = true;

                DDL.Items.Add(item);
            }
        }

        if(LB != null)
        {
          //-- GridView「目前」所在的頁數。因為頁數從零算起，所以要加一！
          int currentPage = GridView1.PageIndex + 1;     

          LB.Text = "Page " + currentPage.ToString() + " of " + GridView1.PageCount.ToString();
        }  

    }
}