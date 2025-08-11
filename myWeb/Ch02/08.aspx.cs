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

public partial class Ch02_8 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //註解：判別「使用者輸入的值」是否大於10？
        
        int a = Convert.ToInt32(Request["u_number"]);
        // C#語法比較嚴謹，務必先把輸入的值，轉成適當的格式
        //    （例如：本範例轉成 Int整數型態），否則就會報錯！

        //註解：使用者傳來一個值，要給這支程式來執行。
        //           我們在程式內部，就必須利用Request[“變數名稱”] 來承接使用者傳遞過來的值。
        //           因此「Request[“u_number”]」就等於是「15」的意思。

		if  (a > 10) {
		      Response.Write("恭喜！您輸入的值，大於10喔！"); 
        }
		else {
		      Response.Write("抱歉！您輸入的值，小於10。");
        }
    }
}
