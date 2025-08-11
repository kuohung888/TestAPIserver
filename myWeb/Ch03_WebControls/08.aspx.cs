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

public partial class Ch03_WebControls_8 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("共有" + CheckBoxList1.Items.Count + "個候選人<hr>");

        String my_class_text = null;   //--或是寫成 String my_class_text  = null; 

        for(int i = 0;i < CheckBoxList1.Items.Count;i++)
        {
            //註解：控制項的 Items是從「零」算起的
            if (CheckBoxList1.Items[i].Selected)
            {
                my_class_text += CheckBoxList1.Items[i].Text + " ， ";    }
        }

        Label1.Text = my_class_text;
    }
}
