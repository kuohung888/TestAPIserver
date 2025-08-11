using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Page_CommandName_3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label1.Text = "目前位於第" + GridView1.PageIndex + "頁（電腦從[零]算起），共計" + GridView1.PageCount + "頁。";
            //== 重點！！這裡（第一次執行時）無法出現「共計幾頁」。 
            //== 請仔細想想是為什麼？？
        }
        //else
        //    Label1.Text = "目前位於第" + GridView1.PageIndex + "頁（電腦從[零]算起），共計" + GridView1.PageCount + "頁。";
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Label1.Text = "目前位於第" + GridView1.PageIndex + "頁（電腦從[零]算起），共計" + GridView1.PageCount + "頁。";
    }


    //===========================================
    //== 重點：注意這個事件！不是 RowDataBound事件喔～（請參閱範例 GridView_TopPagerRow.aspx）
    //== 只有這個事件，才能即時計算出「GridView1.PageCount」的值。
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        //**** 重點在此！！ ****
        Response.Write("<h3>***目前位於第" + GridView1.PageIndex + "頁（電腦從[零]算起），共計" + GridView1.PageCount + "頁。***</h3><hr />");

        //-- GridView的「分頁樣版」有特殊寫法！請參閱範例 GridView_TopPagerRow.aspx。
        GridViewRow pagerRow= GridView1.BottomPagerRow;

        if (GridView1.PageIndex == 0)
        {
            Button btn1 = (Button)pagerRow.FindControl("Button1");
            btn1.Visible = false;  //--目前位於第一頁，所以需隱形，看不見。無法繼續「上一頁」。
        }

        if (GridView1.PageIndex == (GridView1.PageCount - 1))
        {   //==電腦從[零]算起，所以最後一頁要減一。
            Button btn2 = (Button)pagerRow.FindControl("Button2");
            btn2.Visible = false;  //--目前位於最後一頁，所以需隱形，看不見。無法繼續「下一頁」。
        }

    }
}