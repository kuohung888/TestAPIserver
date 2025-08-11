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

public partial class Ch03_WebControls_CheckBoxList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int u_summary = 0;

        for(int i = 0; i < (CheckBoxList1.Items.Count); i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {
                u_summary += Convert.ToInt32(CheckBoxList1.Items[i].Value);
            }                
        }
        
        //----------------------------------------------------------------------------

        for (int j = 0; j < (CheckBoxList2.Items.Count); j++)
        {
            if (CheckBoxList2.Items[j].Selected)
            {
                u_summary += Convert.ToInt32(CheckBoxList2.Items[j].Value);
            }
       }

        Label_summary.Text = u_summary.ToString();
    }
}
