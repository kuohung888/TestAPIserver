using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myEx_textbox01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        lbltxt.Text ="目前時間是"+DateTime.Now.ToLongTimeString();
        

    }




    protected void txtbox1_TextChanged(object sender, EventArgs e)
    {
       
        lbltxt2.Text = txtbox1.Text + "目前時間是"+DateTime.Now.ToLongTimeString();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
       
        lbltxt3.Text = txtbox2.Text + "目前時間是"+DateTime.Now.ToLongTimeString();



    }
}