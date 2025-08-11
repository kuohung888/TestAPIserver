using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch03_WebControls_10 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
              
        TextBox1.Text = Calendar1.SelectedDate.ToString();
        // 註解： 程式的最後面的 .ToShortDateString()，表示把日期轉換成
        //「短日期格式」，例如：2010/10/10這種格式，
        // 不加上這一段會發生錯誤！

        TextBox2.Text = Calendar1.SelectedDates.Count.ToString();
        // 註解： Count可以用來計算被選定的日期區間一共有幾天？

        Label1.Text = "Calendar1.TodaysDate.DayOfWeek -- " + Calendar1.TodaysDate.DayOfWeek.ToString();
        // 註解： 今天，是本週的第幾天（從零算起）？
        //    在VB語法會出現今天是本週的「第幾天」。
        //    而在C＃語法卻變成今天是本週的「星期幾」？

        //============================================

        //如果您使用 C#語法，卻想得到跟 VB語法一樣的成果（今天是本週的「第幾天」），請寫成：
        Label2.Text = "Calendar1.TodaysDate.DayOfWeek.GetHashCode().ToString() -- " + 
            Calendar1.TodaysDate.DayOfWeek.GetHashCode().ToString();

        Label3.Text = "System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetShortestDayName(Calendar1.TodaysDate.DayOfWeek) -- " 
            + System.Globalization.CultureInfo.CurrentCulture.DateTimeFormat.GetShortestDayName(Calendar1.TodaysDate.DayOfWeek);

        const string DayofWeek = "0123456";
        Label4.Text = "方法四，陣列 -- " + DayofWeek[Convert.ToInt16(Calendar1.TodaysDate.DayOfWeek)].ToString();
    }
}
