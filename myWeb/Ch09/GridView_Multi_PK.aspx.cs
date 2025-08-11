using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch09_GridView_Multi_PK : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = "第一個主索引鍵： " + GridView1.SelectedDataKey.Values[0].ToString();
        Label2.Text = "第二個主索引鍵： " + GridView1.SelectedDataKey.Values[1].ToString();

        Label3.Text = "GridView1.SelectedValue 主索引鍵的內容： " + GridView1.SelectedValue.ToString();
    }
}