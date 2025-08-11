using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_UC_Samples_UC_User_End : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserControl my_uc = new UserControl();

        if (Convert.ToInt32(Session["u_rank"]) == 1)
        {
            my_uc = (UserControl)LoadControl("UC_User_1.ascx");
            Page.Form.Controls.Add(my_uc);
            //==在Page（網頁）裡面，加入 [使用者控制項，User Control]
        }

        if (Convert.ToInt32(Session["u_rank"]) == 2)
        {
            my_uc = (UserControl)LoadControl("UC_User_2.ascx");
            Page.Form.Controls.Add(my_uc);
            //==在Page（網頁）裡面，加入 [使用者控制項，User Control]
        }

        if (Convert.ToInt32(Session["u_rank"]) > 2)
        {
            Response.Write("請使用 Rank =1或2的帳號登入，謝謝。");
        }


        // 改用 switch..case來寫更好！！！
    }
}