using highlight_system.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net.NetworkInformation;
using System.Reflection;
using System.Web;
using System.Web.Mvc;

namespace highlight_system.Controllers
{
    public class ReportController : Controller
    {
        Stopwatch sw = new Stopwatch();
        TimeSpan ts2;


        // GET: Report
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult AnalysisReport()
        {
            ViewBag.Message = "Your analysis report page.";

            //ViewBag.StartDate = DateTime.Now.AddDays(-7).AddSeconds(-DateTime.Now.Second).GetDateTimeFormats('s')[0].ToString();//2016-7-05T14:06:25
            //ViewBag.EndDate = DateTime.Now.AddSeconds(-DateTime.Now.Second).GetDateTimeFormats('s')[0].ToString();//2016-7-05T14:06:25
            ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
            ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            ViewBag.DWG = "";
            ViewBag.ModelNum = "";
            ViewBag.Lot = "";
            ViewBag.DefectCode = "";
            ViewBag.DefectCodeName = "";
            //Session["session_time"] = 0;

            DataTable commonDefect_dt;
            DataAVI model = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "共同點", "browse", 0, "", "", "", "", "", "", "", "", "");
            commonDefect_dt = model.getCommonDefectList(ViewBag.StartDate, ViewBag.EndDate);
            return View(commonDefect_dt);
        }

        [HttpPost]
        public ActionResult AnalysisReport(FormCollection post)
        {
            sw.Start();
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string DWG = post["input_DWG"];
            string model_num = post["input_model_num"].Trim();
            string lot = post["input_lot"].Trim();
            string defect_code = post["input_defect_code"].Trim();
            string defect_code_name = post["input_defect_code_name"].Trim();
            //string stay_time = post["stay_time"].Trim();
            //Session["session_time"] = post["stay_time"].Trim();
            DateTime startD, endD;

            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;
            ViewBag.DWG = DWG;
            ViewBag.ModelNum = model_num;
            ViewBag.Lot = lot;
            ViewBag.DefectCode = defect_code;
            ViewBag.DefectCodeName = defect_code_name;

            DataTable commonDefect_dt;
            DataAVI model = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();

            if (!DateTime.TryParse(startDate, out startD))
            {
                ViewBag.Msg = "開始日期格式不正確!";
                //ViewBag.StartDate = DateTime.Now.AddDays(-7).GetDateTimeFormats('s')[0].ToString();
                //ViewBag.EndDate = DateTime.Now.GetDateTimeFormats('s')[0].ToString();
                ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
                ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                commonDefect_dt = model.getCommonDefectList(ViewBag.StartDate, ViewBag.EndDate, DWG, model_num, lot, defect_code, defect_code_name);

                sw.Stop();
                ts2 = sw.Elapsed;
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "共同點", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "開始日期格式不正確", "AVI", lot, "", defect_code_name, startDate, endDate, "");

                return View(commonDefect_dt);
            }
            if (!DateTime.TryParse(endDate, out endD))
            {
                ViewBag.Msg = "結束日期格式不正確!";
                //ViewBag.StartDate = DateTime.Now.AddDays(-7).GetDateTimeFormats('s')[0].ToString();
                //ViewBag.EndDate = DateTime.Now.GetDateTimeFormats('s')[0].ToString();
                ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("MM/dd/yyyy HH:mm");
                ViewBag.EndDate = DateTime.Now.ToString("MM/dd/yyyy HH:mm");
                commonDefect_dt = model.getCommonDefectList(ViewBag.StartDate, ViewBag.EndDate, DWG, model_num, lot, defect_code, defect_code_name);

                sw.Stop();
                ts2 = sw.Elapsed;
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "共同點", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "結束日期格式不正確", "AVI", lot, "", defect_code_name, startDate, endDate, "");

