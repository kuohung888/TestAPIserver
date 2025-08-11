using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GridView_RowDataBound_DynaAdd_ChkBox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //重點！！改用 RowCreated事件就成功了
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //***下列程式，請參閱上集Ch.11 範例GridView_RowDataBound_6_CaseStudy.aspx。***(start)
            if (e.Row.RowState == DataControlRowState.Edit ||
                e.Row.RowState == (DataControlRowState.Edit | DataControlRowState.Alternate))   //**注意這裡！！or 的用法不同，分別是「||」與「|」。
            {
                CheckBox CB = new CheckBox();
                CB.ID = "DynaAdd_CB1";
                CB.Text = "請選我";

                e.Row.Cells[2].Controls.Add(CB);
                //Response.Write("<h3>" + CB.UniqueID + "</h3>");          //測試用
            }
            //*********************************************************************(end)
        }
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //*** 按下「更新」按鈕。 ***

        CheckBox CB = (CheckBox)GridView1.Rows[e.RowIndex].FindControl("DynaAdd_CB1");
        Response.Write("<h3>" + CB.Checked.ToString() + "</h3>");
        Response.End(); //抓不到，因為PostBack的緣故。

        //**************************************************************
        //*** 另一種作法（可抓到值）**************************************
        //測試用
        //Response.Write("<h3>" + (e.RowIndex + 2).ToString() + "</h3>");
        //Response.End();

        //if ((e.RowIndex + 2) < 10)
        //{
        //    Response.Write("<h3>" + Request["GridView1$ctl0" + (e.RowIndex + 2).ToString() + "$DynaAdd_CB1"] + "</h3>");
        //    //有勾選的話，就會出現「on」字樣
        //}
        //else
        //{
        //    Response.Write("<h3>" + Request["GridView1$ctl" + (e.RowIndex + 2).ToString() + "$DynaAdd_CB1"] + "</h3>");
        //    //有勾選的話，就會出現「on」字樣
        //}       
        
        //Response.End();

    }

}