using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Page_CommandName_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Label1.Text = "目前位於第" + GridView1.PageIndex + "頁（電腦從[零]算起），共計" + GridView1.PageCount + "頁。";
            //== 重點！！這裡（第一次執行時）無法出現「共計幾頁」。 
            //== 請仔細想想是為什麼？？
        }
    }


    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Label1.Text = "目前位於第" + GridView1.PageIndex + "頁（電腦從[零]算起），共計" + GridView1.PageCount + "頁。";
    }
    protected void GridView1_DataBound(object sender, EventArgs e)
    {
        //Response.Write("<h3>您執行到 GridView1_DataBound事件囉！！</h3>");
        //Response.Write("<h3>共計" + GridView1.PageCount + "頁。</h3>");
    }
}