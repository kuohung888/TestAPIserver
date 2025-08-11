using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_MIS2000Lab_book_image_String_Format_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String myDateTime   = System.DateTime.Now.ToLongDateString();
        int myInt  = 100000;

        Response.Write(String.Format("日期：{0}。金額：{1}", myDateTime, myInt));
        Response.Write("<hr />");
        Response.Write(String.Format("日期：{0:yyyy/MM/dd}。金額：{1:C}", myDateTime, myInt));
    }
}