                return View(commonDefect_dt);
            }

            commonDefect_dt = model.getCommonDefectList(startDate, endDate, DWG, model_num, lot, defect_code, defect_code_name);

            sw.Stop();
            ts2 = sw.Elapsed;
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "共同點", "查詢", Convert.ToInt32(ts2.TotalMilliseconds/1000),"pass", "","AVI", lot, "", defect_code_name, startDate, endDate, "");

            return View(commonDefect_dt);
        }

        public ActionResult JinMianReport()
        {
            ViewBag.Message = "Your JinMian report page.";

            //ViewBag.StartDate = DateTime.Now.AddDays(-7).AddSeconds(-DateTime.Now.Second).GetDateTimeFormats('s')[0].ToString();
            //ViewBag.EndDate = DateTime.Now.AddSeconds(-DateTime.Now.Second).GetDateTimeFormats('s')[0].ToString();
            ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
            ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            ViewBag.DWG = "";
            ViewBag.ModelNum = "";
            ViewBag.Lot = "";
            ViewBag.PassFail = 2;
            DataAVI model = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染", "browse", 0, "", "", "", "", "", "", "", "", "");
            return View(model.getJinMianDefectList(ViewBag.StartDate, ViewBag.EndDate, "", "", "", 2));
        }

        [HttpPost]
        public ActionResult JinMianReport(FormCollection post)
        {
            sw.Start();
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string DWG = post["input_DWG"];
            string model_num = post["input_model_num"].Trim();
            string lot = post["input_lot"].Trim();
            int pass_fail_radio = int.Parse(post["pass_fail_options"].Trim());
            DateTime startD, endD;

            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;
            ViewBag.DWG = DWG;
            ViewBag.ModelNum = model_num;
            ViewBag.Lot = lot;
            ViewBag.PassFail = pass_fail_radio;

            DataTable defect_dt;
            DataAVI model = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();

            if (!DateTime.TryParse(startDate, out startD))
            {
                ViewBag.Msg = "開始日期格式不正確!";
                //ViewBag.StartDate = DateTime.Now.AddDays(-7).GetDateTimeFormats('s')[0].ToString();
                //ViewBag.EndDate = DateTime.Now.GetDateTimeFormats('s')[0].ToString();
                ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
                ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                defect_dt = model.getJinMianDefectList(ViewBag.StartDate, ViewBag.EndDate, DWG, model_num, lot, pass_fail_radio);

                sw.Stop();
                ts2 = sw.Elapsed;
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "開始日期格式不正確", "AVI", lot, "", "", startDate, endDate, "");

                return View(defect_dt);
            }
            if (!DateTime.TryParse(endDate, out endD))
            {
                ViewBag.Msg = "結束日期格式不正確!";
                //ViewBag.StartDate = DateTime.Now.AddDays(-7).GetDateTimeFormats('s')[0].ToString();
                //ViewBag.EndDate = DateTime.Now.GetDateTimeFormats('s')[0].ToString();
                ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
                ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                defect_dt = model.getJinMianDefectList(ViewBag.StartDate, ViewBag.EndDate, DWG, model_num, lot, pass_fail_radio);

                sw.Stop();
                ts2 = sw.Elapsed;
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "結束日期格式不正確", "AVI", lot, "", "", startDate, endDate, "");

                return View(defect_dt);
            }
            defect_dt = model.getJinMianDefectList(startDate, endDate, DWG, model_num, lot, pass_fail_radio);

            sw.Stop();
            ts2 = sw.Elapsed;
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "", "AVI", lot, "", "", startDate, endDate, "");

            return View(defect_dt);
        }

        public ActionResult DimpleReport()
        {
            ViewBag.Message = "Your Dimple report page.";

            //ViewBag.StartDate = DateTime.Now.AddDays(-7).AddSeconds(-DateTime.Now.Second).GetDateTimeFormats('s')[0].ToString();
            //ViewBag.EndDate = DateTime.Now.AddSeconds(-DateTime.Now.Second).GetDateTimeFormats('s')[0].ToString();
            ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
            ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            ViewBag.DWG = "";
            ViewBag.ModelNum = "";
            ViewBag.Lot = "";

            DataTST model = new DataTST();
            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "電測站Open", "browse", 0, "", "", "", "", "", "", "", "", "");
            return View(model.getDimpleDefectList(ViewBag.StartDate, ViewBag.EndDate));
        }

        [HttpPost]
        public ActionResult DimpleReport(FormCollection post)
        {
            sw.Start();
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string DWG = post["input_DWG"];
            string model_num = post["input_model_num"].Trim();
            string lot = post["input_lot"].Trim();

            DateTime startD, endD;

            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;
            ViewBag.DWG = DWG;
            ViewBag.ModelNum = model_num;
            ViewBag.Lot = lot;

            DataTST model = new DataTST();
            DataTable defect_dt;
            WriteToLog writeToLog = new WriteToLog();

            if (!DateTime.TryParse(startDate, out startD))
            {
                ViewBag.Msg = "開始日期格式不正確!";
                //ViewBag.StartDate = DateTime.Now.AddDays(-7).GetDateTimeFormats('s')[0].ToString();
                //ViewBag.EndDate = DateTime.Now.GetDateTimeFormats('s')[0].ToString();
                ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
                ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                defect_dt = model.getDimpleDefectList(ViewBag.StartDate, ViewBag.EndDate, DWG, model_num, lot);

                sw.Stop();
                ts2 = sw.Elapsed;
                // 寫入log
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "電測站Open", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "開始日期格式不正確", "TST", lot, "", "", startDate, endDate, "");

                return View(defect_dt);
            }
            if (!DateTime.TryParse(endDate, out endD))
            {
                ViewBag.Msg = "結束日期格式不正確!";
                //ViewBag.StartDate = DateTime.Now.AddDays(-7).GetDateTimeFormats('s')[0].ToString();
                //ViewBag.EndDate = DateTime.Now.GetDateTimeFormats('s')[0].ToString();
                ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
                ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                defect_dt = model.getDimpleDefectList(ViewBag.StartDate, ViewBag.EndDate, DWG, model_num, lot);

                sw.Stop();
                ts2 = sw.Elapsed;
                // 寫入log
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "電測站Open", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "結束日期格式不正確", "TST", lot, "", "", startDate, endDate, "");

                return View(defect_dt);
            }
            defect_dt = model.getDimpleDefectList(startDate, endDate, DWG, model_num, lot);
            sw.Stop();
            ts2 = sw.Elapsed;
            // 寫入log
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "電測站Open", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "", "TST", lot, "", "", startDate, endDate, "");

            return View(defect_dt);
        }

        // 綠漆殘留頁面
        public ActionResult ScumReport()
        {
            ViewBag.Message = "Your Dimple report page.";

            //ViewBag.StartDate = DateTime.Now.AddDays(-7).AddSeconds(-DateTime.Now.Second).GetDateTimeFormats('s')[0].ToString();
            //ViewBag.EndDate = DateTime.Now.AddSeconds(-DateTime.Now.Second).GetDateTimeFormats('s')[0].ToString();
            ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
            ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            ViewBag.DWG = "";
            ViewBag.ModelNum = "";
            ViewBag.Lot = "";
            ViewBag.PassFail = 2;

            DataAVI model = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "綠漆殘留", "browse", 0, "", "", "", "", "", "", "", "", "");
            return View(model.getScumDefectList(ViewBag.StartDate, ViewBag.EndDate, "", "", "", 2));
        }

        [HttpPost]
        public ActionResult ScumReport(FormCollection post)
        {
            sw.Start();
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string DWG = post["input_DWG"];
            string model_num = post["input_model_num"].Trim();
            string lot = post["input_lot"].Trim();
            int pass_fail_radio = int.Parse(post["pass_fail_options"].Trim());
            DateTime startD, endD;

            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;
            ViewBag.DWG = DWG;
            ViewBag.ModelNum = model_num;
            ViewBag.Lot = lot;
            ViewBag.PassFail = pass_fail_radio;

            DataTable defect_dt;
            DataAVI model = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();

            if (!DateTime.TryParse(startDate, out startD))
            {
                ViewBag.Msg = "開始日期格式不正確!";
                //ViewBag.StartDate = DateTime.Now.AddDays(-7).GetDateTimeFormats('s')[0].ToString();
                //ViewBag.EndDate = DateTime.Now.GetDateTimeFormats('s')[0].ToString();
                ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
                ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                defect_dt = model.getScumDefectList(ViewBag.StartDate, ViewBag.EndDate, DWG, model_num, lot, pass_fail_radio);

                sw.Stop();
                ts2 = sw.Elapsed;
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "綠漆殘留", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "開始日期格式不正確", "AVI", lot, "", "", startDate, endDate, "");

                return View(defect_dt);
            }
            if (!DateTime.TryParse(endDate, out endD))
            {
                ViewBag.Msg = "結束日期格式不正確!";
                //ViewBag.StartDate = DateTime.Now.AddDays(-7).GetDateTimeFormats('s')[0].ToString();
                //ViewBag.EndDate = DateTime.Now.GetDateTimeFormats('s')[0].ToString();
                ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
                ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
                defect_dt = model.getScumDefectList(ViewBag.StartDate, ViewBag.EndDate, DWG, model_num, lot, pass_fail_radio);

                sw.Stop();
                ts2 = sw.Elapsed;
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "綠漆殘留", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "結束日期格式不正確", "AVI", lot, "", "", startDate, endDate, "");

                return View(defect_dt);
            }
            defect_dt = model.getScumDefectList(startDate, endDate, DWG, model_num, lot, pass_fail_radio);

            sw.Stop();
            ts2 = sw.Elapsed;
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "綠漆殘留", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "", "AVI", lot, "", "", startDate, endDate, "");

            return View(defect_dt);
        }


        // 報表下載
        [HttpPost]
        public FileResult CommonDefect_ExportExcel(FormCollection post)
        {
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string DWG = post["input_DWG"];
            string model_num = post["input_model_num"];
            string lot = post["input_lot"];
            string defect_code = post["input_defect_code"];
            string defect_code_name = post["input_defect_code_name"].Trim();
            WriteToLog writeToLog = new WriteToLog();

            DataAVI avi_model = new DataAVI();
            DataTable commonDefect_dt = avi_model.getCommonDefectList(startDate, endDate, DWG, model_num, lot, defect_code, defect_code_name);
            var bytes = System.Text.Encoding.Default.GetBytes(avi_model.ToCSV(commonDefect_dt));
            MemoryStream stream = new MemoryStream(bytes);

            // 寫入log
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "共同點", "下載報表", 0, "pass", "", "AVI", lot, "", defect_code, startDate, endDate, "");

            return File(stream, "text/csv", DateTime.Now.ToString("yyyyMMdd ") + "共同點_(Security C).csv");
        }

        [HttpPost]
        public FileResult JinMian_ExportExcel(FormCollection post)
        {
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string DWG = post["input_DWG"];
            string model_num = post["input_model_num"];
            string lot = post["input_lot"];
            int pass_fail_radio = int.Parse(post["pass_fail_options"].Trim());
            WriteToLog writeToLog = new WriteToLog();

            DataAVI avi_model = new DataAVI();
            DataTable JinMian_dt = avi_model.getJinMianDefectList(startDate, endDate, DWG, model_num, lot, pass_fail_radio);
            if (JinMian_dt.Columns.Contains("single_panel"))
            {
                JinMian_dt.Columns.Remove("single_panel");
            }
            var bytes = System.Text.Encoding.Default.GetBytes(avi_model.ToCSV(JinMian_dt));
            MemoryStream stream = new MemoryStream(bytes);

            // 寫入log
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染", "下載報表", 0, "pass", "", "AVI", lot, "", "", startDate, endDate, "");

            return File(stream, "text/csv", DateTime.Now.ToString("yyyyMMdd ") + "金面汙染_(Security C).csv");

            //string strHtml = post["hHtml"];
            //strHtml = HttpUtility.HtmlDecode(strHtml);//Html解碼
            //byte[] b = System.Text.Encoding.Default.GetBytes(strHtml);//字串轉byte陣列

            //return File(bytes, "application/vnd.ms-excel", "這是Excel.xlsx");//輸出檔案給Client端

        }

        [HttpPost]
        public FileResult Dimple_ExportExcel(FormCollection post)
        {
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string DWG = post["input_DWG"];
            string model_num = post["input_model_num"];
            string lot = post["input_lot"];
            WriteToLog writeToLog = new WriteToLog();

            DataTST tst_model = new DataTST();
            DataTable JinMian_dt = tst_model.getDimpleDefectList(startDate, endDate, DWG, model_num, lot);
            var bytes = System.Text.Encoding.Default.GetBytes(tst_model.ToCSV(JinMian_dt));
            MemoryStream stream = new MemoryStream(bytes);
            // 寫入log
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "電測站Open", "下載報表", 0, "pass", "", "TST", lot, "", "", startDate, endDate, "");
            return File(stream, "text/csv", DateTime.Now.ToString("yyyyMMdd ") + "電測站Open_(Security C).csv");
            
        }

        [HttpPost]
        public FileResult Scum_ExportExcel(FormCollection post)
        {
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string DWG = post["input_DWG"];
            string model_num = post["input_model_num"];
            string lot = post["input_lot"];
            WriteToLog writeToLog = new WriteToLog();

            DataAVI avi_model = new DataAVI();
            DataTable Scum_dt = avi_model.getScumDefectList(startDate, endDate, DWG, model_num, lot);
            if (Scum_dt.Columns.Contains("single_panel"))
            {
                Scum_dt.Columns.Remove("single_panel");
            }
            var bytes = System.Text.Encoding.Default.GetBytes(avi_model.ToCSV(Scum_dt));
            MemoryStream stream = new MemoryStream(bytes);
            // 寫入log
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "綠漆殘留", "下載報表", 0, "pass", "", "AVI", lot, "", "", startDate, endDate, "");
            return File(stream, "text/csv", DateTime.Now.ToString("yyyyMMdd ") + "綠漆(scum)殘留_(Security C).csv");

        }

        // 單片畫圖與下載
        [HttpPost]
        public ActionResult drawAndDownload(FormCollection post)
        {
            string info = post["info"].Trim();
            string[] str_split = info.Split('-');
            string web_page = str_split[0].Trim();
            string station = str_split[1].Trim();
            string model_num = str_split[2].Trim();
            string lot_num = str_split[3].Trim();
            string defect_code = str_split[4].Trim();
            string piece = str_split[5].Trim();
            string datetime = str_split[6].Trim();
            int drawingResult = 0;

            SinglePanelModels singlePanelModel = new SinglePanelModels();
            WriteToLog writeToLog = new WriteToLog();

            // 計時畫圖多久
            //Stopwatch sw = new Stopwatch();
            sw.Start();
            drawingResult = singlePanelModel.drawingSinglePanel(station, lot_num, piece, defect_code);
            sw.Stop();
            ts2 = sw.Elapsed;

            // 寫入log
            if(web_page=="JinMian")
            {
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染", "畫圖並下載", Convert.ToInt32(ts2.TotalMilliseconds / 1000), (drawingResult == 0) ? "fail" : "pass", "", station, lot_num, piece, defect_code, "", "", "");
            }
            else if(web_page == "Scum")
            {
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "綠漆殘留", "畫圖並下載", Convert.ToInt32(ts2.TotalMilliseconds / 1000), (drawingResult == 0) ? "fail" : "pass", "", station, lot_num, piece, defect_code, "", "", "");
            }
            else
            {
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "電測站Open", "畫圖並下載", Convert.ToInt32(ts2.TotalMilliseconds / 1000), (drawingResult == 0) ? "fail" : "pass", "", station, lot_num, piece, defect_code, "", "", "");
            }

            ViewBag.Msg = singlePanelModel.message;

            if (drawingResult == 1 && !Directory.Exists(singlePanelModel.picDir + "\\singlePanel.zip"))
            {
                try
                {
                    FileStream fs = new FileStream(singlePanelModel.picDir + "\\singlePanel.zip", FileMode.Open, FileAccess.Read);
                    return File(fs, "application/zip", lot_num + "_" + defect_code + "_singlePanels.zip");
                }
                catch (Exception ex)
                {
                    singlePanelModel.writeToLog("在reportController: "+ ex.ToString());
                }
               
            }

            if (web_page == "JinMian")
            {
                return RedirectToAction("JinMianReport", "Report", null);
            }
            else if(web_page == "Scum")
            {
                return RedirectToAction("ScumReport", "Report", null);
            }
            else
            {
                return RedirectToAction("DimpleReport", "Report", null);
            }
        }

        // 疊圖下載
        [HttpPost]
        public ActionResult Item_Download(FormCollection post)
        {
            string img_src = post["img_src"].Trim();
            string[] str_split = img_src.Split('\\');
            string fname = str_split[str_split.Length - 1].Trim();
            WriteToLog writeToLog = new WriteToLog();

            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "共同點", "疊圖下載", 0, "", "", "", "", "", "", "", "", "下載來源:" + img_src);

            FileStream stream = new FileStream(img_src, FileMode.Open, FileAccess.Read, FileShare.Read);
            return File(stream, "application/octet-stream", fname); //MME 格式 可上網查 此為通用設定

        }

        // 查看圖片
        public ActionResult Image(string imgSrc, string webpage="commonDefect")
        {
            Tool tool = new Tool();
            WriteToLog writeToLog = new WriteToLog();

            if (webpage == "commonDefect")
            {
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "共同點", "查看疊圖", 0, "", "", "", "", "", "", "", "", "圖檔來源:" + imgSrc);
            }
            else if (webpage == "JinMianAI")
            {
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染AI", "查看疊圖", 0, "", "", "", "", "", "", "", "", "圖檔來源:" + imgSrc);
            }

            byte[] image = tool.GetBytesFromImage(imgSrc);
            if (image == null) return new EmptyResult();
            return new FileContentResult(image, "image/jpeg");
        }

        // AI辨識結果金面汙染
        public ActionResult JinMianAI()
        {
            ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd HH:mm");
            ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            //ViewBag.DWG = "";
            //ViewBag.ModelNum = "";
            //ViewBag.Lot = "";
            ViewBag.PanelStrip = 2;
            DataAVI model_AVI = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染AI", "browse", 0, "", "", "", "", "", "", "", "", "");

            DataTable au_pollution_result_dt = model_AVI.getAuPollutionAiResult(ViewBag.StartDate, ViewBag.EndDate, "", "", "", ViewBag.PanelStrip);
            bool addColumnResult = getPathImage(au_pollution_result_dt);

            ViewData["dt_AIResult"] = au_pollution_result_dt;

            return View();
        }

        // AI辨識結果金面汙染 post
        [HttpPost]
        public ActionResult JinMianAI(FormCollection post)
        {
            sw.Start();
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            int panel_strip_radio = int.Parse(post["panel_strip_options"].Trim());
            //string DWG = post["input_DWG"];
            //string model_num = post["input_model_num"].Trim();
            //string lot = post["input_lot"].Trim();

            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;
            ViewBag.PanelStrip = panel_strip_radio;
            //ViewBag.DWG = DWG;
            //ViewBag.ModelNum = model_num;
            //ViewBag.Lot = lot;

            DataAVI model_AVI = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();

            sw.Stop();
            ts2 = sw.Elapsed;
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染AI", "查詢", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "", "", "", "", "", "", startDate, endDate, "");

            //DataTable au_pollution_result_dt = model_AVI.getAuPollutionAiResult(startDate, endDate, DWG, model_num, lot);
            DataTable au_pollution_result_dt = model_AVI.getAuPollutionAiResult(startDate, endDate, "", "", "", panel_strip_radio);
            bool addColumnResult = getPathImage(au_pollution_result_dt);

            ViewData["dt_AIResult"] = au_pollution_result_dt;

            return View();
        }


        private bool getPathImage(DataTable dt)
        {
            if (dt == null || dt.Rows.Count == 0 || !dt.Columns.Contains("lot_num") || !dt.Columns.Contains("panel_num") || !dt.Columns.Contains("datetime")) return false;
           
            WriteToLog writeToLog = new WriteToLog();
            string ip = writeToLog.GetIp();
            Tool tool = new Tool();

            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            string macid = nics[0].GetPhysicalAddress().ToString();
            // 網頁專案的\bin\
            string project_path = Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase);
            string localPicDir = new Uri(project_path.Substring(0, project_path.IndexOf("\\bin")) + @"\img\au_defect_fail_single_panel").LocalPath;

            string temp_filename;

            string path_head = "";
            dt.Columns.Add(new DataColumn("path", typeof(System.String)));

            path_head = (macid == "1C98EC1A6473") ? @"D:\" : @"\\10.16.22.228\";

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

            try
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    string dateTime = DateTime.Parse(dt.Rows[i]["datetime"].ToString()).ToString("yyyyMMdd");
                    string srcPath = path_head + @"HL_System_File\StackingFig\AVI\au_defect_fail_single_panel\" + dateTime + @"\" + dt.Rows[i]["lot_num"].ToString() + @"\" + dt.Rows[i]["lot_num"].ToString() + "_金面汙染_Total_P" + dt.Rows[i]["panel_num"].ToString() + ".png";
                    
                    // 把圖檔複製到網頁專案資料夾中的 img\
                    temp_filename = dt.Rows[i]["lot_num"].ToString() + "_金面汙染_Total_P" + dt.Rows[i]["panel_num"].ToString() + ".png";
                    dt.Rows[i]["path"] = Path.Combine(localPicDir, temp_filename);
                    tool.copyFileTo(srcPath, dt.Rows[i]["path"].ToString(), true);
                }

            }
            catch(Exception ex)
            {
                return false;
            }

            return true;
        }

        [HttpPost]
        public ActionResult updateAIResult(FormCollection post)
        {
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            int panel_strip_radio = int.Parse(post["panel_strip_options"].Trim());
            List<string> au_result_table = post["au_result_table"].Split(',').ToList(); ;

            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;
            ViewBag.PanelStrip = panel_strip_radio;
       
            DataAVI model_AVI = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();


            bool updateResult = model_AVI.updateAuPollutionAiResult(au_result_table);



            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "金面汙染AI", "更新複判結果", 0, "", "", "", "", "", "", startDate, endDate, "");

            //DataTable au_pollution_result_dt = model_AVI.getAuPollutionAiResult(startDate, endDate, DWG, model_num, lot);
            DataTable au_pollution_result_dt = model_AVI.getAuPollutionAiResult(startDate, endDate, "", "", "", panel_strip_radio);
            bool addColumnResult = getPathImage(au_pollution_result_dt);

            ViewData["dt_AIResult"] = au_pollution_result_dt;

            return RedirectToAction("JinMianAI", "Report", null);

        }
        

    }
}