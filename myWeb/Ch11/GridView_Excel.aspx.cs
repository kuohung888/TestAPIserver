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

//========================
using System.IO;
using System.Web.UI;  //註解：HtmlTextWriter與 .RenderControl()方法都要用到這個命名空間。
using System.Text;


public partial class Ch11_GridView_Excel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write(DateTime.Now.ToString());
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "BIG5";

        string Excel_ShortTime = DateTime.Now.ToShortDateString() + "_" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
        Response.AppendHeader("Content-Disposition", "attachment;filename=test_file_" + Excel_ShortTime + ".xls");
        //以下載的日期、時間為 Excel檔名
        
        Response.ContentEncoding = Encoding.GetEncoding("BIG5");
        Response.ContentType = "application/ms-excel ";

        GridView1.EnableViewState = false;
        GridView1.AllowPaging = false; 

        StringWriter objStringWriter = new StringWriter();
        HtmlTextWriter objHtmlTextWriter = new HtmlTextWriter(objStringWriter);
        //--註解：或是寫成 HtmlTextWriter objHtmlTextWriter = new HtmlTextWriter(objStringWriter);

        GridView1.RenderControl(objHtmlTextWriter);

        Response.Write(objStringWriter.ToString());
        Response.End();
    }

    
    //*********************************************************************************
    public override void VerifyRenderingInServerForm(Control control)
    {
        //== 處理 GridView的控制項。 'GridView' 必須置於有 runat=server 的表單標記之中
        //== http://msdn.microsoft.com/zh-tw/library/system.web.ui.page.verifyrenderinginserverform(VS.80).aspx

        //—註解：或是在 Web.Config檔案裡面，增加這一行<pages enableEventValidation ="false" ></pages> 就可以免除上面這個事件。

    }

}
