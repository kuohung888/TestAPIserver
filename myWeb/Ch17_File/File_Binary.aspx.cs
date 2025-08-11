using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;     //==別忘了寫喔！==


public partial class Ch17_File_File_Binary : System.Web.UI.Page
{
    //------------------------------------------------------------------------------------------
    private const string FILE_NAME = "C:\\MIS2000Lab_TestFile3.txt";
    //------------------------------------------------------------------------------------------

    protected void Button1_Click(object sender, EventArgs e)
    {  //參考資料：http://msdn.microsoft.com/zh-tw/library/36b93480.aspx
        FileStream fs;

        try
        {
            if(File.Exists(FILE_NAME))
            {   //--註解：先檢查一下，看看這個檔案是否存在？
                Response.Write("*** C:\\MIS2000Lab_TestFile3.txt 檔案的確存在！***<hr>");
                //--註解：設定FileMode.CreateNew時，檔案已經存在，就不會執行下面的寫入動作。
                //--          拋出例外狀況，IOException。
            }

            //--註解：寫入資料---------------------------------
            fs = new FileStream(FILE_NAME, FileMode.CreateNew);
            BinaryWriter bw = new BinaryWriter(fs);
            //參考資料 http://msdn.microsoft.com/zh-tw/library/system.io.binarywriter.aspx

            for(int i = 0; i<10;i++)
            {
                bw.Write(i);
            }
            bw.Close();
            fs.Close();
        }
        catch(IOException ex)
        {
            Response.Write(ex.GetType().Name + "    " + ex.Message.ToString());
            Response.Write("<hr>");
            //--註解：設定FileMode.CreateNew時，檔案已經存在，就會拋出例外狀況，IOException。
        }
        finally
        {
            //--註解：讀取資料---------------------------------
            fs = new FileStream(FILE_NAME, FileMode.Open, FileAccess.Read);
            BinaryReader br = new BinaryReader(fs);
            Response.Write("<font color=red>C:\\MIS2000Lab_TestFile3.txt 檔案的內容----<br>");
            for(int j = 0;j<10;j++)
            {
                Response.Write(br.ReadInt32() + "<br>");
            }
            Response.Write("</font>");
            br.Close();
            fs.Close();

            fs.Dispose();
            //--程式的最後，請確定對所有 FileStream物件呼叫 .Dispose()方法，尤其是在磁碟空間有限的環境中更應如此。
            //--如果沒有可用的磁碟空間，且在 FileStream完成之前沒有呼叫 .Dispose()方法，則執行 IO作業可能會引發例外狀況。
        }
    }
}
