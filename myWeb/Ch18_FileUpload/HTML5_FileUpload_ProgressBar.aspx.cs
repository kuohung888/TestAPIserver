using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_HTML5_FileUpload_ProgressBar : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //-- 註解：先設定好檔案上傳的路徑，這是Web Server電腦上的目錄。
        //       C#語法在撰寫磁碟的目錄位置時，請留意以下的寫法：
        String savePath = "d:\\temp\\uploads\\";

        if (FileUpload1.HasFile)
        {
            String fileName = FileUpload1.FileName;

            savePath = savePath + fileName;
            FileUpload1.SaveAs(savePath);
        }
        
    }
}