using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CS_10_Multi_Upload_Only45 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //--註解：網站上的目錄路徑。所以不寫磁碟名稱（不寫 “實體”路徑）。
        //--           上傳後的存檔目錄，請依照您的環境作修改。
        String saveDir= @"\Ch18_FileUpload\Uploads\";
        //-- 或是寫成  String saveDir= "\\Ch18_FileUpload\\Uploads\\";
        String appPath= Request.PhysicalApplicationPath;

        System.Text.StringBuilder SB = new System.Text.StringBuilder();

        //===========================================
        //== Ony .NET 4.5有這個新的 AllowMultiPle屬性
        //===========================================

        String fileName, savePath;
        foreach (HttpPostedFile postedFile in FileUpload1.PostedFiles)
        {
            fileName = postedFile.FileName;

            // –完成檔案上傳的動作。
            savePath = appPath + saveDir + fileName;
            postedFile.SaveAs(savePath);

            SB.Append("<hr>檔名---- " + fileName);
        }

        Label1.Text = "上傳成功" + SB.ToString();
    }
}