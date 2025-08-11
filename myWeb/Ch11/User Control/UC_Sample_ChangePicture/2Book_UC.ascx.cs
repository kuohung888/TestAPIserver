using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_UC_Samples_Book_UC : System.Web.UI.UserControl
{


    private String displayBook_Value = "CS";   // 預設值
    public String DisplayBook    //公開屬性，DisplayBook
    {
        get   {
            return displayBook_Value;  // 外部呼叫之用。
        }
        set   {
            displayBook_Value = value;  // 預設值
        }
    }

    
    //沒有設定預設值，因為寫在 get裡面了。
    public String DisplayUrl    //公開屬性，DisplayUrl
    {
        get
        {   // 外部呼叫之用。
            object _navigateUrl = ViewState["NavigateUrl"];
            if (_navigateUrl != null)
                return (String)_navigateUrl;
            else
                return "http://www.dotblogs.com.tw/mis2000lab/";  
                // 都沒有選擇的話，就傳回這個URL
        }
        set   {
            ViewState["NavigateUrl"] = value;   // 預設值
        }
    }

    //=======================================

    //== 重點！！必須在 Page_PreRender這個事件才行！！ ==
    protected void Page_PreRender(object sender, EventArgs e)
    {
        // 因為UC的 Page_Load事件比較早執行，所以網頁（.aspx）的DropDownList無法控制這裡的變數。
        switch (DisplayBook)
        {
            case "CS":
                CSPanel.Visible = true;
                VBPanel.Visible = false;
                CSLink.HRef = DisplayUrl;
                // 因為超連結 <a>設定為 runat="server" 所以後置程式碼可以控制它
                break;

            case "VB":
                VBPanel.Visible = true;
                CSPanel.Visible = false;
                VBLink.HRef = DisplayUrl;
                // 因為超連結 <a>設定為 runat="server" 所以後置程式碼可以控制它
                break;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        // 寫在這裡不會動！！請寫在 Page_PreRender事件內。
    }
}