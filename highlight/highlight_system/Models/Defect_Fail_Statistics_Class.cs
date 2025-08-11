/*
 * 2022/5/13  Isaac撰寫 
 */

using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Web;

namespace highlight_system.Models
{
    public class Defect_Fail_Statistics_Class
    {
        public DataTable defect_fail_ppm_by_panel_dt;
        public DataTable defect_fail_ppm_by_lot_dt;
        public string error_msg = string.Empty;

        //抓mac id
        NetworkInterface[] _nics;
        string _my_macid;
        // K9 server 的 MAC ID
        public string K9_macid = "1C98EC1A6473";

        public Defect_Fail_Statistics_Class()
        {
            _nics = NetworkInterface.GetAllNetworkInterfaces();
            _my_macid = _nics[0].GetPhysicalAddress().ToString();

            DataColumn panel_dc1 = new DataColumn("panel_no", typeof(int));
            DataColumn panel_dc2 = new DataColumn("defect_fail_count", typeof(int));
            DataColumn panel_dc3 = new DataColumn("defect_fail_ppm", typeof(int));
            DataColumn lot_dc1 = new DataColumn("lot_number", typeof(string));
            DataColumn lot_dc2 = new DataColumn("defect_fail_count", typeof(int));
            DataColumn lot_dc3 = new DataColumn("defect_fail_ppm", typeof(int));

            //  Panel: for DataTable defect_fail_ppm_by_panel_dt
            defect_fail_ppm_by_panel_dt = new DataTable("panel");
            this.defect_fail_ppm_by_panel_dt.Columns.Add(panel_dc1);
            this.defect_fail_ppm_by_panel_dt.Columns.Add(panel_dc2);
            this.defect_fail_ppm_by_panel_dt.Columns.Add(panel_dc3);

            //  Lot: for DataTable defect_fail_ppm_by_lot_dt
            defect_fail_ppm_by_lot_dt = new DataTable("lot");
            this.defect_fail_ppm_by_lot_dt.Columns.Add(lot_dc1);
            this.defect_fail_ppm_by_lot_dt.Columns.Add(lot_dc2);
            this.defect_fail_ppm_by_lot_dt.Columns.Add(lot_dc3);
        }
        public DataTable Defect_Fail_PPM_Count_By_Panel(string station_name, string lot_number, string defect_code_name)
        {
            // 缺點名稱轉缺點碼出來(比較用)
            string[] defect_code_number_sArray = get_defect_code_number(station_name, defect_code_name);

            // By Panel 統計
            this.defect_fail_ppm_by_panel_dt = defect_fail_count_ppm_by_panel(station_name, lot_number, defect_code_number_sArray);

            return this.defect_fail_ppm_by_panel_dt;
        }
        public DataTable Defect_Fail_PPM_Count_By_Lot(string station_name, List<string> lot_number_list, string defect_code_name)
        {
            // 缺點名稱轉缺點碼出來(比較用)
            string[] defect_code_number_sArray = get_defect_code_number(station_name, defect_code_name);

            // By Panel 統計
            this.defect_fail_ppm_by_lot_dt = defect_fail_count_ppm_by_lot(station_name, lot_number_list, defect_code_number_sArray);

            return this.defect_fail_ppm_by_lot_dt;
        }

        string[] get_defect_code_number(string station_name, string defect_code_name)
        {
            string spec_file_path;
            if(_my_macid == K9_macid)
            {
                spec_file_path = string.Format(@"D:\HL_System_File\SPEC\{0}\DefectCode.txt", station_name);
            }
            else
            {
                spec_file_path = string.Format(@"\\10.16.22.228\HL_System_File\SPEC\{0}\DefectCode.txt", station_name);
            }

            if (File.Exists(spec_file_path) == false) //確認檔案是否存在
            {
                throw new ArgumentException(String.Format("檔案缺失: spec_file_path = {0}", spec_file_path));
            }
            string[] defect_code_number_sArray = new string[16];
            string[] sArray;
            using (FileStream fs = new FileStream(spec_file_path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite | FileShare.Delete)) //FileShare.ReadWrite: 讀寫共用，開啟檔案後允許其他程序對檔案進行讀和寫操作；
            {
                using (StreamReader sr = new StreamReader(fs, Encoding.Default))
                {
                    while (!sr.EndOfStream)
                    {
                        var line = sr.ReadLine(); //Short AOI, 103,104,105,124,
                        sArray = line.Split(' '); // ["Short","AOI,","103,104,105,124,"]
                        if (Array.Exists(sArray, x => x == defect_code_name))
                        {
                            defect_code_number_sArray = sArray[2].Split(','); //"103,104,105,124,"
                            break;
                        }
                    }
                }
            }
            return defect_code_number_sArray;
        }

