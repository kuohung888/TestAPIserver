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

public partial class _7_2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String my_class_text = "";

        for (int i = 0; i < (ListBox1.Items.Count); i++)
        {
            if (ListBox1.Items[i].Selected)  {
                my_class_text += ListBox1.Items[i].Text +  "  ， ";  }
        }
        
        Label1.Text = my_class_text;
    }
}
