using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_test_03 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        DropDownList my_DDL = new DropDownList();
        my_DDL = (DropDownList)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].FindControl("DropDownList1");
        //-- 修改以後就正確了！

        Response.Write("<font color=blue>您觸發了 Button1_Click事件！</font><br>");

        Response.Write("<font color=red>");
        Response.Write("您選的 DropDownList的 ClientID是「" + my_DDL.ClientID + "」。<br>");
        Response.Write("您選的 DropDownList的 子選項是「" + my_DDL.SelectedValue + "」。<br>");
        Response.Write("</font >");
    }
}