        DataTable defect_fail_count_ppm_by_panel(string station_name, string lot_number, string[] defect_code_number_sArray)
        {
            this.defect_fail_ppm_by_panel_dt.Clear();
            List<int> panel_no_list = new List<int>();
            int[] fail_count_by_panel_Iarray = new int[100];

            int EACH_X_PIECE = 0;
            int EACH_Y_PIECE = 0;
            string lot_file_path;
            if (_my_macid == K9_macid)
            {
                lot_file_path = string.Format(@"D:\HL_System_File\CommonPanelFileBackup\{0}\{1}.txt", station_name, lot_number);
            }
            else
            {
                lot_file_path = string.Format(@"\\10.16.22.228\HL_System_File\CommonPanelFileBackup\{0}\{1}.txt", station_name, lot_number);
            }

            if (File.Exists(lot_file_path) == false) //確認檔案是否存在
            {
                throw new ArgumentException(String.Format("檔案缺失: lot_file_path = {0}", lot_file_path));
            }

            int panel_no = 0;
            // 記錄每一片所包含的defect fail count
            string[] sArray;
            using (FileStream fs = new FileStream(lot_file_path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite | FileShare.Delete)) //FileShare.ReadWrite: 讀寫共用，開啟檔案後允許其他程序對檔案進行讀和寫操作；
            {
                using (StreamReader sr = new StreamReader(fs, Encoding.Default))
                {
                    // Informatio 區段
                    for (int i = 0; i < 12; i++)
                    {
                        var line = sr.ReadLine();
                        sArray = line.Split('='); // ["EACH X PIECE","80"]
                        if (sArray[0].Contains("EACH X PIECE"))
                        {
                            EACH_X_PIECE = int.Parse(sArray[1]); //"80"
                        }
                        else if (sArray[0].Contains("EACH Y PIECE"))
                        {
                            EACH_Y_PIECE = int.Parse(sArray[1]); //"80"
                            break;
                        }
                    }

                    //# Result 區段
                    //# Case1: [D170223005_1]
                    //# Case2: X:2 Y:11=111
                    while (!sr.EndOfStream)
                    {
                        var line = sr.ReadLine(); //EACH X PIECE=80

                        if (line[0] == '[') // Case1: [D170223005_1]
                        {
                            sArray = line.Split(']', '_'); // ["[D170223005", "1", "]"]
                            panel_no = int.Parse(sArray[1]); //"1" 第1片
                            panel_no_list.Add(panel_no);
                            fail_count_by_panel_Iarray[panel_no - 1] = 0; // initial
                        }
                        else if (line[0] == 'X')// Case: X:2 Y:11=111
                        {
                            sArray = line.Split('='); // ["X:2 Y:11", "111"]
                            if (Array.Exists(defect_code_number_sArray, x => x == sArray[1]))
                            {
                                fail_count_by_panel_Iarray[panel_no - 1] += 1;
                            }
                        }
                    }
                }
            }

            // 換算PPM
            int total_unit_count_of_panel = EACH_X_PIECE * EACH_Y_PIECE;
            if (total_unit_count_of_panel == 0) //避免沒有Total Size
            {
                throw new ArgumentException(String.Format("Lot:{0}, Total Panel Size is 0.", lot_number));
            }
            foreach (int panel_num in panel_no_list)
            {
                DataRow workRow = this.defect_fail_ppm_by_panel_dt.NewRow();
                workRow["panel_no"] = panel_num;
                workRow["defect_fail_count"] = fail_count_by_panel_Iarray[panel_num - 1];
                workRow["defect_fail_ppm"] = (fail_count_by_panel_Iarray[panel_num - 1] / (double)total_unit_count_of_panel) * 1000000; //換算PPM
                this.defect_fail_ppm_by_panel_dt.Rows.Add(workRow); // 將資料插入新的資料列之後，會使用 add 方法將資料列加入至
            }

            return defect_fail_ppm_by_panel_dt;
        }

