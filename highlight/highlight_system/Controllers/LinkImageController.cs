using highlight_system.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.NetworkInformation;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace highlight_system.Controllers
{
    public class Coordinate
    {
        public int X { get; set; }
        public int Y { get; set; }
    }

    public class PanelObject
    {
        public int Panel_X_Num { get; set; }
        public int Panel_Y_Num { get; set; }
        public int Strip_X_Num { get; set; }
        public int Strip_Y_Num { get; set; }
        public List<Coordinate> defect_coord_json { get; set; }
    }

    public class LinkImageController : Controller
    {
        // GET: LinkImage
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult LinkImage()
        {
            DataAVI model_AVI = new DataAVI();
            //DataTable dt_lotList = model_AVI.getLotList();
            ViewBag.Lot = "L220907140";
            ViewBag.MaxTotalPanel = model_AVI.maxTotalPanel;
            ViewBag.SelectedPanel = 14;
            ViewBag.Piece = "";
            ViewBag.DefectCodeList = model_AVI.defectCodeList;
            ViewBag.SelectedDefect = "金面汙染_Total";

            return View();
        }

        [HttpPost]
        public ActionResult LinkImage(FormCollection post)
        {
            //DataTable dt_lotList = model_AVI.getLotList();
            string lot = post["lot_input"].Trim();
            string piece = post["panel_num_Select"].Trim();
            string defect_code = post["defect_code"].Trim();

            DataAVI model_AVI = new DataAVI();
            WriteToLog writeToLog = new WriteToLog();

            ViewBag.Lot = lot;
            ViewBag.MaxTotalPanel = model_AVI.maxTotalPanel;
            ViewBag.SelectedPanel = int.Parse(piece);
           ViewBag.DefectCodeList = model_AVI.defectCodeList;
            ViewBag.SelectedDefect = defect_code;

            if (string.IsNullOrEmpty(lot))
            {
                ViewBag.ErrMsg = "請入[批號]";
                return View();
            }

            PanelObject panelObject = getPanelObject(lot, piece, defect_code);

            if(panelObject!=null)
            {
                ViewBag.Panel_X_Num = panelObject.Panel_X_Num;
                ViewBag.Panel_Y_Num = panelObject.Panel_Y_Num;
                ViewBag.Strip_X_Num = panelObject.Strip_X_Num;
                ViewBag.Strip_Y_Num = panelObject.Strip_Y_Num;
                //Newtonsoft.Json序列化
                string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(panelObject.defect_coord_json);
                ViewBag.defect_json_str = jsonData;
            }
            else
            {
                ViewBag.ErrMsg = "查無 " + lot + "_"+ piece+ "_" + defect_code;
            }

            return View();
        }

        [HttpPost]
        public ActionResult View_Pic(FormCollection post)
        {
            string lot = post["lot_input"].Trim();
            string piece = post["panel_num_Select"].Trim();
            string defect_code = post["defect_code"].Trim();
            string defect_array = post["defect_array"].Trim();
            string selected_defect_array_transfer_index = post["selected_defect_array_transfer_index"].Trim();

            List<Coordinate> coord = Newtonsoft.Json.JsonConvert.DeserializeObject<List<Coordinate>>(defect_array);
            List<Coordinate> selected_coord = new List<Coordinate>();
            string[] select_idx = selected_defect_array_transfer_index.Split(',');
            for (int i = 0; i < select_idx.Length; i++)
            {
                if(select_idx[i].Equals("1"))
                {
                    selected_coord.Add(coord[i]);
                }
            }

            //Newtonsoft.Json序列化
            //string jsonData = Newtonsoft.Json.JsonConvert.SerializeObject(selected_coord);

            ViewBag.Lot = lot;
            ViewBag.SelectedPanel = int.Parse(piece);
            ViewBag.SelectedDefect = defect_code;
            ViewBag.defect_array = selected_coord;

            List<string> img_list = new List<string>();
            for(int i = 0; i< selected_coord.Count; i++)
            {
                if (i % 5 == 0)
                {
                    img_list.Add("../../img/AVI_images/L220419060 0801_(00092,00253)_16_T_(022,004)_70_18_P_000_00.jpg");
                }
                else if(i % 5==1)
                {
                    img_list.Add("../../img/AVI_images/L220419060 0801_(00429,00507)_7_T_(010,005)_70_44_F_306_03.jpg");
                }
                else if (i % 5 == 2)
                {
                    img_list.Add("../../img/AVI_images/L220419060 0801_(00483,00216)_4_T_(005,002)_70_16_P_900_47.jpg");
                }
                else if (i % 5 == 3)
                {
                    img_list.Add("../../img/AVI_images/L220419060 0801_(00841,00794)_16_T_(014,003)_70_18_P_000_00.jpg");
                }
                else if (i % 5 == 4)
                {
                    img_list.Add("../../img/AVI_images/L220419060 0801_(00875,00341)_4_T_(027,003)_70_44_F_306_03.jpg");
                }
            }
            ViewBag.img_list = img_list;

            return View("~/Views/LinkImage/ImageShowPage.cshtml");
        }

        public ActionResult ImageShowPage()
        {
            List<Coordinate> selected_coord = new List<Coordinate>();
            selected_coord.Add(new Coordinate { X = 1, Y = 1 });
            selected_coord.Add(new Coordinate { X = 1, Y = 13 });
            selected_coord.Add(new Coordinate { X = 16, Y = 8 });
            ViewBag.defect_array = selected_coord;

            List<string> img_list = new List<string>();
            img_list.Add("../../img/AVI_images/L220419060 0801_(00092,00253)_16_T_(022,004)_70_18_P_000_00.jpg");
            img_list.Add("../../img/AVI_images/L220419060 0801_(00483,00216)_4_T_(005,002)_70_16_P_900_47.jpg");
            img_list.Add("../../img/AVI_images/L220916091 0806_(00266,01147)_15_T_(027,002)_73_18_P_106_C1.jpg");
            ViewBag.img_list = img_list;

            return View();
        }
        

        public PanelObject getPanelObject(string lot, string panel_num, string defect_code_name)
        {
            NetworkInterface[] nics = NetworkInterface.GetAllNetworkInterfaces();
            string macid = nics[0].GetPhysicalAddress().ToString();
            DataAVI model_AVI = new DataAVI();
            
            string file_path = "";
            if (macid == "1C98EC1A6473") //K9伺服器
            {
                file_path = @"D:\HL_System_File\CommonPanelFileBackup\AVI\" + lot + ".txt";
            }
            else
            {
                file_path = @"\\10.16.22.228\HL_System_File\CommonPanelFileBackup\AVI\" + lot + ".txt";
            }

            // 沒有此檔案則回傳 null
            if(!System.IO.File.Exists(file_path))
            {
                return null;
            }
            
            // 取得 缺點名稱 的 代號
            DataTable defect_code_dt = model_AVI.getPanelObject(defect_code_name);
            PanelObject panelObject = new PanelObject();
            panelObject.defect_coord_json = new List<Coordinate>();
            string tempText;
            string[] tempSplit;
            string split_word;
            string[] codes;
            int num = 0;
            bool contains = false;

            using (System.IO.StreamReader readtext = new System.IO.StreamReader(file_path))
            {
                // 讀取此lot的txt檔案
                while ((tempText = readtext.ReadLine()) != null)
                {
                    if (tempText[0] == '[') break;
                    if (tempText.Contains("Panel_X_Num"))
                    {
                        tempSplit = tempText.Split('=');
                        if (int.TryParse(tempSplit[tempSplit.Length - 1], out num))
                        {
                            panelObject.Panel_X_Num = num;
                        }
                    }
                    else if(tempText.Contains("Panel_Y_Num"))
                    {
                        tempSplit = tempText.Split('=');
                        if (int.TryParse(tempSplit[tempSplit.Length - 1], out num))
                        {
                            panelObject.Panel_Y_Num = num;
                        }
                    }
                    else if (tempText.Contains("Strip_X_Num"))
                    {
                        tempSplit = tempText.Split('=');
                        if (int.TryParse(tempSplit[tempSplit.Length - 1], out num))
                        {
                            panelObject.Strip_X_Num = num;
                        }
                    }
                    else if (tempText.Contains("Strip_Y_Num"))
                    {
                        tempSplit = tempText.Split('=');
                        if (int.TryParse(tempSplit[tempSplit.Length - 1], out num))
                        {
                            panelObject.Strip_Y_Num = num;
                        }
                    }

                }

                while (tempText != null)
                {
                    if (tempText[0] == '[')
                    {
                        tempSplit = tempText.Split('_');
                        tempSplit = tempSplit[tempSplit.Length - 1].Split(']');
                        split_word = tempSplit[0];
                        // 找到片號
                        if (int.Parse(split_word) == int.Parse(panel_num)) break;
                    }
                    tempText = readtext.ReadLine();
                }

                while ((tempText = readtext.ReadLine()) != null)
                {
                    if (tempText[0] == '[') break;
                    tempSplit = tempText.Split('=');
                    split_word = tempSplit[tempSplit.Length - 1];
                    codes = split_word.Split(',');
                    for (int i = 0; i < codes.Length; i++)
                    {
                        // 找到此座標是否有查詢的defect code
                        contains = defect_code_dt.AsEnumerable().Any(row => codes[i] == row.Field<String>("defect_code_number"));
                        if(contains)
                        {
                            Coordinate coordinate = new Coordinate();
                            int out_num;
                            if (int.TryParse(tempSplit[0].Split(' ')[0].Split(':')[1], out out_num))
                            {
                                coordinate.X = out_num;
                            }
                            if (int.TryParse(tempSplit[0].Split(' ')[1].Split(':')[1], out out_num))
                            {
                                coordinate.Y = out_num;
                            }
                            panelObject.defect_coord_json.Add(coordinate);

                            break;
                        }
                    }

                }

            }


            return panelObject;
        }

    }
}