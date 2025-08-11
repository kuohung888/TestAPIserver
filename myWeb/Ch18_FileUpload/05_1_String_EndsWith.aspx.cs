using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_5_1_String_EndsWith : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        // 註解：先設定好檔案上傳的路徑，這是Web Server電腦上的目錄。
        String savePath = "D:\\temp\\uploads\\";
        //      或是寫成  String savePath = @"d:\temp\uploads\";

        if (FileUpload1.HasFile)
        {
            String fileName = FileUpload1.FileName;  //-- User上傳的完整檔名（不包含 Client端的路徑！）

            //====註解：擷取上傳檔案的「副檔名」。=============(start)

            //-- 字串結果是否符合某一字串？傳回值 Y/N。
            //-- 參考資料：  http://msdn.microsoft.com/zh-tw/library/system.string.endswith(v=VS.100).aspx
            if (fileName.EndsWith(".doc") || fileName.EndsWith(".xls"))
            {
                savePath = savePath + fileName;
                FileUpload1.SaveAs(savePath);
                Label1.Text = "上傳成功，檔名---- " + fileName;
            }
            else
            {
                Label1.Text = "只有 .doc或是 .xls副檔名的檔案，方能上傳。";
            }
            //=========================================(end)
        }
        else
        {
            Label1.Text = "請先挑選檔案之後，再來上傳";
        }
    }
}