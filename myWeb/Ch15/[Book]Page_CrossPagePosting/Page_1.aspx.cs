using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch15_Page_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDate.Date.ToShortDateString();
        //--把選取的日期，以「短日期格式」來呈現。
    }

}
