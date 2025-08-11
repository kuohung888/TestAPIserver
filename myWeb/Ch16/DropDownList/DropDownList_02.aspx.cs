using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_DropDownList_DropDownList_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["SelectedIndex"] = DropDownList1.SelectedIndex;
        // 或是寫成  ViewState["SelectedIndex"] = DropDownList1.SelectedIndex;
        Response.Write("您剛剛挑選了--" + Session["SelectedIndex"].ToString() + "（從零算起）<br>");
    }


    protected void SqlDataSource2_Updated(object sender, SqlDataSourceStatusEventArgs e)
    {
        DropDownList1.DataSourceID = "SqlDataSource1";

        int i = Convert.ToInt32(Session["SelectedIndex"]);
        
        //DropDownList1.Items[i].Selected = true;  //*** 發生錯誤！！
        DropDownList1.SelectedIndex = i;   //***正確***
    }

}