using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_UC_Samples_UC_ViewState : System.Web.UI.Page
{

    // 自動產生 Page_Init事件
    protected override void OnInit(EventArgs e)
    {
        // 傳統寫法會造成錯誤！
        //ViewState["test"] = "Hello! The World.";

        // 另一種的寫法
        Context.Items["test"] = "Hello! The World."; 

        base.OnInit(e);   //自動產生的程式碼
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}