using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DetailsView_Insert_Copy : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DetailsView1_ModeChanging(object sender, DetailsViewModeEventArgs e)
    {
        //***** 抓不到「切換模式」以後，裡面的子控制項！ *****

        //// 資料來源： http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.detailsview.modechanging(v=vs.110).aspx

        //if (e.NewMode == DetailsViewMode.Insert)
        //{
        //    TextBox TB = (TextBox)DetailsView1.FindControl("TextBox2");
        //    Response.Write(TB.Text);
        //}
    }
    protected void DetailsView1_ModeChanged(object sender, EventArgs e)
    {
        //***** 抓不到「切換模式」以後，裡面的子控制項！ *****
        //if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
        //{
        //    TextBox TB = (TextBox)DetailsView1.FindControl("TextBox2");
        //    Response.Write(TB.Text);
        //}
    }

    protected void DetailsView1_ItemCreated(object sender, EventArgs e)
    {        
        if (DetailsView1.CurrentMode == DetailsViewMode.Insert)
        {
            TextBox TB = (TextBox)DetailsView1.FindControl("TextBox2");
            Response.Write(TB.Text);

            TextBox TB1 = (TextBox)DetailsView1.FindControl("TextBox1");
            TB1.Text = "HELLO!!";
            // 把 "預設值"寫入
            // 新增的時候，可以加入預設值。但進入「編輯」模式就沒法加入預設值 ??
        }
    }
}