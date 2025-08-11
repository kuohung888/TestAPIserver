<%@ Page Language="C#" %>

<%
    // 程式範例：09_Multi_Upload_HttpPostedFile.aspx  
    // 傳統的寫法，檔案上傳
    HttpPostedFile myFL;
    string savePath = "D:\\temp\\uploads\\";

    for (int i = 0; i < ((int)Request.Files.Count); i++)
    {
        myFL = Request.Files[i];

        if (myFL.ContentLength > 0)
        {
            //----透過下面的方法，只取出上傳檔案的檔名。-----重點！！----
            string[] StringArray = myFL.FileName.Split('\\');
            //Split 參考資料 http://msdn.microsoft.com/zh-tw/library/ms228388(VS.80).aspx

            int Array_No = (StringArray.Length - 1);
            string UploadFileName = StringArray[Array_No];
            //---------------------------------------------------------------------------------------------

            //—註解：「目錄路徑」與「檔案名稱」，兩者都要！
            myFL.SaveAs(savePath + UploadFileName);           
        }  // if condition
    } //for loop    
        
    
%>