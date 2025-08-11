using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch15_CrossPage_JavaScript_Blueshop_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

            String str = @"function returnval(objid, objval) {
	                       window.dialogArguments.document.getElementById(objid).value = objval;
	                       window.close();      }";

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "自己命名即可", str, true); 
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Button1.Attributes.Add("onClick", "returnval('" + Request["TestText"].ToString() + "','" + TextBox222.Text + "');");
    }
}