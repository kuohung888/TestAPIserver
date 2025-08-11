using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_Calendar_Birthday_DropDownList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int myYear =System.DateTime.Now.Year;
        //寫在 for迴圈外面，避免每一次迴圈都要調用 System.DateTime，以節省資源。

        for (int i = 0; i < 101; i++)
        {
            //== 方法一 ==：
            myYear = myYear - i;    //***這裡出了大錯！！***
            DropDownList1.Items.Add(myYear.ToString());
            //資料來源  http://msdn.microsoft.com/zh-tw/library/system.datetime.addyears.aspx
        }
    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        //== 方法一 ==：
        //Calendar1.TodaysDate = new DateTime(Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(DropDownList2.SelectedValue), 1);
        //DateTime裡面的日期（年/月/日），只能接受「整數」。

        //== 方法二 ==：
        //**** 建議改用 .VisibleDate屬性 更好。
        //**** 只會出現「當月月份」！
        Calendar1.VisibleDate = new DateTime(Convert.ToInt32(DropDownList1.SelectedValue), Convert.ToInt32(DropDownList2.SelectedValue), 1);
        //如果日曆控制項的 VisibleDate屬性未設定，所指定的日期 TodaysDate屬性會決定哪個月份會顯示在Calendar控制項。
    }


    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        Label1.Text = "您剛剛挑選的生日---" + Calendar1.SelectedDate.ToShortDateString();
    }
}