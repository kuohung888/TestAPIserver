using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GridView_RowDataBound_DynaAdd_ChkBox2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
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
    }
}