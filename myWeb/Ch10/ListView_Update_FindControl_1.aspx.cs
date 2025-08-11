using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_ListView_Update_2_FindControl_Easy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //**** 以下兩種寫法都會報錯！！**************************
            //**** 需要寫在 ListView的 DataBound事件裡面才對。

            //Label lb = (Label)ListView1.Items[0].FindControl("titleLabel");
            ////-- 程式第一次執行（Page_Load事件），抓取第一列紀錄（ListView程式寫成Items[0]） title欄位的值。
            //Response.Write(lb.Text);

            //Response.Write(ListView1.Items[0].Controls.Count.ToString());
        }
    }

    protected void ListView1_DataBound(object sender, EventArgs e)
    {
        Label lb = (Label)ListView1.Items[0].FindControl("titleLabel");
        //-- 抓取第一列紀錄（ListView程式寫成Items[0]） title欄位的值。
        Response.Write("<font color=red>");
        Response.Write("   抓取第一列紀錄（ListView程式寫成Items[0]） title欄位的值 -- " + lb.Text);

        Response.Write("   <br />一個Item裡面有幾個控制項？ListView1.Items[0].Controls.Count -- " + ListView1.Items[0].Controls.Count.ToString());
        Response.Write("</font>");
    }


}