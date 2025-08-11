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

public partial class Ch02_3_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
         String u_word;
         u_word = "我愛ASP.NET";
        //註解：宣告my_word變數為「字串型態」。

        Response.Write(u_word);   //註解：變數名稱「不」需要加上雙引號（”）。
    }
}
