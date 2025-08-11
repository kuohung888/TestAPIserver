using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;     //==別忘了寫喔！==

public partial class Ch17_File_counter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //====讀取檔案 (務必修改這個檔案的權限，需要「寫入」的權限)====
        StreamReader sr = new StreamReader(Server.MapPath("counter.txt"));

        //--把檔案內, 原本的訪客人數[加一]
        string visitors = sr.ReadLine();
        visitors = Convert.ToString(Convert.ToInt32(visitors) + 1);

        //--把訪客人數[加一]之後，轉換成圖片
        int Length = visitors.Length;  //--計算訪客人數[加一]之後的 "字串長度"
        string strURL = "";

        //***************************************************
        while (Length >= 1)
        {
            //--訪客人數的每一位數字，都用圖片來呈現。
            strURL = "<IMG SRC='image/" + visitors.Substring((Length-1) ,1) + "lcdb0.gif'>" + strURL;
            // 因為 C#語法沒有VB的 Mid()函數，所以
            // 程式碼 strURL = "<IMG SRC='image/" + Mid(visitors, Length, 1) + "lcdb0.gif'>" + strURL;
            // 在C#語法裡面，改寫成上面這樣。
            Length = (Length - 1);
        }
        // 註解：這是一個有趣的迴圈！圖片是逆著張貼到畫面上。
        //  假設訪客人數為987，我們是先張貼7的圖片，然後是8的圖片，
        //  最後才是9的圖片。  完成時，畫面會出現987這三張圖片。
        //***************************************************

        sr.Close();
        sr.Dispose();

        //====寫入檔案，紀錄最新的訪客人數==================
        StreamWriter sw = new StreamWriter(Server.MapPath("counter.txt"));
        sw.WriteLine(visitors);   //--找不到檔案也不會出現錯誤訊息，而且會自動新增一個檔案。
        sw.Close();
        sw.Dispose();

        Label1.Text = strURL;
    }
}
