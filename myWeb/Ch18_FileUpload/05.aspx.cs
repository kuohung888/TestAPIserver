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

public partial class Ch18_FileUpload_5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // 註解：先設定好檔案上傳的路徑，這是Web Server電腦上的目錄。
        String savePath  = "d:\\temp\\uploads\\";
        //      或是寫成  String savePath = @"d:\temp\uploads\";

        if (FileUpload1.HasFile)  
        {
            String fileName = FileUpload1.FileName;  //-- User上傳的完整檔名（不包含 Client端的路徑！）

            //====註解：擷取上傳檔案的「.副檔名」。=============(start)
            String fileExtension = System.IO.Path.GetExtension(fileName);
            // 想抓到「主檔名」，請寫成 System.IO.Path.GetFileName(fileName)
            

            if ((fileExtension == ".doc") || (fileExtension == ".xls"))
            {
                savePath = savePath + fileName;
                FileUpload1.SaveAs(savePath);
                Label1.Text = "上傳成功，檔名---- " + fileName;  }
            else  {
                Label1.Text = "只有 .doc或是 .xls副檔名的檔案，方能上傳。";  }
            //=========================================(end)
        }
        else 
       {
            Label1.Text = "請先挑選檔案之後，再來上傳";
        }
    }
}
