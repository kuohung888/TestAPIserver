using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_CaseStudy_Street_Address_Test_03_Setting_PageLoad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{            
        //        //底下這一列可運作。
        //        //DropDownList1.Text = "3";   // .Text屬性其實就是  .SelectedValue

        //        //底下這一列可運作。
        //        DropDownList1.SelectedValue = "3";

        //        //***下面寫法會錯！ Page_Load事件裡面 "只"能用 .SelectedValue
        //        //DropDownList1.SelectedItem.Text = "高雄市";

        //    DropDownList2.SelectedValue = "12";
        //}


        //*************************************
        //*** 寫在這裡，答案竟然是零！！！***
        //*************************************
        //*** 因為還沒有 DataBinding，所以 DropDownList1裡面是空白！！....
        //Response.Write(DropDownList1.Items.Count);
        //*** 因為下拉式選單搭配 SqlDataSource，這時候還沒有 DataBinding，所以身體裡面沒東西！！
    }
    protected void DropDownList1_DataBound(object sender, EventArgs e)
    {
        Response.Write(DropDownList1.Items.Count + "個子選項 <br>");

        for (int i = 0; i < DropDownList1.Items.Count; i++)
        {
            //if(DropDownList1.Items.FindByText("高雄市") != null)  
            //if(DropDownList1.Items.FindByValue("3") != null)  
            //if(DropDownList1.Items.Contains(new ListItem("高雄市", "3")))  
            if(DropDownList1.Items[i].Text == "高雄市") 
            //if (DropDownList1.Items[i].Value == "3") 
            {
                Response.Write("高雄市這個選項的Index -- " + i);
                
                DropDownList1.SelectedItem.Text = "高雄市";   //這邊OK，可執行！
                //**** 但卻是一個嚴重錯誤！我們把 第一個（預設值） [台北市] 也改成 [高雄市]了。
                //**** 導致 [高雄市]出現兩個！

                // 結論 -- 設定預設的子選項，請愛用 .SelectedValue
            }
        }
    }
}