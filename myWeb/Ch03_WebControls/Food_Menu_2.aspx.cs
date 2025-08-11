using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_Food_Menu_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedItem.Text;

        //**********************************************************
        // 避免畫面一開啟，就出現菜名。必須點選上面的「食物種類」之後，才會出現菜名。
        // 這個作法，就是所謂的「DataBinding」（資料繫結、綁定）
        ListBox1.DataSourceID = "SqlDataSource2";
    }


    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Text = ListBox1.SelectedItem.Text;
    }
}