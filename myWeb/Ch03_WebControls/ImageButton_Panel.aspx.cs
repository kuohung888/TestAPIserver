using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_ImageButton_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!Page.IsPostBack)
        //{
        //    Session["click"] = 0;
        //}

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        //== 方法一 ==
        //if (((int)Session["click"] % 2) == 0)
        //{
        //    Panel1.Visible = true;
        //}            
        //else
        //{
        //    Panel1.Visible = false;
        //}

        //Session["click"] = (int)Session["click"] + 1;


        //==============================
        //== 方法二 ==
        if (Panel1.Visible == false)
        {
            Panel1.Visible = true;
        }
        else
        {
            Panel1.Visible = false;
        }
            
    }
}