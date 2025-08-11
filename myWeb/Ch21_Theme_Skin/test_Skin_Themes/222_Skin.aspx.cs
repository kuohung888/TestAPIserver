using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_test_Skin_Themes_222_Skin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "admin" | TextBox2.Text == "admin")
        {
            Response.Redirect("333_Skin.aspx?uWord=admin");
            //==程式跳回下一支程式 333_skin.aspx，並且傳遞一個數值回去，即 uWord=admin。
        }
        else
        {
            //Response.Write("<h2><font color=red>帳號、密碼錯了！請輸入 admin / admin</font></h2>");
            Response.Redirect("333_Skin.aspx?uWord=" + TextBox1.Text);
            //==程式跳回下一支程式 333_skin.aspx，並且傳遞一個數值回去，即 uWord=你輸入的帳號。
        }

    }
}