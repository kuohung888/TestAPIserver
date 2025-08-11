using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_TextBox_Click : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //-- 1.x的寫法：
        //   TextBox1.Attributes[ "onclick"]   =   Page.GetPostBackEventReference(Button1);   

        //-- 2.0以後的寫法： 
        TextBox1.Attributes["onclick"] = ClientScript.GetPostBackEventReference(Button1, null);
        //-- 傳回字串，該字串可用於用戶端事件中造成回傳(PostBack)給伺服器。
        //-- 資料來源：  http://msdn.microsoft.com/zh-tw/library/ms153112

        //-- 重點，您必須在 .aspx檔最上方，@ Page指示詞裡面，設定 EnableEventValidation="false"才行！
    
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("<big><font color=darkgreen>您剛剛做了 Click動作 --</font></big>" + System.DateTime.Now.ToLongTimeString());
    }
}