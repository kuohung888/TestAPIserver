using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_B09_Manual_Input_GridView_Insert_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //-- SqlDataSource已經幫我們完成新增（Insert Into）的SQL指令
        SqlDataSource1.Insert();
    }
}