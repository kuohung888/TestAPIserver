using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_test_Skin_Themes_333_Skin : System.Web.UI.Page
{

    //==修改原本第一支程式（111_Skin.aspx）的後置程式碼
    //==如果傳來一個關鍵字「admin」，我們就把 本範例的外觀與佈景主題（Theme）
    //==立刻改成 Theme2 的格式（因為 Theme2的目錄底下是空的，所以沒有任何外觀，是預設值）

    protected void Page_PreInit(object sender, EventArgs e)
    {
        //-- C#用戶必須自己寫這個 Page_PreInit事件

        if (Request["uWord"].ToString() == "admin")
        {
            // 輸入 admin / admin 就是管理員身分，網頁的Theme會隨之改變。

            this.Theme = "Theme2";
            //==立刻改成 Theme2 的格式

            Response.Write("<h2><font color=red>admin管理員身分，看不見任何CSS樣式！！</font></h2><hr>");
        }
        else
        {
            this.Theme = "Theme1";
            //==立刻改成 Theme1 的格式。TextBox與Button的外觀、配色都會變。
            Response.Write("<h2><font color=blue>「非」admin管理員身分，看見 Theme1的CSS樣式！！</font></h2><hr>");
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
}