using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Delete_MultiRow_ALL_MSDN_JavaScript : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        // 把放在 **表頭樣板（HeaderTemplate）** 裡面的CheckBox控制項，加入這段JavaScript。
        // 事先在畫面上寫好這段 JavaScript程式，function名為 ConnectGridSelectAll。
        if (e.Row.RowType == DataControlRowType.Header)
        {
            CheckBox CB = (CheckBox)e.Row.FindControl("CheckBox2_Header");

            CB.Attributes.Add("onclick", "ConnectGridSelectAll('GridView1');");
            // 加入HTML標籤的屬性或是JavaScript時，請用.Attributes.Add()方法。
            // GridView1這個ID名稱，請您依照您畫面上的GridView做必要修改。
        }
    }

    //*** 使用這兩個事件都可以做出相同效果。******************************************

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //// 把放在 **表頭樣板（HeaderTemplate）** 裡面的CheckBox控制項，加入這段JavaScript。
        //// 事先在畫面上寫好這段 JavaScript程式，function名為 ConnectGridSelectAll。
        //if (e.Row.RowType == DataControlRowType.Header)
        //{
        //    CheckBox CB = (CheckBox)e.Row.FindControl("CheckBox2_Header");

        //    CB.Attributes.Add("onclick", "ConnectGridSelectAll('GridView1');");
        //    // 加入HTML標籤的屬性或是JavaScript時，請用.Attributes.Add()方法。
        //    // GridView1這個ID名稱，請您依照您畫面上的GridView做必要修改。
        //}
    }

}