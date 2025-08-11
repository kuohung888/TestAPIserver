using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_RowCommand_FindControl : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Hello")
        {
            //*** 錯誤版 ***************************************************
            //Button BTN = (Button)sender;   
            //*** 發生錯誤，因為這裡的e與sender不是Button而是代表「GridView」！！ *******

            //GridViewRow myRow = (GridViewRow)BTN.NamingContainer;
            ////-- 從你按下 Button按鈕的時候，知道你按下的按鈕在GridView「哪一列」！
            //Label LB = (Label)GridView1.Rows[myRow.DataItemIndex].FindControl("Label1");
            //Response.Write(LB.Text);


            //--- 正確版 (1) --------------------------------------------------------------------------------
            Button BTN = (Button)e.CommandSource;    //先抓到這個按鈕（我們設定了CommandName）
            //資料來源 http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridviewcommandeventargs.commandsource(v=vs.110).aspx

            GridViewRow myRow = (GridViewRow)BTN.NamingContainer;
            // 從你按下 Button按鈕的時候，NamingContainer知道你按下的按鈕在GridView「哪一列」！

            Label LB = (Label)GridView1.Rows[myRow.DataItemIndex].FindControl("Label1");
            //按下按鈕之後，這一列的列數（index）-- myRow.DataItemIndex
            Response.Write(LB.Text);

            ////--- 正確版 (2) --------------------------------------------------------------------------------
            //Label LB = (Label)((Control)e.CommandSource).FindControl("Label1");
            //Response.Write(LB.Text);
            ////資料來源 http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD20140725110006GGM.html
        }
    }
}