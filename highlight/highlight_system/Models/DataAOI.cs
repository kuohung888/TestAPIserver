using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace highlight_system.Models
{
    public class DataAOI
    {
        public List<string> defectCodeList { get; set; }
        public List<string> lotList { get; set; }
        public int maxTotalPanel { get; set; }

        private string strDBConnectionString = "";

        //public string fDBServerIP = "10.16.22.228";//string.Empty;
        public string fDBServerIP = "127.0.0.1";//string.Empty;
        public string fDBPort = "3306";//string.Empty;
        public string fDBServiceName = "hlsystem_aoi";//string.Empty;
       //public string fDBAccount = "5910";//string.Empty;
        // public string fDBPasswd = "5910";//string.Empty;

        public string fDBAccount = "root";//string.Empty;
        public string fDBPasswd = "2dxigull";//string.Empty;

        DB_CRUD db;
        public string connMsg = "";

        public DataAOI()
        {
            lotList = new List<string>();
            //DBConnect();
            getDefectCode();
            maxTotalPanel = getMaxTotalPanel();
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

        public DataTable getDefectCode()
        {
            DBConnect();

            defectCodeList = new List<string>();
            DataTable dt = new DataTable();
            string strSQL = string.Empty;
            strSQL = "SELECT DISTINCT `defect_code_name` FROM `spec` WHERE 1 ";
            //执行查询
            db.ExecuteSQL(strSQL, dt);

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                defectCodeList.Add(dt.Rows[i]["defect_code_name"].ToString());
            }

            db.DBDisconnect();

            return dt;
        }

        public DataTable getLotList(string DWG = "", string model_num = "", string startTime = "", string endTime = "")
        {
            DBConnect();

            DataTable dt = new DataTable();
            string strSQL = string.Empty;
            string strWHERE = string.Empty;
            if (string.IsNullOrEmpty(startTime))
            {
                startTime = DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd");
            }
            if (string.IsNullOrEmpty(endTime))
            {
                endTime = DateTime.Now.AddDays(1).ToString("yyyy-MM-dd");
            }
            strWHERE = strWHERE + " AND t2.`DWG` LIKE '%" + DWG + "%'";
            strWHERE = strWHERE + " AND t1.`model_num` LIKE '%" + model_num + "%'";

            strSQL = @"SELECT t2.`DWG`, t1.`model_num`, t1.`lot_num`, t1.`datetime`, t1.`total_panel` 
                                    FROM `lotlist` t1
									LEFT JOIN `model` t2 ON t1.`model_num`=t2.`model_num` 
                                    WHERE t1.`datetime` BETWEEN '" + startTime + "' AND '" + endTime + "' " + strWHERE +
                                    " GROUP BY t1.`lot_num`" +
                                    " ORDER BY t1.`datetime` DESC";
            //执行查询
            db.ExecuteSQL(strSQL, dt);

            // 分配到list
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                lotList.Add(dt.Rows[i]["lot_num"].ToString());
            }
            
            db.DBDisconnect();

            return dt;
        }

        public int getMaxTotalPanel()
        {
            DBConnect();
            DataTable dt = new DataTable();
            string strSQL = string.Empty;
            strSQL = "SELECT MAX(`total_panel`) max_total_panel FROM `lotlist` ";
            //执行查询
            db.ExecuteSQL(strSQL, dt);

            db.DBDisconnect();

            if (dt.Rows.Count>0)
            {
                return int.Parse(dt.Rows[0]["max_total_panel"].ToString());
            }
            else
            {
                return 1;
            }
        }


    }
}