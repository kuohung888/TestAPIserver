using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_test_01 : System.Web.UI.Page
{

    int i;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            i = 0;
            Response.Write("<font color=blue>i = " + i + "</font><br />");
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        int compute_i = Convert.ToInt32(Label1.Text) + 1;
        Label1.Text = compute_i.ToString();

        Response.Write("i = " + (i + 1) + "<br />");
    }
}