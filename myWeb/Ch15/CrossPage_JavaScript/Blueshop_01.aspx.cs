using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch15_CrossPage_JavaScript_Blueshop_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Attributes.Add("onClick", "showModalDialog('Blueshop_02.aspx?TestText=" + TextBox1.ClientID + "',self, 'dialogWidth:650px;dialogHeight:450px;');"); 
        //加入 JavaScript
    }
}