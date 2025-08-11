using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_test_04 : System.Web.UI.Page
{

    //****************************************
    public DropDownList my_ddl = new DropDownList();
    //****************************************


    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Write("您剛剛按下的按鈕(e.CommandArgument)，代表這一列的「RowIndex」--  " + e.CommandArgument.ToString());
        Response.Write("<br>您剛剛按下的按鈕，e.CommandName（主索引鍵） --  " + e.CommandName.ToString());

        my_ddl = (DropDownList)GridView1.Rows[Convert.ToInt32(e.CommandArgument)].Cells[1].FindControl("DropDownList1");
        my_ddl.AutoPostBack = true;
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write("<font color=red>");
        Response.Write("您選的 DropDownList的 ClientID是「" + my_ddl.ClientID + "」。<br>");
        Response.Write("您選的 DropDownList的 子選項是「" + my_ddl.SelectedValue + "」。<br>");
        Response.Write("</font >");
    }

}