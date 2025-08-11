using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_Inside_DropDownList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //請參閱我這個範例：  http://www.dotblogs.com.tw/mis2000lab/archive/2011/09/08/gridview_selectedindex_dataitemindex_rowcommand_2011.aspx

        DropDownList DDL = (DropDownList)sender;
        Response.Write("DropDownList --" + DDL.UniqueID);

        GridViewRow myRow = (GridViewRow)DDL.NamingContainer;
        Response.Write("<br />這一列的「索引值.DataItemIndex」---" + myRow.DataItemIndex);
        Response.Write("<br />這一列的「索引值.RowIndex」---" + myRow.RowIndex);

        Response.Write("<br /><hr />這一列的對應資料表「P.K.」---" + GridView1.DataKeys[myRow.RowIndex].Value);

        Response.Write("<br />這一列的「第一個欄位」的值---" + GridView1.Rows[myRow.RowIndex].Cells[0].Text);
        //**** 這段抓不到「格子」裡面的值喔！！*******************
    }
}