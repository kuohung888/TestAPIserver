using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_FormView_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (TextBox1.Text == "123" && TextBox2.Text == "123")
        {
            Session["u_name"] = "123（您剛剛輸入的帳號）";
            Session["u_passwd"] = "123（您剛剛輸入的密碼）";

            Session["Login"] = "OK";
            //-- 註解：只有通過帳號、密碼的檢查，才會得到這個 Session[“Loging”] = “OK” 的鑰匙！
        }
        //帳號、密碼驗證成功後，跳到下一個網頁。
        Response.Redirect("FormView_Login_End.aspx");
        //註解：沒有獲得 Session[“OK”]，就算連到這網頁也沒用！
    }
}