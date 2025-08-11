using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myEx_fileUpload01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            pnlFileInfo.Visible = false;
            documentInfoBox.Visible = false;
            imageInfoBox.Visible = false;
        }
    }

    protected void btnUploadAll_Click(object sender, EventArgs e)
    {
        bool hasUploaded = false;

        // 上傳文件
        if (fileUploadDocument.HasFile && cvDocumentType.IsValid)
        {
            UploadFile(fileUploadDocument, "Documents", true);
            hasUploaded = true;
        }

        // 上傳圖片
        if (fileUploadImage.HasFile && cvImageType.IsValid)
        {
            UploadFile(fileUploadImage, "Images", false);
            hasUploaded = true;
        }

        if (hasUploaded)
        {
            pnlFileInfo.Visible = true;
            ScriptManager.RegisterStartupScript(this, GetType(), "showPanel",
                "$('.file-info-panel').slideDown(500);", true);
        }
        else
        {
            Response.Write("<script>alert('請至少選擇一個有效檔案上傳');</script>");
        }
    }

    private void UploadFile(FileUpload fileUploadControl, string folderName, bool isDocument)
    {
        try
        {
            string fileName = Path.GetFileName(fileUploadControl.FileName);
            string uploadFolderPath = Server.MapPath($"~/Uploads/{folderName}/");

            // 確保上傳目錄存在
            if (!Directory.Exists(uploadFolderPath))
            {
                Directory.CreateDirectory(uploadFolderPath);
            }

            string filePath = Path.Combine(uploadFolderPath, fileName);

            // 檢查檔案是否存在，若存在則刪除
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }

            // 儲存新檔案
            fileUploadControl.SaveAs(filePath);

            // 顯示檔案資訊
            DisplayFileInfo(fileName, fileUploadControl.FileBytes.Length, folderName, isDocument);
        }
        catch (Exception ex)
        {
            Response.Write($"<script>alert('{folderName}上傳失敗: {ex.Message}');</script>");
        }
    }

    private void DisplayFileInfo(string fileName, long fileSize, string folderName, bool isDocument)
    {
        if (isDocument)
        {
            lblDocFileName.Text = fileName;
            lblDocFileSize.Text = FormatFileSize(fileSize);
            lblDocUploadTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            string fileUrl = $"/Uploads/{folderName}/{HttpUtility.UrlEncode(fileName)}";
            docFileLink.HRef = fileUrl;
            docFileLink.InnerText = fileName;

            documentInfoBox.Visible = true;
        }
        else
        {
            lblImgFileName.Text = fileName;
            lblImgFileSize.Text = FormatFileSize(fileSize);
            lblImgUploadTime.Text = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");

            string fileUrl = $"/Uploads/{folderName}/{HttpUtility.UrlEncode(fileName)}";
            imgFileLink.HRef = fileUrl;
            imgFileLink.InnerText = fileName;

            imageInfoBox.Visible = true;
        }
    }

    private string FormatFileSize(long bytes)
    {
        string[] sizes = { "B", "KB", "MB", "GB" };
        int order = 0;
        double size = bytes;

        while (size >= 1024 && order < sizes.Length - 1)
        {
            order++;
            size = size / 1024;
        }

        return $"{size:0.##} {sizes[order]}";
    }

    protected void ValidateDocumentType(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        if (!fileUploadDocument.HasFile)
        {
            args.IsValid = false;
            return;
        }

        string fileExt = Path.GetExtension(fileUploadDocument.FileName).ToLower();
        args.IsValid = fileExt == ".pdf" || fileExt == ".doc" || fileExt == ".docx" ||
                      fileExt == ".xlsx" || fileExt == ".ppt" || fileExt == ".pptx";
    }

    protected void ValidateImageType(object source, System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        if (!fileUploadImage.HasFile)
        {
            args.IsValid = false;
            return;
        }

        string fileExt = Path.GetExtension(fileUploadImage.FileName).ToLower();
        args.IsValid = fileExt == ".jpg" || fileExt == ".jpeg" || fileExt == ".png" || fileExt == ".bmp";
    }
}
