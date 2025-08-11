using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch12_ListView_ListView_DataPager_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataPager DP = (DataPager)ListView1.FindControl("DataPager1");
        //另外一種寫法 -- DataPager DP = ListView1.FindControl("DataPager1") as DataPager;

        DP.PageSize = Convert.ToInt32(RadioButtonList1.SelectedValue);
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        //DataPager DP = (DataPager)ListView1.FindControl("DataPager1");
        ////另外一種寫法 -- DataPager DP = ListView1.FindControl("DataPager1") as DataPager;

        //DP.PageSize = Convert.ToInt32(RadioButtonList1.SelectedValue);
    }
}