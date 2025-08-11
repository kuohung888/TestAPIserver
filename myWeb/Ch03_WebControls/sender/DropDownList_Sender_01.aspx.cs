using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_sender_DropDownList_Sender_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //*** 兩個 DropDownlist都指向同一個事件！

        DropDownList DDL = (DropDownList)sender;
        // 另一種寫法  DropDownList DDL = sender as DropDownList;

        Response.Write("sender的寫法 -- " + DDL.SelectedValue);

        //=========================================

        //*** 使用 Request["控制項ID"]也能抓到「值」。
        //      因為控制項可能被包在「大型控制項」身體（樣板）裡面，所以要用 .UniqueID屬性才能正確抓到ID。
        Response.Write("<br><br>Request的寫法 -- " + Request[DDL.UniqueID]);

    }
}