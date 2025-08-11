using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_FindControl_NamingContainer_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // 資料來源：http://msdn.microsoft.com/zh-tw/library/486wc64h(v=vs.110).aspx

        // Find control on page.
        Control myControl1 = FindControl("TextBox1");
        if (myControl1 != null)
        {
            // Get control's parent.   在網頁控制階層架構中, 取得伺服器控制項之「 "父" 控制項」的參考。
            // http://msdn.microsoft.com/zh-tw/library/system.web.ui.control.parent(v=vs.110).aspx
            Control myControl2 = myControl1.Parent;
            Label1.Text = "(1).Parent（父代） of the TextBox is : " + myControl2.ID;

            Control myControl3 = myControl2.Parent;
            Label1.Text += "<br />(2).Parent（父代） of the form1 is : " + myControl3.ID;
        }
        else
        {
            Label1.Text = "Control not found";
        }
    }
}