using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_06_DropDownList_ComboBox : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = DropDownList1.SelectedValue;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "")
        {
            Label1.Text = "您尚未輸入任何文字！";
        }
        else
        {
            Label1.Text = "您最後輸入的成果---" + TextBox1.Text;
        }
        
    }
}