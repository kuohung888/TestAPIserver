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
            //產生年份（向前50年）
            for(int i=0; i< 51; i++)
            {
                DropDownList1.Items.Add((myYear-i).ToString());
            }

            //產生月份
            myGenerator(DropDownList2, 1, 12);   
        }

    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        // 產生每個月的日期（注意潤年，二月會有29天！）

        //*********************************************************************************************
        DropDownList3.Items.Clear();    //***重點！把這段註解，看看「日」DropDownList3會有什麼錯誤？ 

        //---------------------------------------------------
        int myMonth = Convert.ToInt32(DropDownList2.SelectedValue);
        if (myMonth == 1 || myMonth == 3 || myMonth == 5 || myMonth == 7 || myMonth == 8 || myMonth ==10 || myMonth == 12)
        {
            myGenerator(DropDownList3, 1, 31);          
        }
        else
        {
            if(myMonth != 2)
            {
                myGenerator(DropDownList3, 1, 30);  
            }
            else 
            {   //專門計算二月份的日子
                int myYear = Convert.ToInt32(DropDownList1.SelectedValue);

                if (DateTime.IsLeapYear(myYear))
                {   //是否為潤年？？   // http://msdn.microsoft.com/zh-tw/library/system.datetime.isleapyear(v=vs.110).aspx
                    //潤年的二月，有29天
                    myGenerator(DropDownList3, 1, 29);
                }
                else
                {
                    myGenerator(DropDownList3, 1, 28);
                }
            }
        }

    }


    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" +DropDownList3.SelectedValue;
    }

    //***********************************************************************
    protected void myGenerator(DropDownList DDL, int NumStart, int NumEnd)
    {
        for (int i = NumStart; i <= NumEnd; i++)
        {
            DDL.Items.Add(i.ToString());
        }
    }
}