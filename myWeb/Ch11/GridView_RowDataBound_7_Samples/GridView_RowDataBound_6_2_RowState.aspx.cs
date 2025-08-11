using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowDataBound_6_2_RowState : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //== [正確版] =============================================
            if (e.Row.RowState == DataControlRowState.Normal)
            {
                Response.Write("Normal <br />");
            }
            if (e.Row.RowState == DataControlRowState.Alternate)
            {
                Response.Write("Alternate<br />");
            }
            if (e.Row.RowState == DataControlRowState.Edit)
            {
                Response.Write("Edit <br />");
            }


            ////** 錯誤 ****
            //if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState == DataControlRowState.Alternate)

            ////** 正確 *************************************************
            //if ((e.Row.RowState == DataControlRowState.Edit) || (e.Row.RowState == DataControlRowState.Alternate))
            //{
            //    Response.Write("Alternate -- Edit <br />");
            //}
            //** 正確 *************************************************
            //*** 重點！既是「偶數列(Alternate)」、又進入編輯模式。
            if (e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate))
            {
                Response.Write("Alternate -- Edit <br />");
            }

        }
    }
}