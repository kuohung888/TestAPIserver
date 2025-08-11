using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_FormView_Article_BR : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //*****相同程式，放在 Page_Load事件無效！！！***********
        //Label LB = (Label)FormView1.FindControl("articleLabel");

        //LB.Text = LB.Text.Replace("\r\n", "<br />");
    }


    protected void FormView1_DataBound(object sender, EventArgs e)
    {  //*** 成功！！***
        //Label LB = (Label)FormView1.FindControl("articleLabel");

        //LB.Text = LB.Text.Replace("\r\n", "<br />");
    }
}