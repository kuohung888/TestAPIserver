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

public partial class Ch18_FileUpload_6 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //--註解：網站上的 URL目錄路徑。所以不寫磁碟名稱（不寫實體路徑）。
        string saveDir= "Ch18_FileUpload\\Uploads\\";
        ////-- 路徑的一開始「不可」寫「\\」，否則存檔時，會出現兩個 「\\」符號
        ////-- 此問題可以透過 Path.Combine()方法解決。

        //--註解：HttpRequest.PhysicalApplicationPath屬性用於取得
        //            目前執行中的Web Server之根目錄的 "實體"檔案系統路徑。
        string appPath = Request.PhysicalApplicationPath;
        //-- appPath是網站 "根"目錄「轉換成」Server端硬碟路徑。

        if (FileUpload1.HasFile)
        {
            string savePath = appPath + saveDir + FileUpload1.FileName;
            //-- FileUpload1.FileName -- User上傳的完整檔名（不包含 Client端的路徑！）

            FileUpload1.SaveAs(savePath);
            Label1.Text = "上傳成功!! <br>" + savePath;
        }
        else
        {
            Label1.Text = "請先挑選檔案之後，再來上傳";
        }
    }
}
