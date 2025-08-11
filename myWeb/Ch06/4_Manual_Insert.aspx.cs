using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch06_4_Manual_Insert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Insert();
 
        // 呼叫 SqlDataSource1執行新增資料的命令，相關指令已經寫在HTML裡面了。

        Response.Write("新增資料成功！！");
    }
}
