using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.IO.Compression;
using System.Net.NetworkInformation;
using System.Reflection;

namespace highlight_system.Models
{
    public class SinglePanelModels
    {
        public DB_CRUD db = new DB_CRUD();
        public string connMsg = "";

        public List<string> defectCodeList { get; set; }
        public DataTable imgList { get; set; }
        public string message { get; set; }
        public string picDir { get; set; }
        public string[] picList { get; set; }


        public SinglePanelModels()
        {
            if (!db.DBConnect(ref connMsg))
            {
                //Console.WriteLine("connMsg");
                message = connMsg;
            }
            setPicDir();
            setImgList();
            setDefectCodeList();
        }

        public void writeToLog(string message)
        {
            Tool tool = new Tool();
            //string log_path = @"C:\temp\HL_System_WEB_Log.txt";
            string log_path = new Uri(Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase) + @"\HL_System_WEB_Log.txt").LocalPath;
            if (!File.Exists(log_path))
            {
                File.Create(log_path);
            }

            // Write file using StreamWriter  
            using (StreamWriter writer = File.AppendText(log_path))
            {
                writer.WriteLine(DateTime.Now.ToString("yyyy/MM/dd hh:mm:ss") + " " + tool.GetIp_by_underline() + " " + message);
            }
        }

        public void setPicDir()
        {
            Tool tool = new Tool();
            // 會在網頁專案的\bin
            string project_path = Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase);
            //string sub_path = project_path.Substring(0, project_path.IndexOf("\\bin"));
            picDir = new Uri(project_path.Substring(0, project_path.IndexOf("\\bin")) + @"\img\OfflineSingleTemp\" + tool.GetIp_by_underline()).LocalPath;
        }

