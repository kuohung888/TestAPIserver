using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_Button_Enter_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("Button1 !! " + TextBox1.Text + "<br />");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Write("Button2 !! " + TextBox1.Text + "<br />");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Write("Button3 !! " + TextBox1.Text + "<br />");
    }
}