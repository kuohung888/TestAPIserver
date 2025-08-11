using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_test_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //-- 兩種作法任選其一
            //Session["i"] = 0;
            //Response.Write("<font color=blue>i = " + Session["i"].ToString() + "</font><br />");
            ViewState["i"] = 0;
            Response.Write("<font color=blue>i = " + ViewState["i"].ToString() + "</font><br />");
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        int compute_i = Convert.ToInt32(Label1.Text) + 1;
        Label1.Text = compute_i.ToString();

        //Session["i"] = Convert.ToInt32(Session["i"]) + 1;
        //Response.Write("<font color=blue>Session[\"i\"] = " + Session["i"].ToString() + "</font><br />");
        ViewState["i"] = Convert.ToInt32(ViewState["i"]) + 1;
        Response.Write("<font color=blue>ViewState[\"i\"] = " + ViewState["i"].ToString() + "</font><br />");
    }
}