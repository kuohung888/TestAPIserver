using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch12_ListView_Repeater_Multi_Delete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    // 重點！！！----------------------------------------------------------------------------------------
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //-- 參考資料：http://leehom59.blogspot.com/2008/07/repeater.html

        if (e.CommandName == "myDelete")
        {
            foreach (RepeaterItem RpItem in Repeater1.Items)
            {
                CheckBox CB = (CheckBox)RpItem.FindControl("CheckBox1");
                if (CB.Checked)
                {
                    Response.Write(CB.Text + "<br>");
                    //-- 您可以在此寫 ADO.NET程式，進行刪除的動作。
                    //-- 一旦您可以抓到「使用者勾選（要刪除）」的文章編號，那麼就很簡單了。
                }
            }
        }
    }
}