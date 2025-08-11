using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_Manual_Set_Width_2 : System.Web.UI.Page
{

    //***********************
    //-- 參考資料：本範例改寫自 http://msdn.microsoft.com/zh-tw/library/ms178296.aspx
    public int colWidth  = 1;
    //***********************


    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        colWidth = Convert.ToInt32(Server.HtmlEncode(TextBox1.Text));

        //*** 必須重新 DataBinding，才會讓 GridView的控制項重新整理一次，觸發相關事件。 ***
        GridView1.DataBind();
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //-- GridView.RowDataBound 事件
        //-- 資料列繫結至 GridView 控制項中的資料時發生。
        //-- 使用 RowDataBound 事件，先修改資料來源中某個欄位的值，再顯示到 GridView 控制項。

        //-- 參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridview.rowdatabound.aspx

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (colWidth > 0)
            {
                GridView1.Columns[0].ItemStyle.Width = colWidth;  //--第一個欄位
                GridView1.Columns[0].ItemStyle.Wrap = true;

                GridView1.Columns[1].ItemStyle.Width = colWidth * 5;  //--第二個欄位
                GridView1.Columns[1].ItemStyle.Wrap = true;  //--欄位裡面的文字，可以自動換行。

                GridView1.Columns[2].ItemStyle.Width = colWidth * 15;  //--第三個欄位
                GridView1.Columns[2].ItemStyle.Wrap = true;
            }
            else
            {
                Label1.Text = "輸入的寬度，不可小於、等於[零]";
            }
        }

    }
}