using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;

namespace highlight_system.Models
{
    public class WriteToLog
    { //public string fDBServerIP = "10.16.22.228";//string.Empty;
        public string fDBServerIP = "127.0.0.1";//string.Empty;
        public string fDBPort = "3306";//string.Empty;
        public string fDBServiceName = "hlsystem_aoi";//string.Empty;
                                                      //public string fDBAccount = "5910";//string.Empty;
                                                      // public string fDBPasswd = "5910";//string.Empty;

        public string fDBAccount = "root";//string.Empty;
        public string fDBPasswd = "2dxigull";//string.Empty;

        DB_CRUD db;
        private string strDBConnectionString = "";
        public string connMsg = "";

        public WriteToLog()
        {
            //DBConnect();
        }
        public void DBConnect()
        {
            strDBConnectionString = string.Format("server={0};Port={1}; user id={2}; password={3}; database={4}; Charset=utf8;",
                    this.fDBServerIP, this.fDBPort, this.fDBAccount, this.fDBPasswd, this.fDBServiceName);

            db = new DB_CRUD(strDBConnectionString);
            if (!db.DBConnect(ref connMsg))
            {
                Console.WriteLine("connMsg: " + connMsg);
            }
        }

        public void writeLog(DateTime datetime, string ip_address, string user, string web_page, string feature, int runtime, string result = null, 
            string message = null, string site = null, string lot_num = null, string single_panel_num_list = null, string defect_code = null,
            string startime = null, string endtime = null, string remark = null)
        {
            if (ip_address == "127.0.0.1" || ip_address == "::1" || ip_address == "10.16.93.90") return;

            string strSQL = string.Empty;
            int intRowCount;
            DBConnect();
            try
            {
                db.BeginTransaction();

                strSQL = @"INSERT INTO `web_log` 
                                                       (`datetime`, `IP_address`, `user`, `web_page`, `feature`, `runtime`, `result`, `messege`, 
                                                        `site`, `lot_num`, `single_panel_num_list`, `defect_code`, `start_time`, `end_time`, `remark`) 
                                      VALUES (@datetime, @IP_address, @user, @web_page, @feature, @runtime, @result, @messege, 
                                                        @site, @lot_num, @single_panel_num_list, @defect_code, @start_time, @end_time, @remark) ";

                db.Add_Param("datetime", datetime);
                db.Add_Param("IP_address", ip_address);
                db.Add_Param("user", user);
                db.Add_Param("web_page", web_page);
                db.Add_Param("feature", feature);
                db.Add_Param("runtime", runtime);
                db.Add_Param("result", result);
                db.Add_Param("messege", message);
                db.Add_Param("site", site);
                db.Add_Param("lot_num", lot_num);
                db.Add_Param("single_panel_num_list", single_panel_num_list);
                db.Add_Param("defect_code", defect_code);
                db.Add_Param("start_time", startime);
                db.Add_Param("end_time", endtime);
                db.Add_Param("remark", remark);

                intRowCount = db.ExecuteDML(strSQL);
                if (intRowCount != 1)
                {
                    throw new Exception(string.Format("Web Log寫入資料庫錯誤，寫入筆數「{0}」", intRowCount));
                }

                db.Commit();
                db.DBDisconnect();
            }
            catch (Exception ex)
            {
                db.Rollback();
                Debug.WriteLine(ex.ToString());
                db.DBDisconnect();
                return;
            }
        }


        public string GetIp()
        {
            string ip = System.Web.HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            if (string.IsNullOrEmpty(ip))
            {
                ip = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }

            return ip;
        }

    }
}