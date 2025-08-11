<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeFile="HTML5_FileUpload_ProgressBar.aspx.cs" Inherits="Book_Sample_Ch18_FileUpload_HTML5_FileUpload_ProgressBar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

    <script type="text/javascript">
        //資料來源： http://www.matlus.com/html5-file-upload-with-progress/

        function fileSelected() {
            var file = document.getElementById('FileUpload1').files[0];
            if (file) {
                var fileSize = 0;
                if (file.size > 1024 * 1024)
                    fileSize = (Math.round(file.size * 100 / (1024 * 1024)) / 100).toString() + 'MB';
                else
                    fileSize = (Math.round(file.size * 100 / 1024) / 100).toString() + 'KB';

                document.getElementById('fileName').innerHTML = '檔名：' + file.name;
                document.getElementById('fileSize').innerHTML = '檔案大小：' + fileSize;
                document.getElementById('fileType').innerHTML = '檔案型態：' + file.type;
            }
        }

        function uploadFile() {    //按下 Button按鈕，會觸發這個事件。
            var fd = new FormData();
            fd.append("FileUpload1", document.getElementById('FileUpload1').files[0]);

            var xhr = new XMLHttpRequest();   // AJAX
            xhr.upload.addEventListener("progress", uploadProgress, false);
            xhr.addEventListener("load", uploadComplete, false);
            xhr.addEventListener("error", uploadFailed, false);
            xhr.addEventListener("abort", uploadCanceled, false);

            xhr.open("POST", "HTML5_FileUpload_ProgressBar.aspx");   //** 重點！！******
            //xhr.open("POST", "HTML5_FileUpload_ProgressBar_Exec.aspx");   //可運作，請把「後置程式碼」全部註解掉
            xhr.send(fd);
        }

        function uploadProgress(evt) {
            if (evt.lengthComputable) {
                var percentComplete = Math.round(evt.loaded * 100 / evt.total);
                document.getElementById('progressNumber').innerHTML = percentComplete.toString() + '%';
            }
            else {
                document.getElementById('progressNumber').innerHTML = 'unable to compute(無法運算)';
            }
        }

        function uploadComplete(evt) {
            /* This event is raised when the server send back a response */
            //alert(evt.target.responseText);
            alert("上傳完成~~");
        }

        function uploadFailed(evt) {
            alert("There was an error attempting to upload the file. 上傳時出現錯誤。");
        }

        function uploadCanceled(evt) {
            alert("The upload has been canceled by the user or the browser dropped the connection. 上傳中斷！");
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    
        資料來源：<a href="http://www.matlus.com/html5-file-upload-with-progress/">http://www.matlus.com/html5-file-upload-with-progress/</a><br />
        請用IE 10（含後續新版）的瀏覽器，方能支援XHR2。<br />
        <br />
        檔案上傳：<asp:FileUpload ID="FileUpload1" runat="server" onchange="fileSelected();" />
                       <!-- 選取檔案後，立即出現檔案資訊。 -->
                        <div id="fileName"></div>  
                        <div id="fileSize"></div>
                        <div id="fileType"></div>

        <hr />
        <div class="row">
            <asp:Button ID="Button1" runat="server" Text="Button_Upload" onclientclick="uploadFile()" OnClick="Button1_Click" />
            <!-- 使用ASP.NET控制項，這裡需改成 OnClientClick 
                （不可以是onclick，以免跟後置程式碼 Button1_Click事件混淆）-->
        </div>

        <div id="progressNumber"></div>        
         
    </form>


    <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
    <p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p>
    <p>
        使用到 XMLHttpRequest Level 2(XHR2)
    </p>
    <p>
        可參考 <a href="http://blog.darkthread.net/post-2014-03-09-upload-progress-bar-w-xhr2.aspx">http://blog.darkthread.net/post-2014-03-09-upload-progress-bar-w-xhr2.aspx</a>&nbsp;
    </p>
</body>
</html>
