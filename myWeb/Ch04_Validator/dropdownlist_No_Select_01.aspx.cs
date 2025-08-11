using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_dropdownlist_No_Select : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == -1)
        {
            Response.Write("DropDownList1尚未選取");
        }
        else
        {
            Response.Write("DropDownList1--" + DropDownList1.SelectedValue);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedIndex == -1)
        {
            //資料來源：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listcontrol.selectedindex(v=vs.110).aspx
            Response.Write("<br />[Button1]--DropDownList1尚未選取");
        }
        else
        {
            Response.Write("<br />[Button1]--DropDownList1--" + DropDownList1.SelectedValue);
        }
    }

    //******************************************************************************

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex == -1)
        {
            //資料來源：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listcontrol.selectedindex(v=vs.110).aspx
            Response.Write("<br />DropDownList2尚未選取");
        }
        else
        {
            Response.Write("<br />DropDownList2--" + DropDownList2.SelectedValue);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (DropDownList2.SelectedIndex == -1)
        {
            //資料來源：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listcontrol.selectedindex(v=vs.110).aspx
            Response.Write("<br />[Button2]--DropDownList2尚未選取");
        }
        else
        {
            Response.Write("<br />[Button2]--DropDownList2--" + DropDownList1.SelectedValue);
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == -1)
        {
            //資料來源：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listcontrol.selectedindex(v=vs.110).aspx
            Label1.Text = "<br />[Button3]--RadioButtonList1尚未選取";
        }
        else
        {
            Label1.Text = "<br />[Button3]--RadioButtonList1--" + RadioButtonList1.SelectedValue;
        }
    }
}