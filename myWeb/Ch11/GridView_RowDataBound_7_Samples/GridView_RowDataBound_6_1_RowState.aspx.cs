using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_RowDataBound_6_RowState : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (e.Row.RowState == DataControlRowState.Normal)
            {
                //== 修正上一支程式的缺點！
                //== 但發生其他錯誤，第二、第四列的 Edit按鈕不會動作。 ==
                Button btn = (Button)e.Row.FindControl("Button1");
                btn.CommandName = "Edit";
            }

            ////== [正確版] =============================================
            //if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate) 
            //{
            //    //== 修正上一支程式的缺點！
            //    Button btn = (Button)e.Row.FindControl("Button1");
            //    btn.CommandName = "Edit";
            //}

        }
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ////== 程式放在這裡也會運作喔！==
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    //== [正確版] =============================================
        //    if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
        //    {
        //        //== 修正上一支程式的缺點！
         //        Button btn = (Button)e.Row.FindControl("Button1");
        //        btn.CommandName = "Edit";
        //    }
        //}
    }
}