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

public partial class Ch02_7 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
            Response.BufferOutput = true;    //註解：先打開緩衝區
    
            Response.Write("把資料「第一次」放進緩衝區！");
            Response.Clear();
            //註解：直接「清除」緩衝區，所以，使用者在網頁上看不見上面這段話！

            Response.Write("把資料「第二次」放進緩衝區！");
            Response.Flush() ;    //註解：這次，使用者應該看的到這段話囉！

    }
}
