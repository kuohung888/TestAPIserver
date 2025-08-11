using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_TextBox_sender : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        TextBox TB = (TextBox)sender;    //--等號（=）的兩邊，C#要求：資料型態必須相等。
        Response.Write("<H3>" + TB.Text + "</H3>");
    }
}