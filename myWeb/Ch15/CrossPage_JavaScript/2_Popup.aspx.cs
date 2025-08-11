using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch15_test_Popup : System.Web.UI.Page
{

    //請參考「跨網頁張貼」的第二種作法！
    public String myTextBox
    {
        get
        {
            return TextBox1.Text;
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {

    }
}