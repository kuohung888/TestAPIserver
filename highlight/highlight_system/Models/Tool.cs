using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace highlight_system.Models
{
    public class Tool
    {

        // 刪除目錄，含底下所有檔案一併刪除
        public bool deleteDirectory(string dir)
        {
            foreach (string d in Directory.GetFileSystemEntries(dir))
            {
                if (System.IO.File.Exists(d))
                {
                    FileInfo fi = new FileInfo(d);
                    if (fi.Attributes.ToString().IndexOf("ReadOnly") != -1)
                        fi.Attributes = FileAttributes.Normal;
                    System.IO.File.Delete(d);//直接删除其中的文件   
                }
                else
                    deleteDirectory(d);//遞迴删除子文件夾
            }
            Directory.Delete(dir);//删除已空文件夾

            return true;
        }

        // 取得使用者IP
        public string GetIp_by_underline()
        {
            string ip = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(ip))
            {
                ip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            // 把'.'替換成'_'
            if (ip.IndexOf(".") != -1)
            {
                ip = ip.Replace(".", "_");
            }

            // 把':'替換成'_'
            if (ip.IndexOf(":") != -1)
            {
                ip = ip.Replace(":", "_");
            }

            return ip;
        }

        // 關鍵字搜尋該目錄底下所有符合的檔案
        public List<string> getFileNameByKeyword(string directory, string keyword)
        {
            List<string> fileNames = new List<string>();
            DirectoryInfo di = new DirectoryInfo(directory);

            foreach (var fi in di.GetFiles("*.txt"))
            {
                System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(keyword);
                System.Text.RegularExpressions.Match m = regex.Match(fi.ToString());
                if (m.Success == true)
                {
                    fileNames.Add(fi.Name);
                }
            }


            return fileNames;
        }


        public byte[] GetBytesFromImage(string filename)
        {

            try
            {
                FileStream fs = new FileStream(filename, FileMode.Open, FileAccess.Read);

                int length = (int)fs.Length;

                byte[] image = new byte[length];

                fs.Read(image, 0, length);

                fs.Close();

                return image;
            }
            catch (Exception ex)
            {
                return null;
            }
        }


        public void copyFileTo(string srcPath, string destPath, bool overwrite)
        {
            File.Copy(srcPath, destPath, overwrite);
        }

    }
}