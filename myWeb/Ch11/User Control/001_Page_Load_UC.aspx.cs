using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_001_Page_Load_UC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {   //第一次。設定為零。
            Session["Page"] = 0;
        }
        else
        {
            //Label1.Text = (Convert.ToInt32(Label1.Text) + 1).ToString();
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["Page"] = Convert.ToInt32(Session["Page"]) + 1;
        Span1.InnerText = Session["Page"].ToString();
    }
}