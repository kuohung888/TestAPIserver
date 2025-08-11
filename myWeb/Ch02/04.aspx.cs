using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch02_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.WriteFile("123.txt");

        // Response的 .WriteFile()方法 --
        //    將一個文字檔案123.txt的所有檔案內容，輸出到畫面上


        //執行本範例的時候，您的瀏覽器
        //網頁編碼，請改成 Big-5 正體中文（繁體中文）。不然會看見亂碼。
    }
}
