using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Web;
using Newtonsoft.Json;

namespace highlight_system.Models
{
    class TrackOut_DataInfo
    {
        private string _PartNum;
        private string _Reivsion;
        private string _MapNum;
        private string _SProdType;
        private string _NumOfLayer;
        private string _LLPiece;
        private string _LPiece;
        private string _ScheduleId;
        private string _IssueLotId;
        private string _StepId;
        private DateTime _TrackOutTime;

        public string StepId
        {
            get { return _StepId; }
            set { _StepId = value; }
        }

        public DateTime TrackOutTime
        {
            get { return _TrackOutTime; }
            set { _TrackOutTime = value; }
        }

        public string ScheduleId
        {
            get { return _ScheduleId; }
            set { _ScheduleId = value; }
        }

        public string IssueLotId
        {
            get { return _IssueLotId; }
            set { _IssueLotId = value; }
        }

        public string PartNum
        {
            get { return _PartNum; }
            set { _PartNum = value; }
        }

        public string Reivsion
        {
            get { return _Reivsion; }
            set { _Reivsion = value; }
        }

        public string MapNum
        {
            get { return _MapNum; }
            set { _MapNum = value; }
        }

        public string SProdType
        {
            get { return _SProdType; }
            set { _SProdType = value; }
        }

        public string NumOfLayer
        {
            get { return _NumOfLayer; }
            set { _NumOfLayer = value; }
        }

        public string LLPiece
        {
            get { return _LLPiece; }
            set { _LLPiece = value; }
        }

        public string LPiece
        {
            get { return _LPiece; }
            set { _LPiece = value; }
        }
    }

    public class Trigger_Lot_Class
    {
        public string error_msg;

        public Trigger_Lot_Class()
        {
            // Initial
        }

        // 目的: 仿照MES過帳觸發,去2D Server內把資料夾檔案複製至K9 Server HL system分析.
        // 輸入1 站別碼: 9862 (string)
        // 輸入2 批號: L220519051 (string)
        // 回傳 struct 1 狀態: true/flase (bool)
        // 回傳 struct 2 訊息: message (string)
        public bool AOI_Trigger_Lot_Result_to_HLSystem(string step_id, string lot_number, string part_number, string version)
        {
            bool status = false;
            error_msg = string.Empty;

            if (!AOI_input_para_exist(step_id, lot_number, part_number, version))
            {
                return status;
            }
            /*AOI Station
             輸入1: step_id
             輸入2: lot_number
             輸入3: part_number
             輸入4: version*/

            TrackOut_DataInfo MyFile;
            string Json;
            //string FA_ResultMessage;
            FA_AOI.AOIService FA;
            MyFile = new TrackOut_DataInfo();
            try
            {
                FA = new FA_AOI.AOIService();
                MyFile = new TrackOut_DataInfo();
                MyFile.ScheduleId = lot_number;
                MyFile.IssueLotId = lot_number;
                MyFile.LLPiece = "";
                MyFile.LPiece = "";
                MyFile.MapNum = "";
                MyFile.NumOfLayer = "";
                MyFile.PartNum = part_number;
                MyFile.Reivsion = version;
                MyFile.SProdType = "";
                MyFile.StepId = step_id;
                MyFile.TrackOutTime = DateTime.Now.Date;
                Json = JsonConvert.SerializeObject(MyFile);

                string FA_ResultMessage = string.Empty;
                if (FA.AOITransferTRD(Json, ref FA_ResultMessage) == false)
                {
                    error_msg = FA_ResultMessage;
                    return status;
                }
            }
            catch (Exception Ex)
            {
                error_msg = Ex.ToString();
                return status;
            }
            return true;
        }
        bool AOI_input_para_exist(string step_id, string lot_number, string part_number, string version)
        {
            if (string.IsNullOrEmpty(step_id))
            {
                error_msg = String.Format("輸入站別碼空值: Step ID = {0}.", step_id);
                return false;
            }
            if (string.IsNullOrEmpty(lot_number))
            {
                error_msg = String.Format("輸入批號空值: Lot Number = {0}.", lot_number);
                return false;
            }
            if (string.IsNullOrEmpty(part_number))
            {
                error_msg = String.Format("輸入料號空值: Part Number = {0}.", part_number);
                return false;
            }
            if (string.IsNullOrEmpty(version))
            {
                error_msg = String.Format("輸入版序空值: Version = {0}.", version);
                return false;
            }
            return true;
        }
        bool AVI_TST_input_para_exist(string station_name, string lot_number)
        {
            if (string.IsNullOrEmpty(station_name))
            {
                error_msg = String.Format("輸入站別名稱空值: Station Name = {0}.", station_name);
                return false;
            }
            if (string.IsNullOrEmpty(lot_number))
            {
                error_msg = String.Format("輸入批號空值: Lot Number = {0}.", lot_number);
                return false;
            }
            return true;
        }

