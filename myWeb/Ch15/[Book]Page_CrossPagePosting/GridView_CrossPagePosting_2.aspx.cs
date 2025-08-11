using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch15__Book_Page_CrossPagePosting_GridView_CrossPagePosting_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TextBox1.Text = Request["test_time"].ToString();
            TextBox2.Text = Request["title"].ToString();
            //-- 上一頁透過Http Get傳遞數據（這是傳統網頁程式的作法）
            //-- 例如： GridView_CrossPagePosting_2.aspx?test_time=數據&title=數據
            //-- 這種作法透過 Http Get，容易被人竄改數據（引起SQL Injection攻擊）

        }
    }
}