using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch16_Session_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["u_name"] != null)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            //--註解：如果SESSION裡面有值，就把資料呈現出來。

            Label1.Text = Session["u_name"].ToString();
            Label2.Text = Session["u_corp"].ToString();

            //Session.Abandon();    //--註解：手動清除 Session裡面的資料。
        }
        else
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            //--註解：如果SESSION裡面沒有值，就進入資料輸入畫面。
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["u_name"] = TextBox1.Text;
        Session["u_corp"] = TextBox2.Text;

        Response.Redirect("Session_4.aspx");
    }
}
