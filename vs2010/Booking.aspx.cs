using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Booking : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnBook_Click(object sender, EventArgs e)
    {
        // 觸發所有驗證
        Page.Validate();
        if (!Page.IsValid) return;

        // 驗證通過，顯示訂票訊息
        lblMsg.Text = $"已成功訂票：\n出發 {txtFrom.Text}\n回程 {txtTo.Text}";
    }
}