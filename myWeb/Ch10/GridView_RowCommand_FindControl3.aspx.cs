using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_GridView_RowCommand_FindControl3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Add")
        {
            // 延續第一個範例的作法 -- GridView_RowCommand_FindControl1.aspx
            //--- 正確版 (1) --------------------------------------------------------------------------------
            Button BTN = (Button)e.CommandSource;    //先抓到這個按鈕（我們設定了CommandName）
            //資料來源 http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.gridviewcommandeventargs.commandsource(v=vs.110).aspx

            GridViewRow row = (GridViewRow)BTN.NamingContainer;
            // 從你按下 Button按鈕的時候，NamingContainer知道你按下的按鈕在GridView「哪一列」！

            
            ////--- 正確版 (2) --------------------------------------------------------------------------------
            //Label LB = (Label)((Control)e.CommandSource).FindControl("Label1");
            //Response.Write(LB.Text);
            ////資料來源 http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD20140725110006GGM.html

            
            // 把GridView的兩個欄位，動態加入 ListBox裡面（當成子項目 ListItem）
            ListItem item = new ListItem();
            item.Text = Server.HtmlDecode(row.Cells[0].Text) + " " + Server.HtmlDecode(row.Cells[2].Text);

            if (!ListBox1.Items.Contains(item))
            {
                ListBox1.Items.Add(item);
            }
        }
    }
}