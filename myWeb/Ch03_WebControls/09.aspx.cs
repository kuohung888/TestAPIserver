using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_9 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("共有「" + RadioButtonList1.Items.Count + "」篇文章，您想看哪幾篇呢？<hr>");


        for (int i = 0; i < RadioButtonList1.Items.Count; i++)
        {
            //-- 註解：控制項的 Items是從「零」算起的

            if (RadioButtonList1.Items[i].Selected)
             {               
                Label1.Text = RadioButtonList1.Items[i].Text;
            
                Label2.Text = RadioButtonList1.Items[i].Value;
             }
        }

    }
}