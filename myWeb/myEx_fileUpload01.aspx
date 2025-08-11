<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_fileUpload01.aspx.cs" Inherits="myEx_fileUpload01" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>檔案上傳系統 (改良版)</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
         body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .upload-section {
            margin-bottom: 20px;
            padding: 15px;
            background: #f9f9f9;
            border-radius: 5px;
            border-left: 4px solid #4CAF50;
        }
        .upload-section h2 {
            margin-top: 0;
            color: #4CAF50;
            font-size: 18px;
        }
        .btn-upload {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: background-color 0.3s;
        }
        .btn-upload:hover {
            background-color: #45a049;
        }
        .file-info-panel {
            margin-top: 30px;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #f9f9f9;
            display: none; /* Initially hidden */
        }
        .file-info-item {
            margin-bottom: 10px;
            padding-bottom: 10px;
            border-bottom: 1px dashed #ddd;
        }
        .file-info-item:last-child {
            border-bottom: none;
        }
        .file-link {
            color: #2196F3;
            text-decoration: none;
            cursor: pointer;
        }
        .file-link:hover {
            text-decoration: underline;
        }
        .validation-error {
            color: #f44336;
            font-size: 12px;
            margin-top: 5px;
        }
        .file-input-label {
            display: inline-block;
            padding: 8px 12px;
            background: #e9e9e9;
            border-radius: 4px;
            cursor: pointer;
            margin-right: 10px;
        }
        .file-input {
            display: none;
        }
        /* 新增樣式 */
        .file-info-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .file-info-box {
            flex: 1;
            min-width: 300px;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background: #f9f9f9;
        }
        .file-info-box h3 {
            margin-top: 0;
            color: #4CAF50;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container">
            <h1>檔案上傳系統 (改良版)</h1>
            
            <div class="upload-section">
                <h2>文件上傳</h2>
                <label for="fileUploadDocument" class="file-input-label">選擇文件</label>
                <asp:FileUpload ID="fileUploadDocument" runat="server" CssClass="file-input" />
                <asp:RequiredFieldValidator ID="rfvDocument" runat="server" 
                    ControlToValidate="fileUploadDocument" ErrorMessage="請選擇文件" 
                    Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvDocumentType" runat="server" 
                    ControlToValidate="fileUploadDocument" ErrorMessage="僅支持PDF, DOC, XLSX, PPT格式" 
                    OnServerValidate="ValidateDocumentType" Display="Dynamic" CssClass="validation-error"></asp:CustomValidator>
            </div>
            
            <div class="upload-section">
                <h2>圖片上傳</h2>
                <label for="fileUploadImage" class="file-input-label">選擇圖片</label>
                <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="file-input" />
                <asp:RequiredFieldValidator ID="rfvImage" runat="server" 
                    ControlToValidate="fileUploadImage" ErrorMessage="請選擇圖片" 
                    Display="Dynamic" CssClass="validation-error"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvImageType" runat="server" 
                    ControlToValidate="fileUploadImage" ErrorMessage="僅支持JPG, PNG, BMP格式" 
                    OnServerValidate="ValidateImageType" Display="Dynamic" CssClass="validation-error"></asp:CustomValidator>
            </div>
            
            <!-- 新增上傳按鈕 -->
            <div style="text-align: center; margin-top: 30px;">
                <asp:Button ID="btnUploadAll" runat="server" Text="上傳所有檔案" OnClick="btnUploadAll_Click" CssClass="btn-upload" />
            </div>
            
            <asp:Panel ID="pnlFileInfo" runat="server" CssClass="file-info-panel">
                <h2>上傳檔案資訊</h2>
                <div class="file-info-container">
                    <!-- 文件資訊 -->
                    <div class="file-info-box" id="documentInfoBox" runat="server">
                        <h3>文件資訊</h3>
                        <div class="file-info-item">
                            <strong>檔案名稱:</strong> <asp:Label ID="lblDocFileName" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="file-info-item">
                            <strong>檔案大小:</strong> <asp:Label ID="lblDocFileSize" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="file-info-item">
                            <strong>上傳時間:</strong> <asp:Label ID="lblDocUploadTime" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="file-info-item">
                            <strong>檔案連結:</strong> 
                            <a id="docFileLink" runat="server" class="file-link" target="_blank">點擊查看</a>
                        </div>
                    </div>
                    
                    <!-- 圖片資訊 -->
                    <div class="file-info-box" id="imageInfoBox" runat="server">
                        <h3>圖片資訊</h3>
                        <div class="file-info-item">
                            <strong>檔案名稱:</strong> <asp:Label ID="lblImgFileName" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="file-info-item">
                            <strong>檔案大小:</strong> <asp:Label ID="lblImgFileSize" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="file-info-item">
                            <strong>上傳時間:</strong> <asp:Label ID="lblImgUploadTime" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="file-info-item">
                            <strong>檔案連結:</strong> 
                            <a id="imgFileLink" runat="server" class="file-link" target="_blank">點擊查看</a>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>

    <script type="text/javascript">
        $(document).ready(function () {
            // 當選擇檔案時更新標籤文字
            $(".file-input").change(function () {
                var fileName = $(this).val().split('\\').pop();
                $(this).prev(".file-input-label").text(fileName || "選擇檔案");
            });

            // 上傳按鈕點擊動畫
            $(".btn-upload").click(function () {
                $(this).css("transform", "scale(0.95)");
                setTimeout(function () {
                    $(".btn-upload").css("transform", "scale(1)");
                }, 200);
            });
        });
    </script>
</body>
</html>