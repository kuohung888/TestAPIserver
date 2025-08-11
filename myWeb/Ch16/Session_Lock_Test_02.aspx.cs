using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_Session_Lock_Test_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] != null)   //***C#不加上這一段會報錯。
        {
            if (Session["Login_OK"].ToString() == "OK")
            {
                Label1.Text = "等待第一支程式沈睡30秒之後，這裡才通過 Session的檢驗！！！";
            }
        }

    }
}