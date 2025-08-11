using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Update_4_Calendar2_sender_AllenKuo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {        //資料來源  http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD201409172008273OL.html

        var ddl = sender as DropDownList;

        var tb = ddl.FindControl("TextBox1") as TextBox;
        var tb2 = (TextBox)ddl.FindControl("TextBox2");    //兩種寫法都一樣

        Response.Write("<h3>" + tb.Text + "</h3>");
        Response.Write("<h3>" + tb2.Text + "</h3>");

        //或是參閱我的範例 NamingContainer
        //http://www.dotblogs.com.tw/mis2000lab/archive/2012/11/23/gridview_inside_dropdownlist_namincontainer_20121122.aspx
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {   // // 下面的作法有錯！！
        //var btn = sender as Button;
        //var tb = btn.FindControl("TextBox1") as TextBox;
        //var tb2 = (TextBox)btn.FindControl("TextBox2");    //兩種寫法都一樣

        //Response.Write("<h3>" + tb.Text + "</h3>");
        //Response.Write("<h3>" + tb2.Text + "</h3>");
        //Response.End();
    }
}