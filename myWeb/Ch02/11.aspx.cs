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

public partial class Ch02_11 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         //註解：判別使用者的輸入值（限定1~3）？連結到相關網站。

        if ((Request["u_number"] == null) || (Convert.ToInt32(Request["u_number"]) > 3) || (Convert.ToInt32(Request["u_number"]) < 1))
            {
               //註解：如果使用者不輸入數字的話，就會出現警告訊息。
               Response.Write("使用者務必輸入一個數字！限定1~3");
               Response.Write("<br />輸入訊息有誤！"); 
            }
        else
            {
              if (Convert.ToInt32(Request["u_number"])  == 1) {
                 Response.Redirect("http://www.find.org.tw/"); }

              if (Convert.ToInt32(Request["u_number"])  == 2) {
                 Response.Redirect("http://www.iii.org.tw/"); }
        
              if (Convert.ToInt32(Request["u_number"])  == 3) {
                 Response.Redirect("http://www.yahoo.com.tw/"); }
            }

    }
}
