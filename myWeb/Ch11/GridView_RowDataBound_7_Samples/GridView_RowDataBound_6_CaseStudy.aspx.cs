using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_Edit_DefaultValue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (e.Row.RowState == DataControlRowState.Edit || 
                e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate))   //**注意這裡！！or 的用法不同，分別是「||」與「|」。
            {
                    TextBox tb = (TextBox)e.Row.FindControl("TextBox1");

                    tb.Text = "進入編輯模式，立刻給予「預設值」。";

            }
            //參考資料：http://www.blueshop.com.tw/board/show.asp?subcde=BRD20090210113050XB9
        }
    }

}