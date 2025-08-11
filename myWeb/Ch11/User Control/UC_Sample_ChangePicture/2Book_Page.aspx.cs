using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Page2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Book_UC2.DisplayBook = "VB" ;

        if (RadioButtonList1.SelectedValue == "CS")
        {
            Book_UC2.DisplayBook = "CS";
            ViewState["NavigateUrl"] = "http://www.pchome.com.tw";
        }
        else
        {
            Book_UC2.DisplayBook = "VB";
            ViewState["NavigateUrl"] = "http://www.yahoo.com.tw";
        }
            

        Book_UC2.DisplayUrl = ViewState["NavigateUrl"].ToString();

        // 把字串(String)轉換成 Enum，請用這種寫法！
        // 資料來源：http://msdn.microsoft.com/zh-tw/library/kxydatf9(v=vs.110).aspx
        // http://www.dotblogs.com.tw/dotjum/archive/2008/02/10/1055.aspx
        
        // http://www.dotblogs.com.tw/wei314/archive/2009/12/30/12739.aspx

    }
}