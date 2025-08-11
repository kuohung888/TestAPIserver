using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch18_FileUpload_FileUpload_JavaScript_Preview2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {   

        if (FileUpload1.PostedFile != null)
        {
            //** 兩種方法，任選其一。******************
            //資料來源：http://www.dotblogs.com.tw/aquarius6913/archive/2013/04/26/102317.aspx

            ////1. 圖片直接顯示在本頁面上（不使用 .ashx檔案）
            //HttpPostedFile myFile = FileUpload1.PostedFile;

            //// 以上傳檔案的大小，來設定buffer大小
            //byte[] myData = new byte[myFile.ContentLength];
            //myFile.InputStream.Read(myData, 0, myFile.ContentLength);
            //Response.Clear();

            //Response.ContentType = "image/jpeg";  //輸出到網頁上。
            //Response.BinaryWrite(myData);
 
            //****************************************

            //2. 圖片顯示在<asp:Image>控制項
            HttpPostedFile myFile = FileUpload1.PostedFile;

            Session["myFile"] = myFile;

            // Set ImageUrl。泛型處理常式（另外一個檔案）。
            Image1.ImageUrl = "FileUpload_Preview_CodeBehind.ashx";
          
        }

    }
}