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

public partial class Ch15_Page_4 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

        //-- 參考資料  http://msdn.microsoft.com/zh-tw/library/ms178139%28v=vs.90%29.aspx

        if (Page.PreviousPage != null)
        {
                if (PreviousPage.IsCrossPagePostBack)    
                {
                    //參考資料： http://msdn.microsoft.com/zh-tw/library/system.web.ui.page.iscrosspagepostback(v=vs.90).aspx
                    //無論哪個方式，PreviousPage頁面屬性都將包含表示前一個或原始頁面的物件。
                    //例如，如果頁面 A 張貼至頁面 B，則頁面 A （例如：Page_3.aspx）的 IsCrossPagePostBack 屬性 (透過PreviousPage 屬性存取) 將為 true，
                    //並且頁面 B 的 PreviousPage 屬性將具有頁面 A 的名稱。

                    Label1.Text = PreviousPage.my_Calendar.SelectedDate.ToString();
                    //重點在於「PreviousPage」這個字！
                }
                else 
                {
                    Response.Redirect("Page_3.aspx");
                      //-- 註解：強制跳回第一支原始網頁
                }
        }
        else
        {
            Response.Write("<h2>並無「跨網頁張貼」！</h2>");
            //-- 當您直接執行 Page_4.aspx，會出現這個警告訊息！
        }


    }
}
