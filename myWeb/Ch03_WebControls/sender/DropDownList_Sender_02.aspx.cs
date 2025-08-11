using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_sender_DropDownList_Sender_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //*** 兩個 DropDownlist都指向同一個事件！
        if (sender == null)
            return;

        //// 方法一： ***建議使用本作法***
        //// 因為DropDownList、RadioButtonList，都是繼承自「清單控制項」的子類別
        ListControl ListCtrl = sender as ListControl;
        myShow(ListCtrl);

        //// 方法二：透過 is與 as做安全轉型。
        //// 控制項的轉型，if判別式裡面只能用到 is，不能用as
        //if (sender is DropDownList)
        //{
        //    DropDownList DDL = (DropDownList)sender;
        //    myShow(DDL);
        //}

        //if (sender is RadioButtonList)
        //{
        //    RadioButtonList RBL = (RadioButtonList)sender;
        //    myShow(RBL);
        //}
    }


    protected void myShow(ListControl ListCtrl)
    {
        Response.Write("sender的寫法 -- " + ListCtrl.SelectedValue);
        //=========================================

        //*** 使用 Request["控制項ID"]也能抓到「值」。
        //      因為控制項可能被包在「大型控制項」身體（樣板）裡面，所以要用 .UniqueID屬性才能正確抓到ID。
        Response.Write("<br><br>Request的寫法 -- " + Request[ListCtrl.UniqueID]);
    }

}