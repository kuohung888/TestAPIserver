using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myEx_textbox4 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        // 判斷是否為首次載入頁面（非回傳）
        if (!IsPostBack)
        {
            lblIDResult.Text = "";
        }
    }

    // 點擊驗證按鈕時觸發
    protected void btnValidateID_Click(object sender, EventArgs e)
    {
        try
        {
            // 取得輸入值並去除前後空格，轉換為大寫

            string idNumber = txtIDNumber.Text.Trim().ToUpper();

            if (txtIDNumber.Text=="") {
                lblIDResult.Text = "身分證號碼不得空白";
                lblIDResult.ForeColor = System.Drawing.Color.Red;
            }
            else if(IsValidTaiwanID(idNumber)){              // 呼叫驗證函式並顯示結果
                lblIDResult.Text = "身分證號碼格式正確";
                lblIDResult.ForeColor = System.Drawing.Color.Green;// 設定成功樣式（綠色文字）
            }
            else
            {
                lblIDResult.Text = "身分證號碼格式錯誤";
                lblIDResult.ForeColor = System.Drawing.Color.Red; // 設定錯誤樣式（紅色文字）
            }
        }
        catch (Exception)
        {
            lblIDResult.Text = "請輸入正確的身分證號碼";

        }
    }

    private bool IsValidTaiwanID(string id)
    {
        if (string.IsNullOrEmpty(id) || id.Length != 10)
            return false;

        // 第一碼必須是英文字母
        if (!Regex.IsMatch(id[0].ToString(), "[A-Z]"))
            return false;

        // 第二碼必須是1或2
        if (id[1] != '1' && id[1] != '2')
            return false;

        // 後8碼必須是數字
        if (!Regex.IsMatch(id.Substring(2), @"^\d{8}$"))
            return false;

        // 驗證檢查碼
        int[] weights = { 1, 9, 8, 7, 6, 5, 4, 3, 2, 1 };
        int sum = 0;

        // 處理字母部分
        int letterValue = (int)id[0] - (id[0] <= 'H' ? 55 : (id[0] <= 'N' ? 56 : 57));
        sum += (letterValue / 10) * weights[0];
        sum += (letterValue % 10) * weights[1];

        // 處理數字部分
        for (int i = 1; i < 10; i++)
        {
            sum += int.Parse(id[i].ToString()) * weights[i];
        }

        return sum % 10 == 0;
    }
}