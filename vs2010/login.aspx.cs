using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{// 按鈕點擊事件：執行帳密驗證
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        // 先隱藏前一次的訊息
        lblSuccess.Visible = false;

        string username = txtUser.Text.Trim();
        string password = txtPass.Text.Trim();

        if (ValidateUser(username, password))
        {
            // 如果驗證成功，顯示成功訊息
            lblSuccess.Text = "密碼正確，登入成功!";
            lblSuccess.Visible = true;

            // 若要自動導向可新增：
            // System.Threading.Thread.Sleep(1500);
            // Response.Redirect("Default.aspx");
        }
        else
        {
            // 驗證失敗，顯示錯誤訊息
            lblSuccess.Visible = false;
            lblMsg.Text = "帳號或密碼錯誤，請重新輸入。";
            lblMsg.Visible = true;
        }
    }

    // ValidateUser：使用參數化查詢檢查資料庫內的帳號／密碼
    private bool ValidateUser(string username, string password)
    {
        // 從 Web.config 讀取連線字串
        string connStr = System.Configuration.ConfigurationManager
                         .ConnectionStrings["EmployeeDbConn"].ConnectionString;
        string sql = @"
            SELECT COUNT(1) 
            FROM dbo.Users 
            WHERE Username = @user AND Password = @pass";

        using (SqlConnection conn = new SqlConnection(connStr))
        using (SqlCommand cmd = new SqlCommand(sql, conn))
        {
            // 加入參數，防止 SQL Injection
            cmd.Parameters.Add("@user", SqlDbType.NVarChar, 50).Value = username;
            cmd.Parameters.Add("@pass", SqlDbType.NVarChar, 50).Value = password;

            conn.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            return (count == 1);
        }
    }
}