using System;
using System.Collections.Generic;
using MySql.Data.MySqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace highlight_system.Models
{
    public class DB_CRUD
    {
        private string strDBConnectionString = "";
        public MySqlConnection fconConnection;
        private MySqlCommand fcmdCommand;
        public MySqlTransaction ftrans;

        //public string fDBServerIP = "10.16.22.228";//string.Empty;
        public string fDBServerIP = "127.0.0.1";//string.Empty;
        public string fDBPort = "3306";//string.Empty;
        public string fDBServiceName = "hlsystem_aoi";//string.Empty;
        //public string fDBAccount = "5910";//string.Empty;
       // public string fDBPasswd = "5910";//string.Empty;

        public string fDBAccount = "root";//string.Empty;
        public string fDBPasswd = "2dxigull";//string.Empty;

        public DB_CRUD()
        {
        }

        public DB_CRUD(string strConnStr)
        {
            strDBConnectionString = strConnStr;
        }

        public MySqlTransaction BeginTransaction(params MySqlCommand[] _cmds)
        {
            ftrans = this.fconConnection.BeginTransaction();

            for (int i = 0; i < _cmds.Length; i++)
            {
                if (_cmds[i] != null)
                {
                    _cmds[i].Transaction = ftrans;
                }
            }
            return ftrans;
        }
        public void Commit()
        {
            ftrans.Commit();
            ftrans = null;
        }
        public void Rollback()
        {
            ftrans.Rollback();
            ftrans = null;
        }
        public MySqlTransaction GetCurrentTransactionTran()
        {
            return ftrans;
        }
        public MySqlCommand CreateCommandInTrans()
        {
            MySqlCommand fcmdCommand = new MySqlCommand("", fconConnection);
            fcmdCommand.Transaction = this.ftrans;

            return fcmdCommand;

        }

        /// <summary>
        /// 開啟連接資料庫作業
        /// </summary>
        /// <param name="_ppsMsg">回傳初始結果</param>
        /// <returns></returns>
        public Boolean DBConnect(ref string _ppsMsg)
        {
            Boolean lbResult;


            if (strDBConnectionString.Trim().Equals(""))
            {
                fconConnection = new MySqlConnection(
                    string.Format("server={0};Port={1}; user id={2}; password={3}; database={4}; Charset=utf8;",
                    this.fDBServerIP, this.fDBPort, this.fDBAccount, this.fDBPasswd, this.fDBServiceName));
            }
            else
            {
                fconConnection = new MySqlConnection(strDBConnectionString);
            }

            fcmdCommand = new MySqlCommand("", fconConnection);

            if (fconConnection.State != ConnectionState.Open)
            {
                try
                {
                    fconConnection.Open();
                    lbResult = true;
                }
                catch (System.Exception ex)
                {
                    _ppsMsg = ex.Message.ToString();
                    lbResult = false;
                }
            }
            else
            {
                lbResult = true;
            }
            return lbResult;
        }

        public void DBDisconnect()
        {
            fconConnection.Close();
        }

        public MySqlConnection DBConnection
        {
            get { return fconConnection; }
        }

        public void Add_Param(string strName, object objValue)
        {
            fcmdCommand.Parameters.AddWithValue(strName, objValue);
        }

        public Boolean ExecuteSQL(string _psSQL, DataTable _ptabDestTable, Boolean _pClearData)
        {
            MySqlDataAdapter Adaptere;

            //清除舊資料
            if (_pClearData) { _ptabDestTable.Clear(); }

            _ptabDestTable.BeginLoadData();

            if (this.ftrans != null) fcmdCommand.Transaction = ftrans;

            fcmdCommand.CommandText = _psSQL;
            try
            {
                //下列方式會將表格欄位屬性全讀至DataTable中(Not Null)
                //_ptabDestTable.Load(fcmdCommand.ExecuteReader());

                Adaptere = new MySqlDataAdapter(fcmdCommand);
                Adaptere.Fill(_ptabDestTable);
                Adaptere.Dispose();
                Adaptere = null;
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                fcmdCommand.Parameters.Clear();
            }

            _ptabDestTable.EndLoadData();

            return true;
        }

        public Boolean ExecuteSQL(string _psSQL, DataTable _ptabDestTable)
        {
            ExecuteSQL(_psSQL, _ptabDestTable, true);
            return false;
        }

        public int ExecuteSQL(string _psSQL)
        {
            DataTable _ptabDestTable = new DataTable();
            ExecuteSQL(_psSQL, _ptabDestTable, true);
            return _ptabDestTable.Rows.Count;
        }

        public int ExecuteDML(string _psDMLSQL)
        {
            int intTmp = 0;

            if (this.ftrans != null)
                fcmdCommand.Transaction = ftrans;

            fcmdCommand.CommandText = _psDMLSQL;
            try
            {
                intTmp = fcmdCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                fcmdCommand.Parameters.Clear();
            }
            return intTmp;
        }

        public Boolean IsLive()
        {
            MySqlConnection conConnTest;
            MySqlConnectionStringBuilder scbConnTest;

            scbConnTest = new MySqlConnectionStringBuilder();
            scbConnTest.Database = this.fDBServerIP;
            scbConnTest.UserID = this.fDBAccount;
            scbConnTest.Password = this.fDBPasswd;
            scbConnTest.ConnectionTimeout = 1;
            scbConnTest.Pooling = false;
            conConnTest = new MySqlConnection(scbConnTest.ToString());
            try
            {
                if (fconConnection.State == ConnectionState.Closed)
                    return false;

                conConnTest.Open();
                conConnTest.Close();
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                conConnTest.Dispose();
                conConnTest = null;
                GC.Collect();
            }
        }
        
    }
}