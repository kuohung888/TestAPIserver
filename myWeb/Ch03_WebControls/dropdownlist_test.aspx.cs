using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch03_WebControls_dropdownlist_test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "NEW_ITEM")
        {
            Panel1.Visible = true;
        }           
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
                DropDownList1.Items.Add(TextBox1.Text);
                Panel1.Visible = false;
    }
}
