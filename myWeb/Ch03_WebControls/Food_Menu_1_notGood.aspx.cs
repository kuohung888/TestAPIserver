using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_Food_Menu_1_notGood : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedItem.Text;
    }


    protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Label2.Text = ListBox1.SelectedItem.Text;
    }
}