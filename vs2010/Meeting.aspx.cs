using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Meeting : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    // 自訂驗證：會議日期不能早於今天
    protected void cvDate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        DateTime selected;
        // 嘗試解析使用者輸入的日期
        if (!DateTime.TryParse(args.Value, out selected))
        {
            args.IsValid = false;  // 無法解析視為不合法
            return;
        }

        // 若選擇日期小於今天 (不含當日)
        if (selected.Date < DateTime.Today)
        {
            args.IsValid = false;
        }
        else
        {
            args.IsValid = true;
        }
    }

    // 按鈕送出
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        Page.Validate(); // 觸發所有驗證
        if (!Page.IsValid)
        {
            return; // 驗證失敗，不執行後續
        }

        // 驗證通過
        lblResult.Text = "會議已成功預約於 " + txtDate.Text;
    }
}