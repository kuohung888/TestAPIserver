using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//=================
using System.IO;
//=================

public partial class Book_Sample_Ch17_File_File_append : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //--檢查同名的檔案是否存在？
        //-- 資料來源：http://msdn.microsoft.com/zh-tw/library/system.io.file.appendtext%28VS.80%29.aspx
        //    資料來源：http://msdn.microsoft.com/en-us/library/3zc0w663.aspx
        
        if (File.Exists("C:\\temp\\MIS2000Lab_TestFile_CS.txt")) 
        {
            Response.Write("此檔案已經存在.");
            return;   //-- 程式暫停、離開
        }

        using(StreamWriter w = File.AppendText("C:\\temp\\MIS2000Lab_TestFile_CS.txt"))
        {
            Log("Test1", w);
            Log("Test2", w);

            w.Close();
        }
    }


    public static void Log(string logMessage, TextWriter w)
    {
        //-- 資料來源：http://msdn.microsoft.com/en-us/library/3zc0w663.aspx
        w.Write("\r\nLog Entry : ");
        w.WriteLine("{0} {1}", DateTime.Now.ToLongTimeString(),
            DateTime.Now.ToLongDateString());
        w.WriteLine("  :");
        w.WriteLine("  :{0}", logMessage);
        w.WriteLine ("-------------------------------");

        // 資料全數寫入 Stream
        w.Flush();
    }

}