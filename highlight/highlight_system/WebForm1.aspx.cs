using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace highlight_system
{
    public partial class WebForm1 : System.Web.UI.Page
    {


        protected void Button1_Click(object sender, EventArgs e)
        {
            // MySQL 連線參數
            string server = "127.0.0.1";
            string port = "3306";
            string database = "hlsystem_aoi";
            string user = "root";
            string password = "2dxigull";

            // 最簡連線字串
            string connStr = $"Server={server};Port={port};Database={database};Uid={user};Pwd={password};";

            using (var conn = new MySqlConnection(connStr))
            {
                try
                {
                    conn.Open();
                    ShowAlert("MySQL 連線成功！");

                    // 查前 200 筆
                    string sql = "SELECT * FROM defect_code_department LIMIT 200;";
                    using (var cmd = new MySqlCommand(sql, conn))
                    using (var da = new MySqlDataAdapter(cmd))
                    {
                        var dt = new DataTable();
                        da.Fill(dt);

                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    ShowAlert("MySQL 連線或查詢失敗：\n" + ex.Message);
                }
            }
        }

        /// <summary>
        /// 透過 JavaScript Alert 彈出訊息
        /// </summary>
        private void ShowAlert(string message)
        {
            // 處理單引號跳脫
            string msg = message.Replace("'", "\\'").Replace("\r\n", "\\n");
            string script = $"alert('{msg}');";

            // 如果頁面有 ScriptManager
            if (ScriptManager.GetCurrent(this.Page) != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), Guid.NewGuid().ToString(), script, true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), Guid.NewGuid().ToString(), script, true);
            }
        }
    }
}