using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch12_ListView_ListView_Nest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "UnSelect")
        {
            ListView1.SelectedIndex = -1;
        }
    }
}