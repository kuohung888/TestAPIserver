using highlight_system.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace highlight_system.Controllers
{
    public class PostingController : Controller
    {
        Stopwatch sw = new Stopwatch();
        TimeSpan ts2;

        // GET: Posting
        public ActionResult PostingFileGenerator()
        {
            ViewBag.SiteName = "AOI";
            return View();
        }

        [HttpPost]
        public ActionResult PostingFileGenerator(FormCollection post)
        {
            WriteToLog writeToLog = new WriteToLog();
            string station_number = post["station_input"].Trim();
            string lot_number = post["lot_input"].Trim();
            string site_name = post["site_name_options"].Trim();
            string part_num = post["partNum_input"].Trim();
            string version = post["version_input"].Trim();

            ViewBag.SiteName = site_name;
            ViewBag.Station = station_number;
            ViewBag.Lot = lot_number;
            ViewBag.PartNum = part_num;
            ViewBag.Version = version;

            //Posting_File_Generator_Class post_file_gen_class = new Posting_File_Generator_Class();
            //var result = post_file_gen_class.posting_file_generator(station_number, lot_number);
            Trigger_Lot_Class trigger_class = new Trigger_Lot_Class();
            bool result = false;
            string error_msg = "";

            if(site_name == "AOI")
            {
                result = trigger_class.AOI_Trigger_Lot_Result_to_HLSystem(station_number, lot_number, part_num, version);
                error_msg = trigger_class.error_msg;
            }
            else if(site_name == "AVI" || site_name == "TST")
            {
                result = trigger_class.AVI_TST_Trigger_Lot_Result_to_HLSystem(site_name, lot_number);
                error_msg = trigger_class.error_msg;
            }

            ViewBag.ResultMsg = (result) ? lot_number + " 過帳完成!   過帳完成後須等待1~2分鐘資料匯入時間喔! " :  error_msg;

            sw.Start();
            writeToLog.writeLog(DateTime.Now, writeToLog.GetIp(), "", "過帳", "過帳", Convert.ToInt32(ts2.TotalMilliseconds / 1000), result.ToString(), error_msg, site_name, lot_number, "", "", "", "", "站別碼="+ station_number + ",料號="+ part_num + ",版序="+ version);
            sw.Stop();
            ts2 = sw.Elapsed;

            return View();
        }
    }
}