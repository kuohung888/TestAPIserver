using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_Default_2_DataSet_Manual_Error2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Button1.PostBackUrl = "Default_2_DataSet_Manual.aspx";
        // 不使用 Response.Redirect() 或是 Server.Transfer() 來作重新導向
        // 卻使用 「PostBackUrl屬性」，結果.....出現奇怪的成果。


        Response.Write("<h3>您剛剛按下按鈕了！......" + System.DateTime.Now.ToLongTimeString() + "</h3>");
    }
}