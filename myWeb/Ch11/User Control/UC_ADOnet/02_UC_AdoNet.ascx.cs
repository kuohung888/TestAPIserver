using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_UC_ADOnet_01_UC : System.Web.UI.UserControl
{

    //*********************************
    // 只有 set而已，所以是Write Only的屬性。
    public String newsClass
    {
        set
        {
            Label1.Text = value;
        }
    }
    //********************************


    protected void Page_PreRender(object sender, EventArgs e)
    {
        // ADO.NET程式可以寫在這裡，僅以SQL指令為例。
        Label3.Text = "Select * from test Where [Class] = " + Label1.Text;
        // 記得使用參數，避免資料隱碼攻擊！
    }

    protected void Page_Load(object sender, EventArgs e)   //***錯誤版！！***
    {
        // ADO.NET程式可以寫在這裡，僅以SQL指令為例。
        Label2.Text = "Select * from test Where [Class] = " + Label1.Text;
        // 記得使用參數，避免資料隱碼攻擊！
    }
}