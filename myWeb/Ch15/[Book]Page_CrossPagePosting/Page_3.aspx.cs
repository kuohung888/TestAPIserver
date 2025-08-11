using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

    //參考資料  http://msdn.microsoft.com/zh-tw/library/ms178139.aspx


public partial class Ch15_Page_3 : System.Web.UI.Page
{
    //=====透過 Publlic屬性，來作 Cross-Page Posting=======
    public Calendar my_Calendar
    {
        get
        {
            return Calendar1;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void  Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDate.Date.ToShortDateString();
        //--把選取的日期，以「短日期格式」來呈現。
    }
}
