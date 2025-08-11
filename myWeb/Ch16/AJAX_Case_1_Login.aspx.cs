using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch16_AJAX_Case_1_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < (int)DropDownList1.Items.Count; i++)
        {
            if (DropDownList1.Items[i].Selected)
            {
                Session["my_color"] = DropDownList1.Items[i].Value;
                Session["my_name"] = TextBox1.Text;

                Response.Redirect("AJAX_Case_2.aspx");   //--前往聊天室的主畫面（AJAX版）
            }
        }

        Label1.Text = "您尚未選擇字體顏色～";
    }
}
