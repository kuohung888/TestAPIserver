using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;     //==別忘了寫喔！==

public partial class Ch17_File_File_4 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
            string path1 = "c:\\temp\\MyTest.txt";
                    
            if (File.Exists(path1) == false)
            {   //--註解：如果檔案不存在，就新增一個檔案。
              StreamWriter sw = File.CreateText(path1);
                  sw.WriteLine("讀 者 你 好");
                  sw.WriteLine("歡 迎 來 到");
                  sw.WriteLine("==本範例==");
              sw.Flush();  //--註解：Flush 方法可用來清除任何內部緩衝區，並確認所有資料都已寫入。
              sw.Close();
            }

            try
            {
                     StreamReader sr = File.OpenText(path1);
                     while(sr.Peek() >= 0)
                     {     //-- 註解： .Peek()是用來尋找下一個字元。
                           Response.Write(sr.ReadLine());
                     }
                     sr.Close();

                     string path2 = path1 + "temp";
                     File.Delete(path2);    //-- 註解：先刪除清空，以確保 Path2沒有檔案。

                     File.Copy(path1, path2);
                     Response.Write("已經把Path1的檔案，Copy到Path2了！");

                     //這一段先註解掉，先檢查看看上面的 Copy動作有無成功？ 
                     //如果成功了，把下面兩行的註解去掉，試試看，刪除的動作有無成功？
                     //File.Delete(path2);
                     //Response.Write("Path2的檔案已經被刪除！");
            }
            catch(Exception ex)
            {
                     Response.Write("本程式在執行中，有哪些錯誤訊息發生？.... " + ex.ToString());
            }

    }
}
