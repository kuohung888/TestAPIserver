using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch15__Book_Page_CrossPagePosting_GridView_CrossPagePosting_5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.PreviousPage != null)
        {
            if (PreviousPage.IsCrossPagePostBack)
            {  //跨網頁張貼，才能運作下面的程式碼。       
                int j = Convert.ToInt32(Session["RowIndex"]);

                TextBox TB_A = (TextBox)GridView1.Rows[j].FindControl("TextBox_test_time");
                TB_A.Text = Session["test_time"].ToString();   //改用 Session更簡單*****

                TextBox TB_B = (TextBox)GridView1.Rows[j].FindControl("TextBox_title");
                TB_B.Text = Session["title"].ToString();   //改用 Session更簡單*****
            }
        }


    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "myLINK")
        {
            Session["RowIndex"] = e.CommandArgument;
            //畫面中的GridView樣板，已經設定「流水號」。CommandArgument='<%# Container.DataItemIndex %>' 
            // 資料來源：GridView 流水號
            // http://www.dotblogs.com.tw/mis2000lab/archive/2011/11/05/gridview_container_dataitemindex.aspx

            int i = Convert.ToInt32(e.CommandArgument);

            TextBox TB1 = (TextBox)GridView1.Rows[i].FindControl("TextBox_test_time");
            Session["test_time"] = TB1.Text;
            TextBox TB2 = (TextBox)GridView1.Rows[i].FindControl("TextBox_title");
            Session["title"] = TB2.Text;

            Response.Redirect("GridView_CrossPagePosting_6.aspx");
        }
    }
}