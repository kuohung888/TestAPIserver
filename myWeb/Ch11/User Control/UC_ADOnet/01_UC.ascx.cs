using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_UC_ADOnet_01_UC : System.Web.UI.UserControl
{

    //*********************************
    // 只有 set而已，所以是Write Only的屬性。
    public String newsClass
    {
        set
        {
            Label1.Text = value;
        }
    }
    //********************************

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}