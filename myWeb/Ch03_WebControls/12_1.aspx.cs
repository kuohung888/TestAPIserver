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

public partial class Ch03_WebControls_12_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void AdRotator1_AdCreated(object sender, AdCreatedEventArgs e)
    {
        //資料來源：http://msdn.microsoft.com/zh-tw/library/d6xa5a9k(v=vs.100).aspx

        e.ImageUrl = "~/Ch03_WebControls/MIS2000Lab_book_image/L339.jpg";
        e.NavigateUrl = "http://www.taconet.com.tw/mis2000lab/";
        e.AlternateText = "Linux架站徹底研究";

        e.ImageUrl = "~/Ch03_WebControls/MIS2000Lab_book_image/L331.jpg";
        e.NavigateUrl = "http://www.taconet.com.tw/mis2000lab/";
        e.AlternateText = "Linux作業系統";

       //啟用頁面快取後，AdRotator 控制項就不會快取。 
       //每當 Web 網頁重新整理時，新的廣告會被選取。 

       //不過，如果您提供 AdCreated事件的事件處理常式，就不會選取新的廣告。 
       //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    }
}
