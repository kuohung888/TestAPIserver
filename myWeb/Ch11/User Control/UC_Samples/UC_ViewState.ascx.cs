using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_UC_Samples_UC_ViewState : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 傳統寫法會造成錯誤！
        //Label1.Text = ViewState["test"].ToString();

        // 另一種的寫法
        Label1.Text = Context.Items["test"].ToString();
    }
}