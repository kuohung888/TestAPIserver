using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _001_Page_Load_UC : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {   //第一次。設定為零。
            Session["UC"] = 0;
        }
        else
        {
            //Label2.Text = (Convert.ToInt32(Label2.Text) + 1).ToString();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["UC"] = Convert.ToInt32(Session["UC"]) +1;
        Span2.InnerHtml = "UC裡面的數字 -- <font color=red><b>" + Session["UC"].ToString() + "</b></font>";
    }
}