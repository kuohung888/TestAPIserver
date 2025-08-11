using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_Calendar_Birthday_LeapYear : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if(!Page.IsPostBack)
        {
            int myYear = System.DateTime.Now.Year;
            //產生年份
            for(int i=0; i< 51; i++)      {
                DropDownList1.Items.Add((myYear-i).ToString());
            }

            //產生月份
            for(int j=1; j<=12; j++)   {   
                DropDownList2.Items.Add(j.ToString());
            }
        }

    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        // 產生每個月的日期（注意潤年，二月會有29天！）

        //*********************************************************************************************
        DropDownList3.Items.Clear();    //***重點！把這段註解，看看「日」DropDownList3會有什麼錯誤？ 

        //---------------------------------------------------
        int myYear = Convert.ToInt32(DropDownList1.SelectedValue);
        int myMonth = Convert.ToInt32(DropDownList2.SelectedValue);

        int myDay = DateTime.DaysInMonth(myYear, myMonth);
        //  每個月份有幾天？？  DateTime的 .DaysInMonth()方法
        //  http://msdn.microsoft.com/zh-tw/library/system.datetime.daysinmonth(v=vs.110).aspx 
        
        for(int i = 1; i <= myDay; i++)      {
            DropDownList3.Items.Add(i.ToString());
        }
    }


    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" +DropDownList3.SelectedValue;
    }

}