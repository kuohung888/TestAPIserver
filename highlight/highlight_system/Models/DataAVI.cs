using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace highlight_system.Models
{
    public class DataAVI
    {
        public List<string> defectCodeList { get; set; }
        public List<string> lotList { get; set; }
        public int maxTotalPanel { get; set; }
        public Dictionary<string, string> columnNameDict { get; set; }

        private string strDBConnectionString = "";

        public string fDBServerIP = "127.0.0.1";//string.Empty;
        public string fDBPort = "3306";//string.Empty;
        public string fDBServiceName = "hlsystem_avi";//string.Empty;
        public string fDBAccount = "root";//string.Empty;
        public string fDBPasswd = "2dxigull";//string.Empty;

        DB_CRUD db;
        public string connMsg = "";

        public DataAVI()
        {
            lotList = new List<string>();
            setColumnName();
            //DBConnect();
            getDefectCode();
            maxTotalPanel = getMaxTotalPanel();
        }

        public bool DBConnect()
        {
            strDBConnectionString = string.Format("server={0};Port={1}; user id={2}; password={3}; database={4}; Charset=utf8;",
                    this.fDBServerIP, this.fDBPort, this.fDBAccount, this.fDBPasswd, this.fDBServiceName);

            db = new DB_CRUD(strDBConnectionString);
            if (!db.DBConnect(ref connMsg))
            {
                Console.WriteLine("connMsg: " + connMsg);
                return false;
            }
            return true;
        }

        public void setColumnName()
        {
            columnNameDict = new Dictionary<string, string>();
            columnNameDict.Add("DWG", "圖號");
            columnNameDict.Add("model_num", "料號板序");
            columnNameDict.Add("lot_num", "批號");
            columnNameDict.Add("defect_code", "缺點碼");
            columnNameDict.Add("detail_defect_code", "缺點名稱");
            columnNameDict.Add("total_fail_qty", "缺點顆數");
            columnNameDict.Add("non_common_fail_qty", "非共同點顆數");
            columnNameDict.Add("common_point_fail_qty", "共同點");
            columnNameDict.Add("common_fail_qty", "共同點顆數");
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
            try
            {

                db.ExecuteSQL(strSQL, dt);
            }
            catch
            {
                return null;
            }
            // 分配到list
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

        public DataTable getCommonDefectList(string startTime = "", string endTime = "", string DWG = "", string model_num = "", string lot = "", string defect_code = "", string defect_code_name = "")
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
                strWHERE = strWHERE + " AND t1.`model_num` LIKE '%" + model_num + "%'";
            }
            if (!string.IsNullOrEmpty(lot))
            {
                strWHERE = strWHERE + " AND t1.`lot_num`='" + lot + "'";
            }
            if (!string.IsNullOrEmpty(defect_code))
            {
                strWHERE = strWHERE + " AND t1.`defect_code` ='" + defect_code + "'";
            }
            if (!string.IsNullOrEmpty(defect_code_name))
            {
                strWHERE = strWHERE + " AND t1.`detail_defect_code` LIKE '%" + defect_code_name + "%'";
            }

            strSQL = @"SELECT t2.`DWG`, t1.`model_num`, `lot_num`, `defect_code`, `detail_defect_code`, 
                                         `total_fail_qty`, `non_common_fail_qty`, `common_point_fail_qty`, `common_fail_qty`, date_format(t1.`datetime`, '%Y/%m/%d %H:%i:%s') `datetime` 
                                    FROM `common_defect_statistics_report` t1
                                    LEFT JOIN `model` t2 ON t1.`model_num`=t2.`model_num` 
                                    WHERE t1.`datetime` BETWEEN '" + startTime + "' AND '" + endTime + "' " + strWHERE +
                                    " ORDER BY t1.`datetime` DESC;";
            //执行查询
            db.ExecuteSQL(strSQL, dt);

            db.DBDisconnect();

            return dt;
        }

        // pass_info=0顯示金面pass與fail所有批號，pass_info=1只顯示金面pass，pass_info=2只顯示金面fail
        public DataTable getJinMianDefectList(string startTime = "", string endTime = "", string DWG = "", string model_num = "", string lot = "", int pass_info = 0)
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
                strWHERE = strWHERE + " AND t3.`DWG` LIKE '%" + DWG + "%'";
            }
            if (!string.IsNullOrEmpty(model_num))
            {
                strWHERE = strWHERE + " AND t1.model_num LIKE'%" + model_num + "%' ";
            }
            if (!string.IsNullOrEmpty(lot))
            {
                strWHERE = strWHERE + " AND t1.lot_num='" + lot + "' ";
            }
            if (pass_info == 1)
            {
                strWHERE = strWHERE + " AND (t2.`defect_code` != '金面汙染_Total' OR t2.`single_panel` NOT IN('V') OR `single_panel` IS NULL) ";
            }
            else if (pass_info == 2)
            {
                strWHERE = strWHERE + " AND t2.`defect_code` = '金面汙染_Total' AND t2.`single_panel` = 'V' ";
            }

            strSQL = @"SELECT t3.`DWG`, t1.`model_num`, t1.`lot_num`, t2.`defect_code`, t2.`single_panel_num_list`, date_format(t1.`datetime`, '%Y/%m/%d %H:%i:%s') `datetime`, t2.`single_panel`
                                FROM `lotlist` `t1` 
                                LEFT JOIN `g1_hlreport` `t2` ON `t1`.`lot_num`=`t2`.`lot_num`
								LEFT JOIN `model` t3 ON t1.`model_num`=t3.`model_num` 
                                WHERE `t1`.`datetime` BETWEEN '" + startTime + "' AND '" + endTime + "' " + strWHERE +
                                "ORDER BY `t1`.`datetime` DESC";
            try
            {
                //执行查询
                db.ExecuteSQL(strSQL, dt);
            }
            catch
            {
                return new DataTable();
            }

            db.DBDisconnect();

            return dt;
        }

        // 取得"綠漆(scum)殘留"的LIST
        public DataTable getScumDefectList(string startTime = "", string endTime = "", string DWG = "", string model_num = "", string lot = "", int pass_info = 0)
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
                strWHERE = strWHERE + " AND t3.`DWG` LIKE '%" + DWG + "%'";
            }
            if (!string.IsNullOrEmpty(model_num))
            {
                strWHERE = strWHERE + " AND t1.model_num LIKE'%" + model_num + "%' ";
            }
            if (!string.IsNullOrEmpty(lot))
            {
                strWHERE = strWHERE + " AND t1.lot_num='" + lot + "' ";
            }

            if (pass_info == 1)
            {
                strWHERE = strWHERE + " AND (t2.`defect_code` <> '綠漆(scum)殘留' OR t2.`single_panel` NOT IN('V') OR `single_panel` IS NULL) ";
            }
            else if (pass_info == 2)
            {
                strWHERE = strWHERE + " AND t2.`defect_code` = '綠漆(scum)殘留' AND t2.`single_panel` = 'V' ";
            }

            strSQL = @"SELECT t3.`DWG`, t1.`model_num`, t1.`lot_num`, t2.`defect_code`, t2.`single_panel_num_list`, date_format(t1.`datetime`, '%Y/%m/%d %H:%i:%s') `datetime`, t2.`single_panel`
                                FROM `lotlist` `t1` 
                                LEFT JOIN `g1_hlreport` `t2` ON `t1`.`lot_num`=`t2`.`lot_num`
								LEFT JOIN `model` t3 ON t1.`model_num`=t3.`model_num` 
                                WHERE `t1`.`datetime` BETWEEN '" + startTime + "' AND '" + endTime + "' " + strWHERE +
                                "ORDER BY `t1`.`datetime` DESC";
            try
            {
                //执行查询
                db.ExecuteSQL(strSQL, dt);
            }
            catch
            {
                return new DataTable();
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
            try
            {

                //执行查询
                db.ExecuteSQL(strSQL, dt);
            }catch
            {
                return 0;
            }

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
                    if(table.Columns[i].ColumnName == "single_panel_num_list") // 版號欄位因為有"逗號"區隔，在CSV需用""包起來才會放在一格中
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


        public DataTable getAuPollutionAiResult(string startTime = "", string endTime = "", string DWG = "", string model_num = "", string lot = "", int defect_calss=0)
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
                strWHERE = strWHERE + " AND t3.`DWG` LIKE '%" + DWG + "%'";
            }
            if (!string.IsNullOrEmpty(model_num))
            {
                strWHERE = strWHERE + " AND t1.model_num LIKE'%" + model_num + "%' ";
            }
            if (!string.IsNullOrEmpty(lot))
            {
                strWHERE = strWHERE + " AND t1.lot_num='" + lot + "' ";
            }
            if (defect_calss == 1)
            {
                strWHERE = strWHERE + " AND `ai_defect_class`='panel' ";
            }
            else if (defect_calss == 2)
            {
                strWHERE = strWHERE + " AND `ai_defect_class`='strip' ";
            }

            strSQL = @"SELECT t3.`DWG`, t1.`model_num`, t1.`lot_num`, t1.`panel_num`, t1.`ai_defect_class`, t1.`pe_defect_class`, t1.`match_status`, date_format(t1.`datetime`, '%Y/%m/%d %H:%i:%s') `datetime`
                                FROM `au_pollution_ai_model_detect` `t1` 
								LEFT JOIN `model` t3 ON t1.`model_num`=t3.`model_num` 
                                WHERE `t1`.`datetime` BETWEEN '" + startTime + "' AND '" + endTime + "' " + strWHERE +
                                "ORDER BY `t1`.`datetime` DESC";
            //执行查询
            db.ExecuteSQL(strSQL, dt);

            db.DBDisconnect();
            return dt;
        }


        public bool updateAuPollutionAiResult(List<string> au_result_table)
        {
            DBConnect();
            string strSQL = string.Empty;
            string pe_defect_class = string.Empty, lot_num = string.Empty, panel_num = string.Empty, datetime = string.Empty;
            string[] split_str; 

            try
            {
                db.BeginTransaction();
                for (int i = 0; i < au_result_table.Count; i++)
                {
                    if (string.IsNullOrEmpty(au_result_table[i])) continue;

                    split_str = au_result_table[i].Split('-');
                    lot_num = split_str[0];
                    panel_num = split_str[1];
                    datetime = split_str[2];
                    pe_defect_class = split_str[3];

                    strSQL = @" UPDATE `au_pollution_ai_model_detect` SET 
                                                              `pe_defect_class` = @pe_defect_class 
                                            WHERE `lot_num` = @lot_num 
                                            AND `panel_num` = @panel_num
                                            AND `datetime` = @datetime";

                    db.Add_Param("pe_defect_class", pe_defect_class);
                    db.Add_Param("lot_num", lot_num);
                    db.Add_Param("panel_num", panel_num);
                    db.Add_Param("datetime", datetime);

                    db.ExecuteDML(strSQL);
                }



                db.Commit();
                
            }
            catch (Exception ex)
            {
                db.Rollback();
                
                db.DBDisconnect();
                return false;
            }

            db.DBDisconnect();
            return true;
        }


        public DataTable getPanelObject(string defect_code_name)
        {
            DBConnect();
            DataTable dt = new DataTable();
            string strSQL = string.Empty;
            string strWHERE = string.Empty;
            
            if (!string.IsNullOrEmpty(defect_code_name))
            {
                strWHERE = strWHERE + " AND `defect_code_name` LIKE '%" + defect_code_name + "%'";
            }
            strSQL = @"SELECT * FROM `spec` WHERE 1=1 " + strWHERE;
            
            //执行查询
            db.ExecuteSQL(strSQL, dt);
            db.DBDisconnect();

            return dt;
        }

    }
    

}