using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_RowDataBound_7 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {   //*** 重點！！動態加入 PlaceHolder裡面的
        //***  Button按鈕的「CommandName」，必須放在 RowCreated事件才生效！ ***
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //if (e.Row.RowState == DataControlRowState.Normal)
            //{
            //    //== 修正之前第五號程式的缺點！
            //    //== 但發生其他錯誤，第二、第四列的 Edit按鈕不會動作。 ==
            //    Button btn = (Button)e.Row.FindControl("Button1");
            //    btn.CommandName = "Edit";
            //}

            //== [正確版] =============================================
            if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
            {
                Button btn = new Button();  //== 動態加入的按鈕，必須使用 New
                
                //*********************************************************
                btn.ID = "Button1";   //== 很特別的解法！！不要加上ID屬性，就會正常運作！！==
                //*********************************************************

                btn.Text = "自訂的、動態加入PlaceHolder的編輯按鈕";
                btn.CommandName = "Edit";

                PlaceHolder ph = (PlaceHolder)e.Row.FindControl("PlaceHolder1");
                ph.Controls.Add(btn);
                
            }

        }
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        ////*** 重點！！有 Bug！ ***

        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    //== [正確版] =============================================
        //    if (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate)
        //    {
        //         Button btn = new Button;  //== 動態加入的按鈕，必須使用 New
        //        btn.ID = "Button1";
        //        btn.Text = "自訂的、動態加入PlaceHolder的編輯按鈕";
        //        btn.CommandName = "Edit";

        //        PlaceHolder ph = (PlaceHolder)e.Row.FindControl("PlaceHolder1");
        //        ph.Controls.Add(btn);
        //    }

        //}
    }

}