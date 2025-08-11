using highlight_system.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace highlight_system.Controllers
{
    public class AnalysisController : Controller
    {
        Stopwatch sw = new Stopwatch();
        TimeSpan ts2;

        // GET: Analysis
        public ActionResult DefectByPanel()
        {
            ViewBag.Message = "Your single panel page.";
            //抓mac id
            //NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            //string macid = nics[0].GetPhysicalAddress().ToString();
            //ViewBag.TestMsg = new Uri(Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase)).LocalPath + " ID是~ "+macid;
            
            ViewBag.Station = "AOI";
            ViewBag.Lot = "";

            // 預設AOI站
            DataAOI model_AOI = new DataAOI();
            ViewBag.DefectCodeList = model_AOI.defectCodeList;
            ViewBag.SelectedDefect = "";
            //ViewBag.LotList = new List<string>();

            //ViewBag.TestMsg = model.GetIp();

            //string defectCodeNum = model.getDefectCodeNumber("AVI", "金面汙染_Total");

            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各片PPM", "browse", 0, "", "", "", "", "", "", "", "", "");


            ViewData.Model = new DataTable();


            return View();
        }

        [HttpPost]
        public ActionResult DefectByPanel(FormCollection post)
        {
            string site = post["input_site"].Trim();
            string lot = post["input_lot"].Trim();
            string defect_code = post["input_defect_code"].Trim();
            string press_item = post["press_item"];
            WriteToLog writeToLog = new WriteToLog();
            Defect_Fail_Statistics_Class dfs_class = new Defect_Fail_Statistics_Class();

            ViewBag.Site = site;
            ViewBag.Lot = lot;
            ViewBag.SelectedDefect = defect_code;

            if (site == "AVI")
            {
                DataAVI model_AVI = new DataAVI();
                ViewBag.DefectCodeList = model_AVI.defectCodeList;
            }
            else if (site == "AOI")
            {
                DataAOI model_AOI = new DataAOI();
                ViewBag.DefectCodeList = model_AOI.defectCodeList;
            }
            else if (site == "TST")
            {
                DataTST model_TST = new DataTST();
                ViewBag.DefectCodeList = model_TST.defectCodeList;
            }
            else
            {
                ViewBag.DefectCodeList = new List<string>();
                ViewBag.SelectedDefect = defect_code;
            }

            if (press_item == "btn_statistic")
            {
                try
                {
                    dfs_class.defect_fail_ppm_by_panel_dt = dfs_class.Defect_Fail_PPM_Count_By_Panel(site, lot, defect_code);
                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex.ToString());
                    ViewBag.Msg = "[" + site + "] [" + lot + "] [" + defect_code + "] " + "檔案缺失";
                }
                ViewData.Model = dfs_class.defect_fail_ppm_by_panel_dt;
            }
            // 傳lot list給前端顯示
            if (dfs_class.defect_fail_ppm_by_panel_dt.Rows.Count<=0)
            {
                ViewData.Model = new DataTable();
            }
            
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各片PPM", "產生各片統計", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "", site, lot, "", defect_code, "", "", "");
            

            return View();
        }
        
        [HttpPost]
        public ActionResult SinglePanelDrawing(FormCollection post)
        {
            string site = post["input_site"].Trim();
            string lot = post["input_lot"];
            string press_item = post["press_item"];
            string defect_code_name = post["input_defect_code"];
            string panel_list = post["panel_list"];

            int drawingResult = 0;
            WriteToLog writeToLog = new WriteToLog();

            SinglePanelModels singlePanelModel = new SinglePanelModels();
            ViewBag.Station = site;
            ViewBag.Lot = lot;
            ViewBag.Piece = panel_list;

            if (site == "AOI")
            {
                DataAOI model_AOI = new DataAOI();
                ViewBag.DefectCodeList = model_AOI.defectCodeList;
                ViewBag.MaxTotalPanel = model_AOI.maxTotalPanel;
                ViewBag.SelectedDefect = defect_code_name;
            }
            else if(site == "AVI")
            {
                DataAVI model_AVI = new DataAVI();
                ViewBag.DefectCodeList = model_AVI.defectCodeList;
                ViewBag.MaxTotalPanel = model_AVI.maxTotalPanel;
                ViewBag.SelectedDefect = defect_code_name;
            }
            else if (site == "TST")
            {
                DataTST model_TST = new DataTST();
                ViewBag.DefectCodeList = model_TST.defectCodeList;
                ViewBag.MaxTotalPanel = model_TST.maxTotalPanel;
                ViewBag.SelectedDefect = defect_code_name;
            }
            else
            {
                DataAOI model_AOI = new DataAOI();
                ViewBag.DefectCodeList = model_AOI.defectCodeList;
                ViewBag.MaxTotalPanel = model_AOI.maxTotalPanel;
                ViewBag.SelectedDefect = "";
            }

            //按下"開始畫圖"按鈕
            if (press_item == "btn_drawingSinglePPM")
            {
                sw.Start();
                if (string.IsNullOrEmpty(site) || string.IsNullOrEmpty(lot) || string.IsNullOrEmpty(panel_list) || string.IsNullOrEmpty(defect_code_name))
                {
                    ViewBag.TestMsg = "請輸入完整[站別]、[批號]、[版號]、[Defect code] !";
                }
                else
                {
                    if (panel_list.Contains("all"))
                    {
                        drawingResult = singlePanelModel.drawingAllPanels(site.Trim(), lot.Trim(), defect_code_name);

                    }
                    else
                    {
                        //int singlePanel_result = singlePanelModel.createSinglePanelData(station.Trim(), lot.Trim(), piece.Trim());
                        //if (singlePanel_result == 1)
                        //{
                        drawingResult = singlePanelModel.drawingSinglePanel(site.Trim(), lot.Trim(), panel_list.Trim(), defect_code_name);
                        //}

                    }

                    ViewBag.TestMsg = singlePanelModel.message;

                    //if (drawingResult == 1)
                    //{
                    //    // 讀取server的壓縮檔並下載
                    //    FileStream fs = new FileStream(singlePanelModel.picDir + "\\singlePanel.zip", FileMode.Open, FileAccess.Read);
                    //    return File(fs, "application/zip", lot.Trim() + "_singlePanels.zip");
                    //}
                }

                sw.Stop();
                ts2 = sw.Elapsed;

                // 圖片畫完需重抓圖
                singlePanelModel.setImgList();
                if (drawingResult == 1 && singlePanelModel.imgList.Rows.Count > 0)
                {
                    writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各片PPM", "單片畫圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", singlePanelModel.message, site, lot, panel_list, defect_code_name, "", "", "");
                }
                else
                {
                    writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各片PPM", "單片畫圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "fail", singlePanelModel.message, site, lot, panel_list, defect_code_name, "", "", "沒有產出單片圖檔");
                }
            }

            return View("~/Views/PanelDrawing/SinglePanel.cshtml", singlePanelModel.imgList);
        }

        // 報表下載
        [HttpPost]
        public FileResult PanelPPM_ExportExcel(FormCollection post)
        {
            string site = post["input_site"];
            string lot = post["input_lot"];
            string defect_code = post["input_defect_code"].Trim();
            WriteToLog writeToLog = new WriteToLog();
            Defect_Fail_Statistics_Class dfs_class = new Defect_Fail_Statistics_Class();

            try
            {
                dfs_class.defect_fail_ppm_by_panel_dt = dfs_class.Defect_Fail_PPM_Count_By_Panel(site, lot, defect_code);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                ViewBag.Msg = "[" + site + "] [" + lot + "] [" + defect_code + "] " + "檔案缺失";
            }

            // 20220624需設計寫入CSV的內容
            var bytes = System.Text.Encoding.Default.GetBytes(ToCSV(dfs_class.defect_fail_ppm_by_panel_dt));
            MemoryStream stream = new MemoryStream(bytes);

            // 寫入log
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各片PPM", "下載報表", 0, "pass", "", site, lot, "", defect_code, "", "", "");

            return File(stream, "text/csv", DateTime.Now.ToString("yyyyMMdd ") + "_" + lot + "_" + defect_code + "_各片PPM_(Security C).csv");
        }


        // 20220624提供各片PPM統計表格下載
        public string ToCSV(DataTable table)
        {
            Dictionary<string, string> columnNameDict = new Dictionary<string, string>();
            columnNameDict.Add("panel_no", "版號");
            columnNameDict.Add("defect_fail_count", "顆數");
            columnNameDict.Add("defect_fail_ppm", "PPM");

            var result = new StringBuilder();
            for (int i = 0; i < table.Columns.Count; i++)
            {
                result.Append(columnNameDict[table.Columns[i].ColumnName]);
                result.Append(i == table.Columns.Count - 1 ? "\n" : ",");
            }

            foreach (DataRow row in table.Rows)
            {
                for (int i = 0; i < table.Columns.Count; i++)
                {
                    result.Append(row[i].ToString());
                    result.Append(i == table.Columns.Count - 1 ? "\n" : ",");
                }
            }

            return result.ToString();
        }

        public ActionResult DefectByLot()
        {
            ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd");
            ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd");
            ViewBag.site = "AOI";
            // 預設AOI站
            DataAOI model_AOI = new DataAOI();
            ViewBag.DefectCodeList = model_AOI.defectCodeList;
            ViewBag.SelectedDefect = "";
            //DataTable dt_lotList = model_AOI.getLotList("", ViewBag.StartDate, ViewBag.EndDate);

            ViewData.Model = new DataTable();

            ViewData["dt_lotList"] = new DataTable();
            ViewData["dt_defectPPMByLot"] = new DataTable();

            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各批PPM", "browse", 0, "", "", "", "", "", "", "", "", "");

            return View();
        }

        [HttpPost]
        public ActionResult DefectByLot(FormCollection post)
        {
            string site = post["site_Select"].Trim();
            string model_num = post["input_modelNum"].Trim();
            string press_item = post["press_item"];
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string defect_code_name = post["defect_code_Select"];
            string lot_list_string = post["lot_list"];
            string DWG = post["input_DWG"];
            List<string> lot_list = new List<string>();
            WriteToLog writeToLog = new WriteToLog();
            Defect_Fail_Statistics_Class dfs_class = new Defect_Fail_Statistics_Class();

            ViewBag.DWG = DWG;
            ViewBag.Model_num = model_num;
            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;
            ViewBag.site = site;
            ViewBag.lotList = lot_list_string;
            ViewBag.imgSrc = "";

            // 結束日期加一天
            endDate = DateTime.Parse(endDate).AddDays(1).ToString("yyyy-MM-dd");

            if (defect_code_name != null)
            {
                ViewBag.SelectedDefect = defect_code_name;
            }
            if(lot_list_string!=null)
            {
                lot_list = lot_list_string.Split(',').ToList();
            }


            DataTable dt_lotList = new DataTable(); ;

            if (site == "AVI")
            {
                DataAVI model_AVI = new DataAVI();
                dt_lotList = model_AVI.getLotList(DWG, model_num, startDate, endDate);
                ViewBag.DefectCodeList = model_AVI.defectCodeList;
                //ViewBag.LotList = model_AVI.lotList;
            }
            else if (site == "AOI")
            {
                DataAOI model_AOI = new DataAOI();
                dt_lotList = model_AOI.getLotList(DWG, model_num, startDate, endDate);
                ViewBag.DefectCodeList = model_AOI.defectCodeList;
                //ViewBag.LotList = model_AOI.lotList;
            }
            else if (site == "TST")
            {
                DataTST model_TST = new DataTST();
                dt_lotList = model_TST.getLotList(DWG, model_num, startDate, endDate);
                ViewBag.DefectCodeList = model_TST.defectCodeList;
            }
            else
            {
                dt_lotList = new DataTable();
                ViewBag.DefectCodeList = new List<string>();
                ViewBag.SelectedDefect = defect_code_name;
            }

            //// 傳lot list給前端顯示
            //if (string.IsNullOrEmpty(DWG) && string.IsNullOrEmpty(model_num))
            //{
            //    dt_lotList = new DataTable();
            //}
            ViewData["dt_lotList"] = dt_lotList;
            
            ViewData["dt_defectPPMByLot"] = new DataTable();


            // 按下"產生多批疊圖"按鈕
            if (press_item == "btn_multiLotStatic")
            {
                if (!string.IsNullOrEmpty(site) && lot_list.Count>0 && !string.IsNullOrEmpty(defect_code_name))
                {
                    sw.Start();
                    //  統計多批號
                    try
                    {
                        dfs_class.defect_fail_ppm_by_lot_dt = dfs_class.Defect_Fail_PPM_Count_By_Lot(site, lot_list, defect_code_name);
                        ViewData["dt_defectPPMByLot"] = dfs_class.defect_fail_ppm_by_lot_dt;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.ToString());
                        ViewBag.TestMsg = "站別:[" + site + "]  批號:[" + lot_list_string + "]  缺點名稱:[" + defect_code_name + "] " + "檔案缺失! \n";
                    }
                    sw.Stop();
                    ts2 = sw.Elapsed;

                    if(!string.IsNullOrEmpty(dfs_class.error_msg))
                    {
                        ViewBag.TestMsg = dfs_class.error_msg;
                    }

                    writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各批PPM", "產生各批統計", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "", site, lot_list_string, "", defect_code_name, startDate, endDate, "");

                    return View();
                }
                else
                {
                    ViewBag.TestMsg = "請輸入完整[站別]、[料號板序]、[Defect code]，與選擇[批號] !";
                }
            }
            return View();
        }


        [HttpPost]
        public ActionResult ShowStackMapping(FormCollection post)
        {
            string site = post["input_site"].Trim();
            string lot = post["press_lot"];
            string defect_code_name = "";
            WriteToLog writeToLog = new WriteToLog();
            DataTable img_dt;


            if (post["input_defect_code"] != null)
            {
                defect_code_name = post["input_defect_code"].Trim();
                ViewBag.SelectedDefect = defect_code_name;
            }

            ViewBag.site = site;
            ViewBag.Lot = lot;

            if (site == "AVI")
            {
                DataAVI model_AVI = new DataAVI();
                ViewBag.DefectCodeList = model_AVI.defectCodeList;
            }
            else if (site == "AOI")
            {
                DataAOI model_AOI = new DataAOI();
                ViewBag.DefectCodeList = model_AOI.defectCodeList;
            }
            else if (site == "TST")
            {
                DataTST model_TST = new DataTST();
                ViewBag.DefectCodeList = model_TST.defectCodeList;
            }
            else
            {
                ViewBag.DefectCodeList = new List<string>();
                ViewBag.SelectedDefect = defect_code_name;
            }

            StackMapping stackMapping = new StackMapping();
            if (!string.IsNullOrEmpty(site) && !string.IsNullOrEmpty(lot) && !string.IsNullOrEmpty(defect_code_name))
            {
                sw.Start();
                img_dt = stackMapping.getImgList(site, lot, defect_code_name);
                sw.Stop();
                ts2 = sw.Elapsed;
                if (img_dt.Rows.Count > 0)
                {
                    writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各批PPM", "產生單批疊圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "", site, lot, "", defect_code_name, "", "", "");
                }
                else
                {
                    writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各批PPM", "產生單批疊圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "fail", "", site, lot, "", defect_code_name, "", "", "此條件未產出疊圖");
                }
                return View("~/Views/StackMapping/StackMapping.cshtml", stackMapping.imgList);
            }

            return View("~/Views/StackMapping/StackMapping.cshtml", stackMapping.imgList);
        }


        // 20220701 各批PPM報表下載
        [HttpPost]
        public FileResult LotPPM_ExportExcel(FormCollection post)
        {
            string site = post["input_site"];
            string lot = post["input_lot"];
            string defect_code = post["input_defect_code"].Trim();
            List<string> lot_list = lot.Split(',').ToList<string>();
            WriteToLog writeToLog = new WriteToLog();
            Defect_Fail_Statistics_Class dfs_class = new Defect_Fail_Statistics_Class();

            try
            {
                dfs_class.defect_fail_ppm_by_lot_dt = dfs_class.Defect_Fail_PPM_Count_By_Lot(site, lot_list, defect_code);
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
                ViewBag.Msg = "[" + site + "] [" + lot + "] [" + defect_code + "] " + "檔案缺失";
            }

            // 20220624需設計寫入CSV的內容
            var bytes = System.Text.Encoding.Default.GetBytes(LotPPM_ToCSV(dfs_class.defect_fail_ppm_by_lot_dt));
            MemoryStream stream = new MemoryStream(bytes);

            // 寫入log
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "各批PPM", "下載報表", 0, "pass", "", site, lot, "", defect_code, "", "", "");

            return File(stream, "text/csv", DateTime.Now.ToString("yyyyMMdd ") + "_" + defect_code + "_各批PPM_(Security C).csv");
        }

        // 20220701提供各批PPM統計表格下載
        public string LotPPM_ToCSV(DataTable table)
        {
            Dictionary<string, string> columnNameDict = new Dictionary<string, string>();
            columnNameDict.Add("lot_number", "批號");
            columnNameDict.Add("defect_fail_count", "顆數");
            columnNameDict.Add("defect_fail_ppm", "PPM");

            var result = new StringBuilder();
            for (int i = 0; i < table.Columns.Count; i++)
            {
                result.Append(columnNameDict[table.Columns[i].ColumnName]);
                result.Append(i == table.Columns.Count - 1 ? "\n" : ",");
            }

            foreach (DataRow row in table.Rows)
            {
                for (int i = 0; i < table.Columns.Count; i++)
                {
                    result.Append(row[i].ToString());
                    result.Append(i == table.Columns.Count - 1 ? "\n" : ",");
                }
            }

            return result.ToString();
        }

    }

}