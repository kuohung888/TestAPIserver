using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_UC_Samples_Book_Page : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {         
        Book_UC.DisplayBook = RadioButtonList1.SelectedValue.ToString();
        // 搭配的UC，其class名為Book_UC
    }
}