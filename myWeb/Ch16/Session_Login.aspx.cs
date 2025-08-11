using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch16_Session_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (TextBox1.Text == "123" && TextBox2.Text == "123")
        {
            Session["u_name"] = "123";
            Session["u_passwd"] = "123";

            Session["Login"] = "OK";
            //-- 註解：只有通過帳號、密碼的檢查，才會得到這個 Session[“Loging”] = “OK” 的鑰匙！
        }
        //帳號、密碼驗證成功後，跳到下一個網頁。
        Response.Redirect("Session_Login_End_2.aspx");
        //註解：沒有獲得 Session[“OK”]，就算連到這網頁也沒用！
    }
}
