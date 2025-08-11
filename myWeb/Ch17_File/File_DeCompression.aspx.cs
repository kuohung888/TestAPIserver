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



public partial class Book_Sample_Ch17_File_File_DeCompression : System.Web.UI.Page
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
            DeCompress(fi);
        }
    }


    public void DeCompress(FileInfo fi)
    {
        // Get the stream of the source file.
        using (FileStream inFile = fi.OpenRead())
        {   //== 取得檔案壓縮前的附檔名，例如：report.doc.gz檔案，壓縮之前是一個 .doc檔案

            string curFile = fi.FullName;

            //== 注意！！目錄下，只有附檔名「.gz」壓縮檔，才會進行解壓縮。
            if (Right(curFile, 3) == ".gz")
            {
                string origName = curFile.Remove(curFile.Length - fi.Extension.Length);

                //== 解開壓縮檔
                using (FileStream outFile = File.Create(origName))
                {
                    using (GZipStream Decompress = new GZipStream(inFile, CompressionMode.Decompress))
                    {
                        // Copy the decompression stream into the output file.
                        Decompress.CopyTo(outFile);

                        Label1.Text = Label1.Text + "<br />Decompressed from " + fi.Name + " to " + origName;

                    }
                }
            }

        }
    }


    public static string Right(string param, int length)
    {
        //start at the index based on the lenght of the sting minus
        //the specified lenght and assign it a variable
        string result = param.Substring(param.Length - length, length);
        //return the result of the operation
        return result;
    }
}