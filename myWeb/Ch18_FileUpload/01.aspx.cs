using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;



public partial class Ch18_FileUpload_1 : System.Web.UI.Page
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
            String fileName = FileUpload1.FileName;  //-- User上傳的完整檔名（不包含 Client端的路徑！）

            savePath = savePath + fileName;
            FileUpload1.SaveAs(savePath);

            Label1.Text = "上傳成功，檔名---- " + fileName;
        }
        else
        {
            Label1.Text = "請先挑選檔案之後，再來上傳";
        }
    }
}
