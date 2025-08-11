using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_Inside_DropDownList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.EditIndex = GridView1.SelectedIndex;
    }
}