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

public partial class Ch03_WebControls_9 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("共有" + RadioButtonList1.Items.Count + "個選項<hr>");

        string my_class_text = "";
        string my_class_value = "";

        for (int i = 0; i < RadioButtonList1.Items.Count; i++)
        {
            //註解：控制項的 Items是從「零」算起的
            if (RadioButtonList1.Items[i].Selected)
            {
                my_class_text += RadioButtonList1.Items[i].Text + " ， ";
                my_class_value += RadioButtonList1.Items[i].Value + " ， ";
            }
        }

        Label1.Text = my_class_text;
        Label2.Text = my_class_value;
    }
}
