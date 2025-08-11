using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_test_01_Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write("<font color=green>DropDownList1_SelectedIndexChanged</font><br />");
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //=======================
        DropDownList my_DDL = new DropDownList();   // 缺少最後的符號() 會錯喔！
        my_DDL = (DropDownList)GridView1.Rows[GridView1.SelectedIndex].FindControl("DropDownList1");
        //==== 這兩列程式碼會出錯！==========
        //==  因為沒有「選取（Select）」按鈕，GridView不知道你目前位於哪一列？

        Response.Write("<font color=blue>Button1_Click</font><br />");

        if (my_DDL.SelectedIndex >= 0)
        {
            Response.Write("OK~~OK~~<br />");
        }
    }

}