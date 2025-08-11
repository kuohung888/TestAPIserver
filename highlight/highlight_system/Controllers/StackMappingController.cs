using highlight_system.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace highlight_system.Controllers
{
    public class StackMappingController : Controller
    {
        Stopwatch sw = new Stopwatch();
        TimeSpan ts2;

        // GET: StackMapping
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult StackMapping()
        {
            StackMapping stackMapping = new StackMapping();
            ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd");
            ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd");
            ViewBag.site = "AOI";
            ViewBag.Lot = "";
            // 預設AOI站
            DataAOI model_AOI = new DataAOI();
            ViewBag.DefectCodeList = model_AOI.defectCodeList;
            ViewBag.SelectedDefect = "";

            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單批疊圖", "browse", 0, "", "", "", "", "", "", "", "", "");

            DataTable img_dt = stackMapping.getImgList("AOI", "", model_AOI.defectCodeList[0]);

            return View(img_dt);
        }

        [HttpPost]
        public ActionResult StackMapping(FormCollection post)
        {
            string site = post["input_site"].Trim();
            string lot = post["input_lot"].Trim();
            string press_item = post["press_item"];
            string defect_code_name = "";
            //string press_item = "";
            WriteToLog writeToLog = new WriteToLog();
            DataTable img_dt;


            if (post["input_defect_code"] !=null)
            {
                defect_code_name = post["input_defect_code"].Trim();
                ViewBag.SelectedDefect = defect_code_name;
            }
            
            ViewBag.site = site;
            ViewBag.Lot = lot;

            if (site == "AVI")
            {
                DataAVI model_AVI = new DataAVI();
                //DataTable dt_lotList = model_AVI.getLotList();
                ViewBag.DefectCodeList = model_AVI.defectCodeList;
                //ViewBag.LotList = model_AVI.lotList;
            }
            else if (site == "AOI")
            {
                DataAOI model_AOI = new DataAOI();
                //DataTable dt_lotList = model_AOI.getLotList();
                ViewBag.DefectCodeList = model_AOI.defectCodeList;
                //ViewBag.LotList = model_AOI.lotList;
            }
            else if (site == "TST")
            {
                DataTST model_TST = new DataTST();
                //DataTable dt_lotList = model_TST.getLotList();
                ViewBag.DefectCodeList = model_TST.defectCodeList;
            }
            else
            {
                ViewBag.DefectCodeList = new List<string>();
                ViewBag.SelectedDefect = defect_code_name;
            }
            
            StackMapping stackMapping = new StackMapping();
            if (press_item == "btn_start_drawing")
            {
                if (!string.IsNullOrEmpty(site) && !string.IsNullOrEmpty(lot) && !string.IsNullOrEmpty(defect_code_name))
                {
                    sw.Start();
                    img_dt = stackMapping.getImgList(site, lot, defect_code_name);
                    sw.Stop();
                    ts2 = sw.Elapsed;
                    if (img_dt.Rows.Count > 0)
                    {
                        writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單批疊圖", "產生單批疊圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "", site, lot, "", defect_code_name, "", "", "");
                    }
                    else
                    {
                        writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單批疊圖", "產生單批疊圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "fail", "", site, lot, "", defect_code_name, "", "", "此條件未產出疊圖");
                    }
                    return View(stackMapping.imgList);
                }
                else
                {
                    //ViewBag.TestMsg = "請輸入完整[站別]、[批號]、[Defect code] !";
                }
            }

            return View(stackMapping.imgList);
        }

        [HttpPost]
        public ActionResult Item_Download(FormCollection post)
        {
            string img_src = post["img_src"].Trim();
            string webpage = post["webpage"].Trim();
            string[] str_split = img_src.Split('\\');
            string fname = str_split[str_split.Length - 1].Trim();
            WriteToLog writeToLog = new WriteToLog();

            if (webpage == "singleStack")
            {
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單批疊圖", "疊圖單批下載", 0, "", "", "", "", "", "", "", "", "下載來源:" + img_src);
            }
            else if (webpage == "multiStack")
            {
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "多批疊圖", "疊圖單批下載", 0, "", "", "", "", "", "", "", "", "下載來源:" + img_src);
            }

            FileStream stream = new FileStream(img_src, FileMode.Open, FileAccess.Read, FileShare.Read);
            return File(stream, "application/octet-stream", fname); //MME 格式 可上網查 此為通用設定

        }

        public FileResult Image(string imgSrc, string webpage)
        {
            Tool tool = new Tool();
            WriteToLog writeToLog = new WriteToLog();

            if(webpage == "singleStack")
            {
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單批疊圖", "查看單批疊圖", 0, "", "", "", "", "", "", "", "", "圖檔來源:" + imgSrc);
            }
            else if(webpage == "multiStack")
            {
                writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "多批疊圖", "查看單批疊圖", 0, "", "", "", "", "", "", "", "", "圖檔來源:" + imgSrc);
            }

            byte[] image = tool.GetBytesFromImage(imgSrc);
            return new FileContentResult(image, "image/jpeg");
        }


        public ActionResult MultiLotStackMapping()
        {
            StackMapping stackMapping = new StackMapping();
            ViewBag.StartDate = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd");
            ViewBag.EndDate = DateTime.Now.ToString("yyyy-MM-dd");
            ViewBag.site = "AOI";
            ViewBag.Lot = "";
            // 預設AOI站
            DataAOI model_AOI = new DataAOI();
            ViewBag.DefectCodeList = model_AOI.defectCodeList;
            ViewBag.SelectedDefect = "";
            //DataTable dt_lotList = model_AOI.getLotList("", ViewBag.StartDate, ViewBag.EndDate);

            ViewData.Model = new DataTable();

            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "多批疊圖", "browse", 0, "", "", "", "", "", "", "", "", "");

            //DataTable img_dt = stackMapping.getImgList("AOI", "", model_AOI.defectCodeList[0]);

            return View();
        }


        [HttpPost]
        public ActionResult MultiLotStackMapping(FormCollection post)
        {
            string site = post["site_Select"].Trim();
            string DWG = post["input_DWG"];
            string model_num = post["input_modelNum"].Trim();
            string press_item = post["press_item"];
            string startDate = post["input_StartDate"];
            string endDate = post["input_EndDate"];
            string defect_code_name = post["defect_code_Select"];
            string lot_list = post["lot_list"];
            StackMapping stackMapping = new StackMapping();
            WriteToLog writeToLog = new WriteToLog();
            List<string> result_path;

            ViewBag.DWG = DWG;
            ViewBag.Model_num = model_num;
            ViewBag.StartDate = startDate;
            ViewBag.EndDate = endDate;
            ViewBag.site = site;
            ViewBag.lotList = lot_list;
            ViewBag.imgSrc = "";

            // 結束日期加一天
            endDate = DateTime.Parse(endDate).AddDays(1).ToString("yyyy-MM-dd");

            if (defect_code_name != null)
            {
                ViewBag.SelectedDefect = defect_code_name;
            }


            DataTable dt_lotList;

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

            // 傳lot list給前端顯示
            if (string.IsNullOrEmpty(DWG) && string.IsNullOrEmpty(model_num))
            {
                dt_lotList = new DataTable();
            }
            ViewData.Model = dt_lotList;

            // 按下"產生多批疊圖"按鈕
            if (press_item == "btn_drawingMultiLot")
            {
                if (!string.IsNullOrEmpty(site) && !string.IsNullOrEmpty(lot_list.Split(',')[0]) && !string.IsNullOrEmpty(defect_code_name))
                {
                    sw.Start();
                    result_path = stackMapping.plotMultiLotStack(site, defect_code_name, lot_list);
                    sw.Stop();
                    ts2 = sw.Elapsed;
                    if (result_path.Count > 0)
                    {
                        writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "多批疊圖", "產生多批疊圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", "", site, lot_list, "", defect_code_name, startDate, endDate, "");
                    }
                    else
                    {
                        writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "多批疊圖", "產生多批疊圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "fail", "", site, lot_list, "", defect_code_name, startDate, endDate, "此條件未產出多批疊圖");
                    }

                    if (result_path.Count > 0) { ViewBag.imgSrc = result_path; }
                    return View();
                }
                else
                {
                    ViewBag.TestMsg = "請輸入完整[站別]、[料號板序]、[Defect code]，與選擇[批號] !";
                }
            }
            

            return View();
        }

    }
}