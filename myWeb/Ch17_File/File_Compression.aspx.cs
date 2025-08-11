using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//=== 進行壓縮，必須宣告這兩個 NameSpace ===
using System.IO;
using System.IO.Compression;
//=== 進行壓縮，必須宣告這兩個 NameSpace ===


public partial class Book_Sample_Ch17_File_File_Compression : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //== 此範例會壓縮某一個目錄下，所有的檔案。
        //== 請先設定一個檔案，底下存放一些 .txt檔
        string dirpath = @"c:\MIS2000Lab_ASP.NET_Log";

        DirectoryInfo dir = new DirectoryInfo(dirpath);

        //== 壓縮某一個目錄下，所有的檔案。（更下層的子目錄，本範例無法壓縮）
        foreach (FileInfo fi in dir.GetFiles())
        {
            Compress(fi);
        }
    }


    public void Compress(FileInfo fi)
    {
        // Get the stream of the source file.
        using (FileStream inFile = fi.OpenRead())
        {
            //== 避免壓縮到「隱藏檔」或是「已經壓縮過的檔案」 
            if ((File.GetAttributes(fi.FullName) & FileAttributes.Hidden) != FileAttributes.Hidden & fi.Extension != ".gz")
            {
                // Create the compressed file.
                using (FileStream outFile = File.Create(fi.FullName + ".gz"))
                {
                    using (GZipStream Compress = new GZipStream(outFile,  CompressionMode.Compress))
                    {
                        // Copy the source file into the compression stream.
                        inFile.CopyTo(Compress);

                        Label1.Text += "Compressed " + fi.Name + " from " + fi.Length.ToString() + " to " + outFile.Length.ToString() + " bytes.<br/>";
                        //== 如果本函數設定為 public static void Compress(FileInfo fi)，這一行會報錯。
                    }
                }
            }
        }
    }

}