using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_RowDataBound_5_Error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //== 為何一按下這裡的按鈕，就會報錯呢？？？下一支程式會解答！
            Button btn=(Button)e.Row.FindControl("Button1");
            btn.CommandName = "Edit";
        }
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //== 程式放在這裡也會運作喔！==
    }
}