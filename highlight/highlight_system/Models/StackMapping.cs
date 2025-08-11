using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Net.NetworkInformation;
using System.Reflection;

namespace highlight_system.Models
{
    public class StackMapping
    {
        public DataTable imgList = new DataTable();

        public StackMapping()
        {
            imgList.Columns.Add("img_src", typeof(String));
            imgList.Columns.Add("Lot", typeof(String));
            imgList.Columns.Add("FrontBack", typeof(String));
            imgList.Columns.Add("DefectCodeName", typeof(String));

           
        }

        public DataTable getImgList(string site, string lot, string defect_code_name)
        {
            //if (string.IsNullOrEmpty(lot)) return null;
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            string macid = nics[0].GetPhysicalAddress().ToString();
            string directory_pass = "", directory_fail = "";
            List<string> filePath = new List<string>();
            Tool tool = new Tool();
            // 會在網頁專案的\bin\
            string project_path = Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase);
            string localPicDir = new Uri(project_path.Substring(0, project_path.IndexOf("\\bin")) + @"\img\StackingFig\" + tool.GetIp_by_underline()).LocalPath;
            string temp_filename;
            string[] temp_split;

            if (macid == "1C98EC1A6473") //K9伺服器
            {
                directory_pass = @"D:\HL_System_File\StackingFig\" + site + "\\" + lot + "\\Pass\\";
                directory_fail = @"D:\HL_System_File\StackingFig\" + site + "\\" + lot + "\\fail\\";
            }
            else
            {
                directory_pass = @"\\10.16.22.228\HL_System_File\StackingFig\" + site + "\\" + lot + "\\Pass\\";
                directory_fail = @"\\10.16.22.228\HL_System_File\StackingFig\" + site + "\\" + lot + "\\fail\\";
            }

            if(Directory.Exists(directory_pass))
            {
                getFileNameByKeyword(directory_pass, lot + "_" + defect_code_name + ".png", filePath);
                getFileNameByKeyword(directory_pass, lot + "_" + defect_code_name + "_B.Png", filePath);
                getFileNameByKeyword(directory_pass, lot + "_" + defect_code_name + "_T.Png", filePath);
            }
            if(Directory.Exists(directory_fail))
            {
                getFileNameByKeyword(directory_fail, lot + "_" + defect_code_name + ".png", filePath);
                getFileNameByKeyword(directory_fail, lot + "_" + defect_code_name + "_B.Png", filePath);
                getFileNameByKeyword(directory_fail, lot + "_" + defect_code_name + "_T.Png", filePath);
            }

            // 判斷存檔路徑是否存在
            if (!Directory.Exists(localPicDir))
            {
                Directory.CreateDirectory(localPicDir);
            }
            else
            {
                tool.deleteDirectory(localPicDir);
                Directory.CreateDirectory(localPicDir);
            }

            foreach (string path in filePath)
            {
                // 把圖檔複製到網頁專案資料夾中的 img\
                temp_split = path.Split('\\');
                temp_filename = temp_split[temp_split.Length - 1];
                File.Copy(path, Path.Combine(localPicDir, temp_filename), true);

                DataRow dr = imgList.NewRow();
                dr["img_src"] = Path.Combine(localPicDir, temp_filename);
                dr["Lot"] = lot;
                // 拆解是否正背面
                if(path.Contains("_T.Png"))
                {
                    dr["FrontBack"] = "正面";
                }
                else if(path.Contains("_B.Png"))
                {
                    dr["FrontBack"] = "背面";
                }
                else
                {
                    dr["FrontBack"] = "";
                }
                dr["DefectCodeName"] = defect_code_name;
                imgList.Rows.Add(dr);
            }
            
            return imgList;
        }


        // 關鍵字搜尋該目錄底下所有符合的檔案
        private void getFileNameByKeyword(string directory, string keyword, List<string> fileNames)
        {
            DirectoryInfo di = new DirectoryInfo(directory);

            foreach (var fi in di.GetFiles("*.png"))
            {
                if(keyword == fi.Name)
                {
                    fileNames.Add(directory + fi.Name);
                }
                //System.Text.RegularExpressions.Regex regex = new System.Text.RegularExpressions.Regex(keyword);
                //System.Text.RegularExpressions.Match m = regex.Match(fi.ToString());
                //if (m.Success == true)
                //{
                //    fileNames.Add(directory+fi.Name);
                //}
            }
        }


        public List<string> plotMultiLotStack(string site, string defect_code_name, string lot_list)
        {
            string message;
            string path = "", ip = "";
            List<string> result_path;
            List<string> return_path = new List<string>();
            WriteToLog writeToLog = new WriteToLog();
            Tool tool = new Tool();
            // project_path 會在網頁專案的\bin\
            string project_path = Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase);
            string localPicDir = new Uri(project_path.Substring(0, project_path.IndexOf("\\bin")) + @"\img\MultiStackingFig\" + tool.GetIp_by_underline()).LocalPath;
            string temp_filename;
            string[] temp_split;

            // 判斷存檔路徑是否存在
            if (!Directory.Exists(localPicDir))
            {
                Directory.CreateDirectory(localPicDir);
            }
            else
            {
                tool.deleteDirectory(localPicDir);
                Directory.CreateDirectory(localPicDir);
            }

            ServiceReferencePlotMultiLot.MultipleStackMapSoapClient ws = new ServiceReferencePlotMultiLot.MultipleStackMapSoapClient();
            ws.InnerChannel.OperationTimeout = new TimeSpan(0, 4, 30);

            // 開始多批疊圖
            try
            {
                ip = writeToLog.GetIp();
                if(ip=="::1") { ip = "127.0.0.1"; }
                path = Path.Combine(@"D:\HL_System_File\MultiLotStackingFig", ip);
                result_path = ws.plot_multi_lot_stack_map(ip, site, defect_code_name, lot_list, path);
            }
            catch (Exception ex)
            {
                ws.Close();
                //Debug.WriteLine("server 畫圖需求逾時");
                message = "server 畫圖需求逾時";
                return new List<string>();
            }

            // 將畫完的多批疊圖檔案搬至網頁專案 img\
            try
            {
                foreach (string p in result_path)
                {
                    // 把圖檔複製到網頁專案資料夾中的 img\
                    temp_split = p.Split('\\');
                    temp_filename = temp_split[temp_split.Length - 1];
                    File.Copy(p, Path.Combine(localPicDir, temp_filename), true);
                    return_path.Add(Path.Combine(localPicDir, temp_filename));
                }
            }
            catch (Exception ex)
            {
                message = "圖檔從source複製到網頁專案資料夾失敗!";
                return new List<string>();
            }

            return return_path;
        }
        

    }
}