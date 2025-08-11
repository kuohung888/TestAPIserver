using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch15_Page_Init : System.Web.UI.Page
{

    protected void Page_PreInit(object sender, EventArgs e)
    {
       Response.Write("<br /><font color=blue>Page_PreInit事件(2)---</font>" + Label1.Text);
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Response.Write("<br /><font color=blue>Page_Init事件(1)</font>---" + Label1.Text);
        }
        else
        {
            Response.Write("<br /><font color=blue>Page_Init事件(2)</font>---" + Label1.Text);
        }      
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Response.Write("<br /><br /><big><font color=blue>Page_Load事件(1)---</font>" + Label1.Text + "</big>");
        }
        else
        {
            Response.Write("<br /><br /><big><font color=blue>Page_Load事件(2)---</font>" + Label1.Text + "</big>");
            Response.Write("==Label仍記錄上一次的值==");
        }
    }

    protected void Page_LoadCompleted(object sender, EventArgs e)
    {
        Response.Write("<br /><font color=blue>Page_LoadCompleted事件---</font>" + Label1.Text);
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        Response.Write("<br /><font color=blue>Page_PreRender事件---</font>" + Label1.Text);
    }


    //==== Label ========================================
    protected void Label1_Init(object sender, EventArgs e)
    {
        Response.Write("<br /><font color=red>Label1_Init事件---</font>" + Label1.Text);
    }
    protected void Label1_Load(object sender, EventArgs e)
    {
        Response.Write("<br /><br /><big><font color=red>Label1_Load事件---</font>" + Label1.Text + "</big>");
    }
    protected void Label1_PreRender(object sender, EventArgs e)
    {
        Response.Write("<br /><font color=red>Label1_PreRender事件---</font>" + Label1.Text);
    }


    //==== Button ========================================
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<h2>按下Button_Click事件</h2>");
        Label1.Text = "Label-B .... ***Button_Click事件之後*** ...." + DateTime.Now.ToString("hh:mm:ss:ffff");
    }
}