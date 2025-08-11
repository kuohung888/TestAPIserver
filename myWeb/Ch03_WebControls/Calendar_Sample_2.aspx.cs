using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_Calendar_Sample_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Calendar1_Init(object sender, EventArgs e)
    {
        //--參考網頁  http://msdn.microsoft.com/zh-tw/library/e057ff0d(VS.80).aspx
        //--呼叫日曆控制項中 SelectedDates 集合的 .Add()方法。
        //--您可以依任何順序加入日期，這是因為集合會為您排序所加入的日期。
        //--由於集合也強制唯一性，因此如果您加入的日期已存在，集合會予以忽略。 

        Calendar1.SelectedDates.Add(new DateTime(2015, 11, 1));
        Calendar1.SelectedDates.Add(new DateTime(2015, 11, 5));
        Calendar1.SelectedDates.Add(new DateTime(2015, 11, 10));
    }

}