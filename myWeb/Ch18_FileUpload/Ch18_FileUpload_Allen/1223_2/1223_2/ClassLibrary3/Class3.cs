using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.IO;
namespace ClassLibrary3
{
	/// <summary>
	/// 將會異動的部份抽離成屬性
	/// </summary>
	public class Class3
	{

		private List<string> _allowedExtextsion = new List<string> { ".jpg", ".bmp" };
		public List<string> allowedExtextsion {
			get { return _allowedExtextsion; }
			set { _allowedExtextsion = value; }
		}
		private int _maxLength=2100000;
		public int maxLength{
			get{return _maxLength;}
			set{_maxLength=value;}
		}

		public string serverDir {get;set;};
		private string message01 = "不允許該檔案上傳";
		private string message02 = "檔案大小上限為 2MB，該檔案無法上傳";
		private string message03 = "檔案上傳成功";

		public string doA(System.Web.UI.WebControls.FileUpload FU1)
		{
			string message = string.Empty;

			if (FU1.HasFile == false) return message;

			// FU1.FileName 只有 "檔案名稱.附檔名"，並沒有 Client 端的完整理路徑
			string filename = FU1.FileName;

			string extension = Path.GetExtension(filename).ToLowerInvariant();
			// 判斷是否為允許上傳的檔案附檔名
			
			if (allowedExtextsion.IndexOf(extension) == -1)
			{
				return message01;
			}

			// 限制檔案大小，限制為 2MB
			int filesize = FU1.PostedFile.ContentLength;
			if (filesize > maxLength)
			{
				return message02;
			}

			// 檢查 Server 上該資料夾是否存在，不存在就自動建立
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
				filename = string.Concat(fileNameOnly, "_", fileCount, extension);
				serverFilePath = Path.Combine(serverDir, filename);
				fileCount++;
			}

			// 把檔案傳入指定的 Server 內路徑
			try
			{
				FU1.SaveAs(serverFilePath);
				message= message03;
			}
			catch (Exception ex)
			{
				message= ex.Message;
			}

			return message;
		}
	}
}
