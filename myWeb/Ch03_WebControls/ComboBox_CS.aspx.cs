using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_ComboBox_CS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        TextBox1.Text = DropDownList1.SelectedItem.Text;
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = "您剛剛完成的 TextBox內容是--- " + TextBox1.Text;
    }
}