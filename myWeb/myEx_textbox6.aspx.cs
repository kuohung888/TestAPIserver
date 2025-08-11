using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class myEx_textbox6 : System.Web.UI.Page
{

    // 判斷是否為首次載入頁面（非回傳）
    protected void Page_Load(object sender, EventArgs e)    

    {
        if (!IsPostBack)
        {
            lblPasswordStrength.Text = "密碼強度: 尚未輸入";
        }
    }

    // 當密碼文字改變時觸發（AutoPostBack=true）
    protected void txtPassword_TextChanged(object sender, EventArgs e) //計算強度分數
    {
        string password = txtPassword.Text;
        int strength = CalculatePasswordStrength(password);

        // 取得進度條控制項（HTML div）
        HtmlGenericControl progressBar = (HtmlGenericControl)FindControl("progressValue");
        progressBar.Attributes.Remove("class"); // 清除舊樣式

        //  根據分數設定UI顯示
        if (strength < 30)     // 弱（紅色30%）
        {
            progressBar.Attributes.Add("class", "progress-value weak");
            lblPasswordStrength.Text = "密碼強度: 弱";
            lblPasswordStrength.CssClass = "strength-text weak-text";
        }
        else if (strength < 70) // 中（黃色60%）
        {
            progressBar.Attributes.Add("class", "progress-value medium");
            lblPasswordStrength.Text = "密碼強度: 中";
            lblPasswordStrength.CssClass = "strength-text medium-text";
        }
        else
        {
            // 強（綠色100%）
            progressBar.Attributes.Add("class", "progress-value strong");
            lblPasswordStrength.Text = "密碼強度: 強";
            lblPasswordStrength.CssClass = "strength-text strong-text";
        }
    }

    /// <summary>
    /// 密碼強度評分算法
    /// <param name="password">待評估的密碼</param>
    /// <returns>強度分數 (0-100)</returns>
    private int CalculatePasswordStrength(string password)
    {
        if (string.IsNullOrEmpty(password))
            return 0;

        int strength = 0;

        // 長度檢查
        if (password.Length >= 8) strength += 20;
        if (password.Length >= 12) strength += 10;

        // 包含大寫字母
        if (Regex.IsMatch(password, "[A-Z]")) strength += 15;

        // 包含小寫字母
        if (Regex.IsMatch(password, "[a-z]")) strength += 15;

        // 包含數字
        if (Regex.IsMatch(password, "[0-9]")) strength += 15;

        // 包含特殊字符
        if (Regex.IsMatch(password, "[^a-zA-Z0-9]")) strength += 25;

        return Math.Min(strength, 100);
    }
    /// </summary>
}