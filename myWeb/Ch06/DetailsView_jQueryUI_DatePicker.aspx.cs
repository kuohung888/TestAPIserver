using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch06_DetailsView_jQueryUI : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            TextBox TB = (TextBox)DetailsView1.FindControl("TextBox1");
            Label2.Text = TB.ClientID;
        }

    }

}