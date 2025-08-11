using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_Session_Lock_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "123" && TextBox2.Text == "123")
        {
            Session["Login_OK"] = "OK";

            System.Threading.Thread.Sleep(10000);
            //--系統會沉睡10秒鐘
        }
    }
}