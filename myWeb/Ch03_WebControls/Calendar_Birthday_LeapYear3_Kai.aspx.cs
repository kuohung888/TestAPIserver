using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ch03_WebControls_Calendar_Birthday_LeapYear3_Kai : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            int myYear = System.DateTime.Now.Year;
            //產生年份（向前50年）
            for (int i = 0; i < 51; i++)
            {
                DropDownList1.Items.Add((myYear - i).ToString());
            }

            //產生月份
            for (int j = 1; j <= 12; j++)
            {
                DropDownList2.Items.Add(j.ToString());
            }
        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList3.Items.Clear();

        String select_year = DropDownList1.SelectedValue;
        String select_month = DropDownList2.SelectedValue;

        //先取得目標年月的"1日"的DateTime物件，例如 2015/2/1
        DateTime dt = new DateTime(Convert.ToInt32(select_year), Convert.ToInt32(select_month), 1);
        //利用DateTime物件的AddMonths(1)，再取到目標年月的"下一月份"的DateTime物件，例如 2015/3/1
        DateTime new_dt = dt.AddMonths(1);
        //利用DateTime物件的AddDays(-1)，再取到下一月份的"前1天"的DateTime物件，例如 2015/2/x
        DateTime result_dt = new_dt.AddDays(-1);
        //再取到目標年月最後一天的DateTime物件的實際年月日(String)
        String theLastDate = result_dt.ToShortDateString();
        //再取到實際年月日(String)的最後一個"/"的位置
        int index = theLastDate.LastIndexOf("/");
        //這樣便可取得目標年月的最後一天的"日"，為了方便等一下跑for迴圈，這裡把它轉換成int
        int theLastDay = Convert.ToInt32(theLastDate.Substring(index + 1));

        for (int k = 1; k <= theLastDay; k++)
        {
            DropDownList3.Items.Add(k.ToString());
        }
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" + DropDownList3.SelectedValue;
    }
}