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
            for(int i=0; i< 51; i++)
            {
                DropDownList1.Items.Add((myYear-i).ToString());
            }

            //產生月份
            for(int j=1; j<=12; j++)
            {   //程式結構類似，重複程式碼太多
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
        int myMonth = Convert.ToInt32(DropDownList2.SelectedValue);
        if (myMonth == 1 || myMonth == 3 || myMonth == 5 || myMonth == 7 || myMonth == 8 || myMonth ==10 || myMonth == 12)
        //if (",1,3,5,7,8,10,12,".IndexOf("," + myMonth.ToString() + ",") > 0)   //這段寫法也行。
        {
            for (int i = 1; i <= 31; i++)
            {   //程式結構類似，重複程式碼太多
                DropDownList3.Items.Add(i.ToString());
            }            
        }
        else
        {
            if(myMonth != 2)
            {
                for (int i = 1; i <= 30; i++)
                {   //程式結構類似，重複程式碼太多
                    DropDownList3.Items.Add(i.ToString());
                }   
            }
            else 
            {  //專門計算二月份的日子
                int myYear = Convert.ToInt32(DropDownList1.SelectedValue);

                if (DateTime.IsLeapYear(myYear))
                {   //是否為潤年？？   // http://msdn.microsoft.com/zh-tw/library/system.datetime.isleapyear(v=vs.110).aspx
                    for (int i = 1; i <= 29; i++)
                    {   //潤年的二月，有29天
                        DropDownList3.Items.Add(i.ToString());
                        //程式結構類似，重複程式碼太多
                    }
                }
                else
                {
                    for (int i = 1; i <= 28; i++)
                    {   //程式結構類似，重複程式碼太多
                        DropDownList3.Items.Add(i.ToString());
                    }
                }
            }
        }

    }


    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedValue + "/" + DropDownList2.SelectedValue + "/" +DropDownList3.SelectedValue;
    }

}