using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_Calendar_Sample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    // 參考網頁： http://msdn.microsoft.com/zh-tw/library/8k0f6h1h.aspx

    protected void Calendar1_Init(object sender, EventArgs e)
    {
        Calendar1.SelectedDate = Convert.ToDateTime("2015/11/1");
        // 事先指定日期  (請調整為這個月的某一天，才看得到結果)
    }


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        //-- SelectedDates可以存放多天的選定日期
        //-- 參考網頁  http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.calendar.selecteddates.aspx
        
        for(int i = 0; i < Calendar1.SelectedDates.Count;i++)
        {
            Label1.Text += "<br />" + Calendar1.SelectedDates[i].ToShortDateString();
        }
            
    }
}