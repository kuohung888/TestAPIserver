using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_2_Easy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label lb = (Label)GridView1.Rows[0].FindControl("Label1");
            //-- 程式第一次執行（Page_Load事件），抓取第一列紀錄（程式寫成Rows[0]） title欄位的值。
            Response.Write(lb.Text);
        }
    }


    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Label lb = (Label)GridView1.Rows[e.NewSelectedIndex].FindControl("Label1");
        Response.Write(lb.Text);
    }
}