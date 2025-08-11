using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace purchase_order_web.Models
{
    public class DB_Access
    {
        private string strDBConnectionString = "";

        public string fDBServerIP = ConfigurationManager.ConnectionStrings["DbUrl"].ConnectionString;//string.Empty;
        public string fDBPort = ConfigurationManager.ConnectionStrings["DbPort"].ConnectionString;//string.Empty;
        public string fDBServiceName = ConfigurationManager.ConnectionStrings["DbServer"].ConnectionString;//string.Empty;
        public string fDBAccount = ConfigurationManager.ConnectionStrings["DbAccount"].ConnectionString;//string.Empty;
        public string fDBPasswd = ConfigurationManager.ConnectionStrings["DbPassword"].ConnectionString;//string.Empty;
        DB_CRUD db;
        public string connMsg = "";

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

        public DataTable GetPRList(string ePrNum = "", string productName = "", string owner = "")
        {
            bool isConnected;
            DataTable dt = new DataTable();
            string strSQL = string.Empty;
            string strWhere = string.Empty;
            //执行查询
            try
            {
                isConnected = DBConnect();
                if (!isConnected)
                {
                    Console.WriteLine("DB連線失敗!");
                    return new DataTable();
                }

                if (!string.IsNullOrEmpty(ePrNum))
                {
                    strWhere = strWhere + " AND e_pr_num = '" + ePrNum + "'";
                }
                if (!string.IsNullOrEmpty(productName))
                {
                    strWhere = strWhere + " AND product_name = '" + productName + "'";
                }
                if (!string.IsNullOrEmpty(owner))
                {
                    strWhere = strWhere + " AND owner = '" + owner + "'";
                }
                strSQL = "SELECT * FROM `purchase_list` WHERE 1 " + strWhere;


                db.ExecuteSQL(strSQL, dt);

                db.DBDisconnect();
            }
            catch
            {
                return new DataTable();
            }


            return dt;

        }

    }
}