        public void setDefectCodeList()
        {
            defectCodeList = new List<string>();

            DataTable dt = new DataTable();
            string strSQL = string.Empty;
            strSQL = "SELECT `defect_code` FROM `defect_code_department` WHERE 1 GROUP BY `defect_code` ";
            //执行查询
            db.ExecuteSQL(strSQL, dt);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                defectCodeList.Add(dt.Rows[i]["defect_code"].ToString());
            }
        }

        public void setImgList()
        {
            ////抓mac id
            //NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            //string macid = nics[0].GetPhysicalAddress().ToString();
            //string picList_Dir = @"\\10.16.22.228\HL_System_File\OfflineSingleTemp\" + macid;
            //string picList_Dir = @"\\10.16.22.228\HL_System_File\OfflineSingleTemp\94C6913F94BD";
            //string picList_Dir = @"\\10.16.92.65\HL_System_WEB\img\HL_System_File\OfflineSingleTemp\" + macid;
            //string picList_Dir = @"\\10.16.22.228\HL_System_Web\bin\img\OfflineSingleTemp\94C6913F94BD";

            //string ip = GetIp();

            //string picList_Dir = @"\img\OfflineSingleTemp\" + ip;
            //string project_path = Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase);
            //picList_Dir = new Uri(project_path + picList_Dir).LocalPath;

            //bool status = connectState(picList_Dir);


            DataTable dt_imgList = new DataTable();

            dt_imgList.Columns.Add("fileName", typeof(String));
            dt_imgList.Columns.Add("imgSource", typeof(String));
            dt_imgList.Columns.Add("Model", typeof(String));
            dt_imgList.Columns.Add("Lot", typeof(String));
            dt_imgList.Columns.Add("Piece", typeof(String));
            dt_imgList.Columns.Add("DefectCode", typeof(String));
            dt_imgList.Columns.Add("Datetime", typeof(String));

            if (!Directory.Exists(picDir))
            {
                imgList = dt_imgList;
                return;
            }

            DataRow dr;
            string[] picList = Directory.GetFiles(picDir, "*.png");
            string[] strSplitTemp;
            // 取得server中圖片列表
            foreach (string f in picList)
            {
                dr = dt_imgList.NewRow();
                string fName = f.Substring(picDir.Length + 1);
                dr["fileName"] = fName;
                dr["imgSource"] = f;
                strSplitTemp = fName.Split(new char[2] { '_', '.' });
                dr["Lot"] = strSplitTemp[0];
                dr["Piece"] = int.Parse(strSplitTemp[strSplitTemp.Length - 2]);
                // 取得Defect code字串長度
                int defectCodeLength = fName.Length - strSplitTemp[strSplitTemp.Length - 1].Length - strSplitTemp[strSplitTemp.Length - 2].Length - strSplitTemp[0].Length - 3;
                dr["DefectCode"] = fName.Substring(dr["Lot"].ToString().Length + 1, defectCodeLength);
                // 取得檔案最後修改時間
                dr["Datetime"] = new FileInfo(f).LastWriteTime.ToString();
                dt_imgList.Rows.Add(dr);
            }


            imgList = dt_imgList;

            if (dt_imgList.Rows.Count > 0)
            {
                //writeToLog("讀取圖檔列表成功! 檔案數量: " + dt_imgList.Rows.Count);
            }
            else
            {
                //writeToLog("無任何圖檔!");
            }
        }

        // 透過web service建立單片raw data
        public int createSinglePanelData(string station, string lot, string piece_num)
        {
            string[] pieces = piece_num.Split(',');
            if (pieces.Length < 1)
            {
                writeToLog("沒有選擇片號");
                message = "沒有選擇片號";
                return 0;
            }
            //抓mac id
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            //Debug.WriteLine(nics(0).GetPhysicalAddress.ToString)
            string macid = nics[0].GetPhysicalAddress().ToString();
            string singlePanelData_path;
            string tempText;
            bool write_flag = false;
            bool status = false;
            Tool tool = new Tool();

            List<string> fileNames, rawData_paths = new List<string>();

            int num;

            try
            {
                //連線共享資料夾
                //status = connectState(@"\\10.16.22.228\HL_System_File\CommonPanelFileBackup");
                if (macid != "1C98EC1A6473")  //不是K9伺服器
                {
                    status = connectState(@"\\10.16.22.228\HL_System_File");

                    if (!status)
                    {
                        writeToLog(@"\\10.16.22.228\HL_System_File 連線失敗!");
                        return 0;
                    }
                    fileNames = tool.getFileNameByKeyword(@"\\10.16.22.228\HL_System_File\CommonPanelFileBackup\" + station + "\\", lot);
                    singlePanelData_path = @"\\10.16.22.228\HL_System_File\CommonPanelFileSinglePanel\" + station + "\\";
                    foreach (string fi in fileNames)
                    {
                        rawData_paths.Add(@"\\10.16.22.228\HL_System_File\CommonPanelFileBackup\" + station + "\\" + fi);
                    }
                }
                else
                {
                    fileNames = tool.getFileNameByKeyword(@"D:\HL_System_File\CommonPanelFileBackup\" + station + "\\", lot);
                    singlePanelData_path = @"D:\HL_System_File\CommonPanelFileSinglePanel\" + station + "\\";
                    foreach (string fi in fileNames)
                    {
                        rawData_paths.Add(@"D:\HL_System_File\CommonPanelFileBackup\" + station + "\\" + fi);
                    }
                }
                

                foreach(string rawData in rawData_paths)
                {
                    if (!File.Exists(rawData))
                    {
                        //Debug.WriteLine(rawData_path + ":raw data讀取失敗");
                        writeToLog(rawData + " 讀取失敗");
                        message = "raw data讀取失敗";
                        return 0;
                    }

                    // 儲存目的地  ex: \\10.16.22.228\HL_System_File\CommonPanelFileSinglePanel\AVI\94C6913F94BD
                    if (!Directory.Exists(singlePanelData_path))
                    {
                        Directory.CreateDirectory(singlePanelData_path);
                    }
                    else
                    {
                        tool.deleteDirectory(singlePanelData_path);
                        Directory.CreateDirectory(singlePanelData_path);
                    }

                    // 開始讀取指定片號，與寫入單片raw data
                    for (int i = 0; i < pieces.Length; i++)
                    {
                        // 跳過空字串
                        if (string.IsNullOrEmpty(pieces[i].Trim())) continue;
                        if(!int.TryParse(pieces[i].Trim(), out num))
                        {
                            message = "[" + pieces[i].Trim() + "]格式有誤!";
                            return 0;
                        }

                        StreamReader readtext = new StreamReader(rawData);
                        StreamWriter writetext = new StreamWriter(singlePanelData_path + lot + "_" + pieces[i].Trim() + ".txt");

                        // 讀取寫入此lot的基本資訊
                        while ((tempText = readtext.ReadLine()) != null)
                        {
                            if (tempText[0] == '[') break;
                            writetext.WriteLine(tempText);
                        }

                        string[] tempSplit;
                        string split_word;
                        write_flag = false;
                        while (tempText != null)
                        {
                            if (tempText[0] == '[')
                            {
                                // 進到此if(= '[')判斷裡面，若write_flag為true，表示此片號已經寫入完成，直接break不必繼續讀檔
                                if (write_flag) break;
                                tempSplit = tempText.Split('_');
                                tempSplit = tempSplit[tempSplit.Length - 1].Split(']');
                                split_word = tempSplit[0];
                                // 找到片號
                                if (int.Parse(split_word) == int.Parse(pieces[i]))
                                {
                                    write_flag = true;
                                }
                                else
                                {
                                    write_flag = false;
                                }
                            }
                            // 找到片號並寫入
                            if (write_flag)
                            {
                                writetext.WriteLine(tempText);
                            }

                            tempText = readtext.ReadLine();
                        }

                        readtext.Close();
                        writetext.Close();
                        
                        // 完全沒寫到，表示此批號沒有該片號資料
                        if (!write_flag)
                        {
                            writeToLog(rawData + " 沒有板號 " + pieces[i].Trim());
                            message = rawData + " 沒有板號 " + pieces[i].Trim();
                            //return 0;
                        }
                    }

                }
                
            }
            catch (Exception ex)
            {
                //Debug.WriteLine(rawData_path + "資料存取失敗", ex.ToString());
                writeToLog("資料存取失敗 " + ex.ToString());
                message = "raw data資料存取失敗";
                return 0;
            }


            writeToLog("單片raw data擷取成功!");
            message = "raw data資料存取成功!";
            return 1;
        }


        // 執行單片畫圖，存放路徑預設在 C:\temp\HL_System_File\OfflineSingleTemp
        public int drawingSinglePanel(string station, string lot, string piece_num, string defect_code)
        {
            Tool tool = new Tool();
            //抓mac id
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            //Debug.WriteLine(nics(0).GetPhysicalAddress.ToString)
            string macid = nics[0].GetPhysicalAddress().ToString();
            string ip = tool.GetIp_by_underline();
            string singlePanelData_path;
            string offlinedata_path;

            if (macid == "1C98EC1A6473") //K9伺服器
            {
                singlePanelData_path = @"D:\HL_System_File\CommonPanelFileSinglePanel\" + station + "\\";
                offlinedata_path = @"D:\HL_System_File\OfflineSingleTemp\" + tool.GetIp_by_underline();
            }
            else
            {
                singlePanelData_path = @"\\10.16.22.228\HL_System_File\CommonPanelFileSinglePanel\" + station + "\\";
                offlinedata_path = @"\\10.16.22.228\HL_System_File\OfflineSingleTemp\" + tool.GetIp_by_underline();
            }

            //建立server端 OfflineSingleTemp 路徑 若存在則刪除重建
            try
            {
                if (!Directory.Exists(singlePanelData_path))
                {
                    writeToLog(singlePanelData_path + "路徑不存在");
                    message = "伺服器圖片路徑不存在";
                    return 0;
                }
                if (!Directory.Exists(offlinedata_path))
                {
                    DirectoryInfo di = Directory.CreateDirectory(offlinedata_path);
                }
                else
                {
                    tool.deleteDirectory(offlinedata_path);
                    Directory.CreateDirectory(offlinedata_path);
                }
            } catch (Exception ex)
            {
                //Debug.WriteLine(offlinedata_path + "建資料夾失敗", ex.ToString());
                writeToLog(offlinedata_path + "建資料夾失敗 " + ex.ToString());
                message = "伺服器圖片建資料夾失敗";
                return 0;
            }

            // call web service 進行畫圖
            ServiceReferencePlot.SinglePanelPlotSoapClient ws = new ServiceReferencePlot.SinglePanelPlotSoapClient();
            ws.InnerChannel.OperationTimeout = new TimeSpan(0, 4, 30);

            bool result = false;
            string sourceDir = offlinedata_path.Trim();
            string[] piece_list = piece_num.Split(',');

            // 開始畫單片
            try
            {
                result = ws.Plot_SinglePanel(station, tool.GetIp_by_underline(), lot, piece_num, defect_code);
            }
            catch (Exception ex)
            {
                ws.Close();
                //Debug.WriteLine("server 畫圖需求逾時");
                writeToLog("server 畫圖需求逾時" + ex.ToString());
                message = "server 畫圖需求逾時";
                return 0;
            }
            // 延遲一些時間，讓畫圖完成與存檔
            //System.Threading.Thread.Sleep(1000);

            if (result) //若web service 回傳true 則去抓圖
            {

                try
                {
                    // 判斷存檔路徑是否存在
                    if (!Directory.Exists(picDir))
                    {
                        Directory.CreateDirectory(picDir);
                    }
                    else
                    {
                        tool.deleteDirectory(picDir);
                        Directory.CreateDirectory(picDir);
                    }

                    picList = Directory.GetFiles(sourceDir, "*.png");
                    if (picList.Length < 1)
                    {
                        writeToLog("server 畫圖成功，但沒有產生圖檔!? 批號[" + lot + "] 片號[" + piece_num + "]  圖檔路徑 " + sourceDir);
                        message = "畫圖指令完成! 沒有產生圖片，因批號[" + lot + "] 片號[" + piece_num + "] 沒有Defect code[" + defect_code + "]";
                        return 0;
                    }

                    // 讓前面畫圖程序緩衝一下，避免下一步複製檔案時失敗
                    //System.Threading.Thread.Sleep(1000);

                    foreach (string f in picList)
                    {
                        string fName = f.Substring(sourceDir.Length + 1);
                        //File.Copy(Path.Combine(sourceDir, fName), Path.Combine(picDir, fName));
                        // Resizing the images
                        Image imgPhoto = Image.FromFile(f);
                        Bitmap bitmap = ResizeImage(imgPhoto, imgPhoto.Width / 3, imgPhoto.Height / 3);
                        bitmap.Save(Path.Combine(picDir, fName), System.Drawing.Imaging.ImageFormat.Png);
                    }

                    // 壓縮檔案存在server
                    ZipFile.CreateFromDirectory(picDir, picDir + "\\singlePanel.zip");

                }
                catch (Exception ex)
                {
                    Debug.WriteLine(ex.ToString());
                    //writeToLog(ex.ToString());
                }
            }
            else
            {
                //Debug.WriteLine("server 畫圖失敗");
                writeToLog("server 畫圖失敗! 批號[" + lot + "] 片號[" + piece_num.Trim() + "] Defect code[" + defect_code + "]");
                message = "畫圖失敗!";
            }

            //刪除暫存的資料夾， 2021/12/22 因畫完圖要存放在此目錄前就會先刪除，故此處無須再刪除
            //deleteDirectory(offlinedata_path);
            
            writeToLog("server 畫圖完成! 批號[" + lot + "] 片號[" + piece_num + "] 存檔路徑 " + picDir);
            message = "";
            return 1;
        }
        

        public int drawingAllPanels(string station, string lot, string defect_code)
        {
            Tool tool = new Tool();
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            string macid = nics[0].GetPhysicalAddress().ToString();
            string ip = tool.GetIp_by_underline();
            string singlePanelData_path;
            string offlinedata_path;

            if (macid == "1C98EC1A6473") //K9伺服器
            {
                singlePanelData_path = @"D:\HL_System_File\CommonPanelFileSinglePanel\" + station + "\\";
                offlinedata_path = @"D:\HL_System_File\OfflineSingleTemp\" + tool.GetIp_by_underline();
            }
            else
            {
                singlePanelData_path = @"\\10.16.22.228\HL_System_File\CommonPanelFileSinglePanel\" + station + "\\";
                offlinedata_path = @"\\10.16.22.228\HL_System_File\OfflineSingleTemp\" + tool.GetIp_by_underline();
            }

            //建立server端 OfflineSingleTemp 路徑 若存在則刪除重建
            try
            {
                if (!Directory.Exists(singlePanelData_path))
                {
                    writeToLog(singlePanelData_path + "路徑不存在");
                    message = "伺服器圖片路徑不存在";
                    return 0;
                }
                if (!Directory.Exists(offlinedata_path))
                {
                    DirectoryInfo di = Directory.CreateDirectory(offlinedata_path);
                }
                else
                {
                    tool.deleteDirectory(offlinedata_path);
                    Directory.CreateDirectory(offlinedata_path);
                }
            }
            catch (Exception ex)
            {
                writeToLog(offlinedata_path + "建資料夾失敗 " + ex.ToString());
                message = "伺服器圖片建資料夾失敗";
                return 0;
            }

            // call web service 進行畫圖
            ServiceReferencePlot.SinglePanelPlotSoapClient ws = new ServiceReferencePlot.SinglePanelPlotSoapClient();
            ws.InnerChannel.OperationTimeout = new TimeSpan(0, 10, 0);

            bool result = false;
            string sourceDir = offlinedata_path.Trim();

            // 開始畫單片
            try
            {
                result = ws.Plot(station, tool.GetIp_by_underline(), lot, defect_code);
            }
            catch (Exception ex)
            {
                ws.Close();
                //Debug.WriteLine("server 畫圖需求逾時");
                writeToLog("server 畫圖需求逾時" + ex.ToString());
                message = "server 畫圖需求逾時";
                return 0;
            }

            if (result) //若web service 回傳true 則去抓圖
            {

                try
                {
                    // 判斷存檔路徑是否存在
                    if (!Directory.Exists(picDir))
                    {
                        Directory.CreateDirectory(picDir);
                    }
                    else
                    {
                        tool.deleteDirectory(picDir);
                        Directory.CreateDirectory(picDir);
                    }

                    // 讓前面畫圖程序緩衝一下，避免下一步複製檔案時失敗
                    System.Threading.Thread.Sleep(1000);

                    picList = Directory.GetFiles(sourceDir, "*.png");
                    foreach (string f in picList)
                    {
                        string fName = f.Substring(sourceDir.Length + 1);
                        //File.Copy(Path.Combine(sourceDir, fName), Path.Combine(picDir, fName), true);
                        // Resizing the images
                        Image imgPhoto = Image.FromFile(f);
                        Bitmap bitmap = ResizeImage(imgPhoto, imgPhoto.Width / 3, imgPhoto.Height / 3);
                        bitmap.Save(Path.Combine(picDir, fName), System.Drawing.Imaging.ImageFormat.Png);
                    }

                    // 壓縮檔案存在server
                    System.IO.Compression.ZipFile.CreateFromDirectory(picDir, picDir + "\\singlePanel.zip");

                }
                catch (Exception ex)
                {
                    //Debug.WriteLine(ex.ToString());
                    message = "server 搬運圖片至專案發生錯誤";
                    //writeToLog(ex.ToString());
                }
            }
            else
            {
                //Debug.WriteLine("server 畫圖失敗");
                writeToLog("server 畫圖失敗! 批號[" + lot + "]  Defect code[" + defect_code + "]");
                message = "畫圖失敗!";
                return 0;
            }
            writeToLog("server 畫圖完成! 批號[" + lot + "]  存檔路徑 " + picDir);
            message = "";
            return 1;
        }
        
        public static bool connectState(string path)
        {
            return connectState(path, "", "");
        }
        /// <summary>
        /// 連線遠端共享資料夾
        /// </summary>
        /// <param name="path">遠端共享資料夾的路徑</param>
        /// <param name="userName">使用者名稱</param>
        /// <param name="passWord">密碼</param>
        /// <returns></returns>
        public static bool connectState(string path, string userName, string passWord)
        {
            bool Flag = false;
            Process proc = new Process();
            try
            {
                proc.StartInfo.FileName = "cmd.exe";
                proc.StartInfo.UseShellExecute = false;
                proc.StartInfo.RedirectStandardInput = true;
                proc.StartInfo.RedirectStandardOutput = true;
                proc.StartInfo.RedirectStandardError = true;
                proc.StartInfo.CreateNoWindow = true;
                proc.Start();
                string dosLine = "net use " + path + " " + passWord + " /user:" + userName;
                proc.StandardInput.WriteLine(dosLine);
                proc.StandardInput.WriteLine("exit");
                while (!proc.HasExited)
                {
                    proc.WaitForExit(1000);
                }
                string errormsg = proc.StandardError.ReadToEnd();
                proc.StandardError.Close();
                if (string.IsNullOrEmpty(errormsg))
                {
                    Flag = true;
                }
                else
                {
                    throw new Exception(errormsg);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                proc.Close();
                proc.Dispose();
            }
            return Flag;
        }


        public string getDefectCodeNumber(string site, string defectName)
        {
            string server_path = @"\\10.16.22.228\HL_System_File\SPEC\"+site+ @"\DefectCode.txt";
            string local_path = @"D:/HL_System_File/SPEC/" + site + "/DefectCode.txt";

            using (StreamReader file = new StreamReader(server_path, System.Text.Encoding.Default))
            {
                string ln;

                while ((ln = file.ReadLine()) != null)
                {
                    //Console.WriteLine(ln);
                    string[] strSplit = ln.Split(new char[1]{' '});
                    if(strSplit[0].Equals(defectName.Trim()))
                    {
                        return strSplit[strSplit.Length - 1].Split(new char[1] { ',' })[0];
                    }
                    else
                    {
                        continue;
                    }
                    
                }
                file.Close();
            }

            return "";
        }

        /// <summary>
        /// Resize the image to the specified width and height.
        /// </summary>
        /// <param name="image">The image to resize.</param>
        /// <param name="width">The width to resize to.</param>
        /// <param name="height">The height to resize to.</param>
        /// <returns>The resized image.</returns>
        public static Bitmap ResizeImage(Image image, int width, int height)
        {
            var destRect = new Rectangle(0, 0, width, height);
            var destImage = new Bitmap(width, height);

            destImage.SetResolution(image.HorizontalResolution, image.VerticalResolution);

            using (var graphics = Graphics.FromImage(destImage))
            {
                graphics.CompositingMode = CompositingMode.SourceCopy;
                graphics.CompositingQuality = CompositingQuality.HighQuality;
                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
                graphics.SmoothingMode = SmoothingMode.HighQuality;
                graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;

                using (var wrapMode = new ImageAttributes())
                {
                    wrapMode.SetWrapMode(WrapMode.TileFlipXY);
                    graphics.DrawImage(image, destRect, 0, 0, image.Width, image.Height, GraphicsUnit.Pixel, wrapMode);
                }
            }

            return destImage;
        }

    }
}