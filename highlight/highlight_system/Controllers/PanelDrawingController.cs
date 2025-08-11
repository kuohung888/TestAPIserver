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
    public class PanelDrawingController : Controller
    {
        Stopwatch sw = new Stopwatch();
        TimeSpan ts2;

        // GET: PanelDrawing
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult SinglePanel()
        {
            ViewBag.Message = "Your single panel page.";
            //抓mac id
            //NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            //string macid = nics[0].GetPhysicalAddress().ToString();
            //ViewBag.TestMsg = new Uri(Path.GetDirectoryName(Assembly.GetExecutingAssembly().CodeBase)).LocalPath + " ID是~ "+macid;

            SinglePanelModels model = new SinglePanelModels();
            ViewBag.Station = "AOI";
            ViewBag.Lot = "";
            ViewBag.Piece = "";

            // 預設AOI站
            DataAOI model_AOI = new DataAOI();
            ViewBag.DefectCodeList = model_AOI.defectCodeList;
            ViewBag.MaxTotalPanel = model_AOI.maxTotalPanel;
            ViewBag.SelectedDefect = "";
            //ViewBag.LotList = new List<string>();

            //ViewBag.TestMsg = model.GetIp();

            //string defectCodeNum = model.getDefectCodeNumber("AVI", "金面汙染_Total");

            WriteToLog writeToLog = new WriteToLog();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單片畫圖", "browse", 0, "", "", "", "", "", "", "", "", "");

            return View(model.imgList);
        }

        [HttpPost]
        public ActionResult SinglePanel(FormCollection post)
        {

            SinglePanelModels singlePanelModel = new SinglePanelModels();
            string station = post["station_input"].Trim();
            string lot = post["lot_input"].Trim();
            string piece = post["piece_input"].Trim();
            string defect_code = post["defect_code"];
            string press_item = post["press_item"];
            int drawingResult = 0;
            WriteToLog writeToLog = new WriteToLog();

            //按下"開始畫圖"按鈕
            if (press_item == "btn_start_drawing")
            {
                sw.Start();
                if (string.IsNullOrEmpty(station) || string.IsNullOrEmpty(lot) || string.IsNullOrEmpty(piece) || string.IsNullOrEmpty(defect_code))
                {
                    ViewBag.TestMsg = "請輸入完整[站別]、[批號]、[版號]、[Defect code] !";
                }
                else
                {
                    if (piece.Contains("all"))
                    {
                        drawingResult = singlePanelModel.drawingAllPanels(station.Trim(), lot.Trim(), defect_code);

                    }
                    else
                    {
                        //int singlePanel_result = singlePanelModel.createSinglePanelData(station.Trim(), lot.Trim(), piece.Trim());
                        //if (singlePanel_result == 1)
                        //{
                            drawingResult = singlePanelModel.drawingSinglePanel(station.Trim(), lot.Trim(), piece.Trim(), defect_code);
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
                if(drawingResult == 1 && singlePanelModel.imgList.Rows.Count>0)
                {
                    writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單片畫圖", "開始畫圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "pass", singlePanelModel.message, station, lot, piece, defect_code, "", "", "");
                }
                else
                {
                    writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單片畫圖", "開始畫圖", Convert.ToInt32(ts2.TotalMilliseconds / 1000), "fail", singlePanelModel.message, station, lot, piece, defect_code, "", "", "沒有產出單片圖檔");
                }
            }


            if (station == "AVI")
            {
                DataAVI model_AVI = new DataAVI();
                //DataTable dt_lotList = model_AVI.getLotList();
                ViewBag.Station = station;
                ViewBag.Lot = lot;
                ViewBag.MaxTotalPanel = model_AVI.maxTotalPanel;
                ViewBag.Piece = piece;
                ViewBag.DefectCodeList = model_AVI.defectCodeList;
                //ViewBag.LotList = model_AVI.lotList;
            }
            else if (station == "AOI")
            {
                DataAOI model_AOI = new DataAOI();
                //DataTable dt_lotList = model_AOI.getLotList();
                ViewBag.Station = station;
                ViewBag.Lot = lot;
                ViewBag.MaxTotalPanel = model_AOI.maxTotalPanel;
                ViewBag.Piece = piece;
                ViewBag.DefectCodeList = model_AOI.defectCodeList;
                //ViewBag.LotList = model_AOI.lotList;
            }
            else if (station == "TST")
            {
                DataTST model_TST = new DataTST();
                //DataTable dt_lotList = model_TST.getLotList();
                ViewBag.Station = station;
                ViewBag.Lot = lot;
                ViewBag.MaxTotalPanel = model_TST.maxTotalPanel;
                ViewBag.Piece = piece;
                ViewBag.DefectCodeList = model_TST.defectCodeList;
            }
            else
            {
                ViewBag.Station = "";
                ViewBag.Lot = "";
                ViewBag.MaxTotalPanel = 0;
                ViewBag.Piece = "";
                ViewBag.DefectCodeList = new List<string>();
                ViewBag.LotList = new List<string>();
            }

            ViewBag.SelectedDefect = defect_code;
            
            return View(singlePanelModel.imgList);
        }

        //[HttpPost]
        //public ActionResult SinglePanel_Download(FormCollection post)
        //{
        //    SinglePanelModels singlePanelModel = new SinglePanelModels();
        //    string station = post["station_input"].Trim();
        //    string lot = post["lot_input"].Trim();
        //    string piece = post["piece_input"].Trim();
        //    string defect_code = post["defect_code"];
        //    string press_item = post["press_item"];
        //    int drawingResult = 0;

        //    int singlePanel_result = singlePanelModel.createSinglePanelData(station.Trim(), lot.Trim(), piece.Trim());
        //    if (singlePanel_result == 1)
        //    {
        //        drawingResult = singlePanelModel.drawingSinglePanel(station.Trim(), lot.Trim(), piece.Trim(), defect_code);
        //    }
        //    ViewBag.TestMsg = singlePanelModel.message;
        //    if (string.IsNullOrEmpty(station) || string.IsNullOrEmpty(lot) || string.IsNullOrEmpty(piece) || string.IsNullOrEmpty(defect_code))
        //    {
        //        ViewBag.TestMsg = "請輸入完整[站別]、[批號]、[版號]、[Defect code] !";
        //    }

        //    if (drawingResult == 1)
        //    {
        //        // 讀取server的壓縮檔並下載
        //        FileStream fs = new FileStream(singlePanelModel.picDir + "\\singlePanel.zip", FileMode.Open, FileAccess.Read);
        //        return File(fs, "application/zip", lot.Trim() + "_singlePanels.zip");
        //    }

        //    return View("SinglePanel");

        //}


        [HttpPost]
        public ActionResult Item_Download(FormCollection post)
        {
            string img_src = post["img_src"].Trim();
            string[] str_split = img_src.Split('\\');
            string fname = str_split[str_split.Length - 1].Trim();
            WriteToLog writeToLog = new WriteToLog();

            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單片畫圖", "單片下載", 0, "", "", "", "", "", "", "", "", "下載來源:" + img_src);

            FileStream stream = new FileStream(img_src, FileMode.Open, FileAccess.Read, FileShare.Read);
            return File(stream, "application/octet-stream", fname); //MME 格式 可上網查 此為通用設定

        }

        [HttpPost]
        public ActionResult All_Pictures_Download(FormCollection post)
        {
            string lot = post["download_lot"].Trim();
            SinglePanelModels singlePanelModel = new SinglePanelModels();

            WriteToLog writeToLog = new WriteToLog();

            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單片畫圖", "全部下載", 0, "", "", "", "", "", "", "", "", "下載來源:" + singlePanelModel.picDir + "\\singlePanel.zip");
            // 讀取server的壓縮檔並下載
            if (!Directory.Exists(singlePanelModel.picDir + "\\singlePanel.zip"))
            {
                FileStream fs = new FileStream(singlePanelModel.picDir + "\\singlePanel.zip", FileMode.Open, FileAccess.Read);
                return File(fs, "application/zip", lot + "_singlePanels.zip");
            }
            else
            {
                return View("SinglePanel");
            }
           
        }

        public FileResult Image(string imgSrc)
        {
            Tool tool = new Tool();
            WriteToLog writeToLog = new WriteToLog();

            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "單片畫圖", "查看圖檔", 0, "", "", "", "", "", "", "", "", "圖檔來源:" + imgSrc);

            byte[] image = tool.GetBytesFromImage(imgSrc);
            return new FileContentResult(image, "image/jpeg");
        }


    }
}