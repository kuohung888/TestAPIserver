using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace highlight_system.Models
{
    public class DataTST
    {
        public List<string> defectCodeList { get; set; }
        public List<string> lotList { get; set; }
        public int maxTotalPanel { get; set; }
        public Dictionary<string, string> columnNameDict { get; set; }

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

        public DataTST()
        {
            lotList = new List<string>();
            setColumnName();
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

        public void setColumnName()
        {
            columnNameDict = new Dictionary<string, string>();
            columnNameDict.Add("DWG", "圖號");
            columnNameDict.Add("model_num", "料號板序");
            columnNameDict.Add("lot_num", "批號");
            columnNameDict.Add("defect_code", "缺點碼");
            columnNameDict.Add("detail_defect_code", "缺點名稱");
            columnNameDict.Add("datetime", "日期時間");
            columnNameDict.Add("single_panel_num_list", "板號");
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

            db.DBDisconnect();

            // 分配到list
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                lotList.Add(dt.Rows[i]["lot_num"].ToString());
            }

            return dt;
        }

        public DataTable getDimpleDefectList(string startTime = "", string endTime = "", string DWG = "", string model_num = "", string lot = "")
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
                endTime = DateTime.Now.ToString("yyyy-MM-dd");
            }
            if (!string.IsNullOrEmpty(DWG))
            {
                strWHERE = strWHERE + " AND t2.`DWG` LIKE '%" + DWG + "%'";
            }
            if (!string.IsNullOrEmpty(model_num))
            {
                strWHERE = strWHERE + " AND model_num LIKE '%" + model_num + "%'";
            }
            if (!string.IsNullOrEmpty(lot))
            {
                strWHERE = strWHERE + " AND lot_num='" + lot + "'";
            }

            strSQL = @"SELECT t2.`DWG`, t1.`model_num`, `lot_num`, `defect_code`, `single_panel_num_list`, date_format(`datetime`, '%Y/%m/%d %H:%i:%s') `datetime` 
                                FROM `g1_hlreport` t1
                                LEFT JOIN `model` t2 ON t1.`model_num`=t2.`model_num`
                                WHERE `single_panel` = 'V' AND `datetime` BETWEEN '" + startTime + "' AND '" + endTime + "' " + strWHERE + " ORDER BY `datetime` DESC;";
            //执行查询
            db.ExecuteSQL(strSQL, dt);

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

            if (dt.Rows.Count > 0)
            {
                return int.Parse(dt.Rows[0]["max_total_panel"].ToString());
            }
            else
            {
                return 1;
            }
        }
        public string ToCSV(DataTable table)
        {
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
                    if (table.Columns[i].ColumnName == "single_panel_num_list")
                    {
                        result.Append('"');
                        result.Append(row[i].ToString());
                        result.Append('"');
                    }
                    else
                    {
                        result.Append(row[i].ToString());
                    }
                    result.Append(i == table.Columns.Count - 1 ? "\n" : ",");
                }
            }

            return result.ToString();
        }

    }
}