        DataTable defect_fail_count_ppm_by_lot(string station_name, List<string> lot_number_list, string[] defect_code_number_sArray)
        {
            this.defect_fail_ppm_by_lot_dt.Clear();
            List<int> fail_count_ppm_by_lot_list = new List<int>();

            int total_unit_count_of_panel = 0;
            int EACH_X_PIECE = 0;
            int EACH_Y_PIECE = 0;

            foreach (string lot_number in lot_number_list)
            {
                string lot_file_path;
                if (_my_macid == K9_macid)
                {
                    lot_file_path = string.Format(@"D:\HL_System_File\CommonPanelFileBackup\{0}\{1}.txt", station_name, lot_number);
                }
                else
                {
                    lot_file_path = string.Format(@"\\10.16.22.228\HL_System_File\CommonPanelFileBackup\{0}\{1}.txt", station_name, lot_number);
                }

                if (File.Exists(lot_file_path) == false) //確認檔案是否存在
                {
                    throw new ArgumentException(String.Format("檔案缺失: lot_file_path = {0}", lot_file_path));
                }

                // 記錄每一片所包含的defect fail count
                string[] sArray;
                using (FileStream fs = new FileStream(lot_file_path, FileMode.Open, FileAccess.Read, FileShare.ReadWrite | FileShare.Delete)) //FileShare.ReadWrite: 讀寫共用，開啟檔案後允許其他程序對檔案進行讀和寫操作；
                {
                    using (StreamReader sr = new StreamReader(fs, Encoding.Default))
                    {
                        // Informatio 區段
                        for (int i = 0; i < 12; i++)
                        {
                            var line = sr.ReadLine();
                            if (total_unit_count_of_panel != 0)
                            { continue; }

                            sArray = line.Split('='); // ["EACH X PIECE","80"]
                            if (sArray[0].Contains("EACH X PIECE"))
                            {
                                EACH_X_PIECE = int.Parse(sArray[1]); //"80"
                            }
                            else if (sArray[0].Contains("EACH Y PIECE"))
                            {
                                EACH_Y_PIECE = int.Parse(sArray[1]); //"80"
                                total_unit_count_of_panel = EACH_X_PIECE * EACH_Y_PIECE;
                                break;
                            }
                        }

                        //# Result 區段
                        //# Case1: [D170223005_1]
                        //# Case2: X:2 Y:11=111
                        int panel_count = 0;
                        int fail_count = 0;
                        while (!sr.EndOfStream)
                        {
                            var line = sr.ReadLine(); //EACH X PIECE=80
                            if (line[0] == '[') // Case1: [D170223005_1]
                            {
                                panel_count += 1;
                            }
                            else if (line[0] == 'X')// Case: X:2 Y:11=111
                            {
                                sArray = line.Split('='); // ["X:2 Y:11", "111"]
                                if (Array.Exists(defect_code_number_sArray, x => x == sArray[1]))
                                {
                                    fail_count += 1;
                                }
                            }
                        }
                        if (panel_count == 0) //避免檔案下半段都沒測試結果
                        {
                            this.error_msg = string.Format("Lot:{0}, Panel Qty is 0.", lot_number);
                            continue;
                        }
                        if (total_unit_count_of_panel == 0) //避免沒有Total Size
                        {
                            throw new ArgumentException(String.Format("Lot:{0}, Total Panel Size is 0.", lot_number));
                        }
                        // 換算PPM
                        DataRow workRow = this.defect_fail_ppm_by_lot_dt.NewRow();
                        workRow["lot_number"] = lot_number;
                        workRow["defect_fail_count"] = fail_count;
                        workRow["defect_fail_ppm"] = ((double)fail_count / (total_unit_count_of_panel * panel_count)) * 1000000; //換算PPM
                        this.defect_fail_ppm_by_lot_dt.Rows.Add(workRow); // 將資料插入新的資料列之後，會使用 add 方法將資料列加入至
                    }
                }
            }

            return defect_fail_ppm_by_lot_dt;
        }
    }
}