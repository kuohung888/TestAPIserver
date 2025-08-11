using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
// 在 Register.aspx.cs 最上方加入
using Newtonsoft.Json;
using System.Dynamic;

public partial class fullEx01_textboxApp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            // 初始化生日欄位為今日日期
            txtBirthday.Text = DateTime.Today.ToString("yyyy-MM-dd");
            cvBirthday.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd"); // 新增這行
        }

    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // 檢查重複註冊（姓名+郵件組合需唯一）
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();

            if (IsUserRegistered(name, email))
            {
                lblMessage.Text = "該用戶已註冊過，請使用其他姓名或郵件";
                lblMessage.CssClass = "error-message";
               
                return;
            }

            // 儲存到 Web Storage (JSON 格式)
            SaveToWebStorage(new
            {
                Name = name,
                Birthday = txtBirthday.Text,
                Email = email,
                Account = txtAccount.Text,
                Password = txtPassword.Text, // 實際應用需加密
                Phone = txtPhone.Text,
                Interest = ddlInterest.SelectedValue,
                RegisterDate = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")
            });

            // 顯示成功訊息
            lblMessage.Text = "註冊成功！";
            lblMessage.CssClass = "success-message";
            pnlResult.Visible = true;

            // 顯示註冊結果（密碼部分處理）
            litName.Text = txtName.Text;
            litBirthday.Text = txtBirthday.Text;
            litEmail.Text = txtEmail.Text;
            litAccount.Text = txtAccount.Text;
            litPassword.Text = MaskPassword(txtPassword.Text); // 呼叫密碼屏蔽函數
            litPhone.Text = txtPhone.Text;
            litInterest.Text = ddlInterest.SelectedItem.Text;
        }
    }


    // 檢查重複註冊
    private bool IsUserRegistered(string name, string email)
    {
        string storageKey = "RegisteredUsers";
        string jsonData = Context.Request.Cookies[storageKey]?.Value ?? "[]";

        try
        {
            var users = JsonConvert.DeserializeObject<List<ExpandoObject>>(jsonData);
            return users?.Any(u =>
                ((IDictionary<string, object>)u).ContainsKey("Name") &&
                ((IDictionary<string, object>)u)["Name"]?.ToString() == name &&
                ((IDictionary<string, object>)u)["Email"]?.ToString() == email
            ) ?? false;
        }
        catch
        {
            return false;
        }
    }


    // 儲存到 Web Storage (使用 Cookie 模擬)
    private void SaveToWebStorage(dynamic userData)
    {
        const string storageKey = "RegisteredUsers";

        try
        {
            // 1. 讀取現有資料（安全反序列化）
            var cookie = HttpContext.Current.Request.Cookies[storageKey];
            var users = new List<dynamic>();

            if (cookie != null && !string.IsNullOrEmpty(cookie.Value))
            {
                users = JsonConvert.DeserializeObject<List<dynamic>>(cookie.Value)
                        ?? new List<dynamic>();
            }

            // 2. 加入新資料（型別檢查）
            if (userData != null)
            {
                users.Add(new
                {
                    Name = userData.Name?.ToString() ?? string.Empty,
                    Email = userData.Email?.ToString() ?? string.Empty
                    // 其他必要屬性...
                });
            }

            // 3. 寫回Cookie（安全序列化）
            var newCookie = new HttpCookie(storageKey, JsonConvert.SerializeObject(users))
            {
                Expires = DateTime.Now.AddYears(1),
                HttpOnly = true,  // 增強安全性
                Secure = true     // 建議HTTPS環境啟用
            };

            HttpContext.Current.Response.Cookies.Set(newCookie);
        }
        catch (JsonException ex)
        {
            // 日誌記錄錯誤
            System.Diagnostics.Debug.WriteLine($"JSON處理失敗: {ex.Message}");

            // 重建乾淨的Cookie
            HttpContext.Current.Response.Cookies[storageKey].Value = "[]";
        }
    }


    // 密碼屏蔽函數
    private string MaskPassword(string originalPassword)
    {
        if (string.IsNullOrEmpty(originalPassword) || originalPassword.Length <= 4)
        {
            return "****"; // 長度不足時全部屏蔽
        }

        string visiblePart = originalPassword.Substring(0, 4);
        return $"{visiblePart}****"; // 範例：abcd****
    }


    
}