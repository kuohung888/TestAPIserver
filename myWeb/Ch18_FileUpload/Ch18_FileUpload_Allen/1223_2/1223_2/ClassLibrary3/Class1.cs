using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.IO;
namespace ClassLibrary3
{
	/// <summary>
	/// 最原始的版本
	/// </summary>
    public class Class1
    {
		public static void doA(System.Web.UI.WebControls.FileUpload FU1, System.Web.UI.WebControls.Label lblMessage) { 
		if (FU1.HasFile == false) return;

            // FU1.FileName 只有 "檔案名稱.附檔名"，並沒有 Client 端的完整理路徑
            string filename = FU1.FileName;

            string extension = Path.GetExtension(filename).ToLowerInvariant();
            // 判斷是否為允許上傳的檔案附檔名
            List<string> allowedExtextsion = new List<string> { ".jpg", ".bmp" };
            if (allowedExtextsion.IndexOf(extension) == -1)
            {
                lblMessage.Text = "不允許該檔案上傳";
                return;
            }

            // 限制檔案大小，限制為 2MB
            int filesize = FU1.PostedFile.ContentLength;
				if (filesize > 2100000)
            {
                lblMessage.Text = "檔案大小上限為 2MB，該檔案無法上傳";
                return;
            }

            // 檢查 Server 上該資料夾是否存在，不存在就自動建立
            string serverDir = @"D:\FileUploadDemo";
            if (Directory.Exists(serverDir) == false) Directory.CreateDirectory(serverDir);

            // 判斷 Server 上檔案名稱是否有重覆情況，有的話必須進行更名
            // 使用 Path.Combine 來集合路徑的優點
            //  以前發生過儲存 Table 內的是 \\ServerName\Dir（最後面沒有 \ 符號），
            //  直接跟 FileName 來進行結合，會變成 \\ServerName\DirFileName 的情況，
            //  資料夾路徑的最後面有沒有 \ 符號變成還需要判斷，但用 Path.Combine 來結合的話，
            //  資料夾路徑沒有 \ 符號，會自動補上，有的話，就直接結合
            string serverFilePath = Path.Combine(serverDir, filename);
            string fileNameOnly = Path.GetFileNameWithoutExtension(filename);
            int fileCount = 1;
			while (File.Exists(serverFilePath))
            {
                // 重覆檔案的命名規則為 檔名_1、檔名_2 以此類推
                filename = string.Concat(fileNameOnly,"_",fileCount,extension);
                serverFilePath = Path.Combine(serverDir, filename);
                fileCount++;
            }

            // 把檔案傳入指定的 Server 內路徑
			try
            {
                FU1.SaveAs(serverFilePath);
                lblMessage.Text = "檔案上傳成功";
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Message;
            }
		}
    }
}
