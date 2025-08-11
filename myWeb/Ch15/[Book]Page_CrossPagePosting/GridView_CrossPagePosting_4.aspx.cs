using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch15__Book_Page_CrossPagePosting_GridView_CrossPagePosting_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            TextBox1.Text = Session["test_time"].ToString();
            TextBox2.Text = Session["title"].ToString();
        }
    }
}