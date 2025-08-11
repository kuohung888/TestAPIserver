using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch09_DropDownList_Street_Address_Street_Address_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        // 想不到 DropDownList1.SelectedValue 竟然是「字串」型態
        if (DropDownList1.SelectedValue == "0")
        {          
            Response.Write("<script language='JavaScript'>window.alert(\"您尚未點選城市名稱！\");</script>");
        }
    
    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedItem.Text + "<br />" + DropDownList2.SelectedItem.Text + "<br />" + DropDownList3.SelectedItem.Text;
    }
}