        public bool AVI_TST_Trigger_Lot_Result_to_HLSystem(string station_name, string lot_number)
        {
            bool status = false;
            error_msg = string.Empty;
            if (!AVI_TST_input_para_exist(station_name, lot_number))
            {
                return status;
            }


            // AVI and TST Stations
            // 輸入1:lot_number
            if (station_name.ToLower() == "avi" || station_name.ToLower() == "tst")
            {
                // 確認檔案存在 on 2D server
                // 2D server 測試結果資料夾路徑: \\10.16.10.51\filedata\22\05\19\L220519051
                string TwoD_dir_path = string.Format(@"\\10.16.10.51\filedata\{0}\{1}\{2}\{3}", lot_number.Substring(1, 2), lot_number.Substring(3, 2), lot_number.Substring(5, 2), lot_number);
                if (Directory.Exists(TwoD_dir_path))
                {
                    string K9Server_TwoD_dir_path = string.Format(@"D:\HL_System_File\RawLotDatabase\{0}\{1}", station_name, lot_number);
                    try
                    {
                        Directory.CreateDirectory(K9Server_TwoD_dir_path);//創建目的資料夾
                        CopyDireToDire(TwoD_dir_path, K9Server_TwoD_dir_path);//複製2D結果檔案
                        status = true;
                        return status;
                    }
                    catch (Exception ex)
                    {
                        error_msg = String.Format("複製2D資料夾失敗: Path = {0},{1}.", K9Server_TwoD_dir_path, ex.ToString());
                        return status;
                    }
                }
                else
                {
                    // 回傳資料夾不存在
                    error_msg = String.Format("2D資料夾不存在: 2D directory path = {0}.", TwoD_dir_path);
                    return status;
                }
            }
            return true;
        }


        public static void CopyDireToDire(string sourceDir, string destDir)
        {
            DirectoryInfo sourceDireInfo = new DirectoryInfo(sourceDir);
            List<FileInfo> fileList = new List<FileInfo>();
            GetFileList(sourceDireInfo, fileList);
            List<DirectoryInfo> dirList = new List<DirectoryInfo>();
            GetDirList(sourceDireInfo, dirList);
            foreach (DirectoryInfo dir in dirList)
            {
                string m = dir.FullName;
                string n = m.Replace(sourceDir, destDir);
                if (!Directory.Exists(n))
                {
                    Directory.CreateDirectory(n);
                }
            }
            foreach (FileInfo fileInfo in fileList)
            {
                string m = fileInfo.FullName;
                string n = m.Replace(sourceDir, destDir);
                File.Copy(m, n, true);
            }
        }
        private static void GetFileList(DirectoryInfo dir, List<FileInfo> fileList)
        {
            fileList.AddRange(dir.GetFiles());
            foreach (DirectoryInfo directory in dir.GetDirectories()) GetFileList(directory, fileList);
        }
        private static void GetDirList(DirectoryInfo dir, List<DirectoryInfo> dirList)
        {
            dirList.AddRange(dir.GetDirectories());
            foreach (DirectoryInfo directory in dir.GetDirectories()) GetDirList(directory, dirList);
        }
    }
}