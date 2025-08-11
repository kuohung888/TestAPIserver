using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch10_Get_Index_PK : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        Response.Write("<hr>== GridView1_RowCommand() ==<br>");
        Response.Write("GridView1.SelectedIndex--  " + GridView1.SelectedIndex);
        Response.Write("<br>GridView1.SelectedValue-- " + GridView1.SelectedValue);

        //==重點！！！！======================

        // 在GridView1_RowCommand()裡面，如何獲得這一列的資料表PK值？
        int pk_index = Convert.ToInt32(e.CommandArgument);
        Response.Write("<br>被點選的這一列，對應資料表的主索引鍵-- " + GridView1.DataKeys[pk_index].Value);
        //==================================
    }


    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        Response.Write("<hr>== GridView1_SelectedIndexChanging() ==<br>");
        Response.Write("GridView1.SelectedIndex--  " + GridView1.SelectedIndex);
        Response.Write("<br>GridView1.SelectedValue-- " + GridView1.SelectedValue);

        Response.Write("<br>==============================");
        Response.Write("<br>GridView1.Rows(e.NewSelectedIndex).RowIndex-- " + GridView1.Rows[e.NewSelectedIndex].RowIndex.ToString());
        Response.Write("<br>e.NewSelectedIndex-- " + e.NewSelectedIndex.ToString());
    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write("<hr>== GridView1_SelectedIndexChanged() ==<br>");
        Response.Write("GridView1.SelectedIndex--  " + GridView1.SelectedIndex);
        Response.Write("<br>GridView1.SelectedValue-- " + GridView1.SelectedValue);
        Response.Write("<br>GridView1.SelectedDataKey.Value-- " + GridView1.SelectedDataKey.Value);
    }
}
