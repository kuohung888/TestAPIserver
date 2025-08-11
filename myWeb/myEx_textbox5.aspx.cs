using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myEx_textbox5 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnValidatePhone_Click(object sender, EventArgs e)
    {
        string phoneNumber = txtPhoneNumber.Text.Trim();

        if (IsValidTaiwanPhone(phoneNumber))
        {
            lblPhoneResult.Text = "手機號碼格式正確";
            lblPhoneResult.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblPhoneResult.Text = "手機號碼格式錯誤";
            lblPhoneResult.ForeColor = System.Drawing.Color.Red;
        }
    }

    private bool IsValidTaiwanPhone(string phone)
    {
        if (string.IsNullOrEmpty(phone))
            return false;

        // 移除所有非數字字符
        string cleanPhone = Regex.Replace(phone, @"[^\d]", "");

        // 台灣手機號碼通常為09開頭，共10位數字
        if (cleanPhone.Length != 10)
            return false;

        // 檢查是否以09開頭
        if (!cleanPhone.StartsWith("09"))
            return false;

        return true;
    }
}