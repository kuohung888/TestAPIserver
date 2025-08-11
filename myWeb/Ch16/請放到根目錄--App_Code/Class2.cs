using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Class2 的摘要描述
/// </summary>
public class Class2
{
	public Class2()
	{
		//
		// TODO: 在這裡新增建構函式邏輯
		//
	}

    //********************************
    //** defense2() 「沒有」設定 static。
    //********************************
    public void defense2()
    {
        HttpContext.Current.Response.Write("<br /><br /><font color=blue>");
        HttpContext.Current.Response.Write("<h3>此為網站管理區，外人莫入！</h3></font>");

        if (HttpContext.Current.Session["Login"] == null)   //***C#不加上這一段會報錯。
        {
            HttpContext.Current.Response.Write("<h3><font color=red><b>嚴重警告！</b></font>您的帳號、密碼錯誤！是非法使用者～</h3>");
            HttpContext.Current.Response.End();     //--註解：程式立刻終止！
        }

        //============================================
        //== Session如果是 null，一使用就會報錯。所以要用上面的判別式來預防。
        //============================================
        if (HttpContext.Current.Session["Login"].ToString() == "OK")
        {
            HttpContext.Current.Response.Write("<h3>恭喜您，您成功登入，才會看見這一頁！</h3><hr />");
            HttpContext.Current.Response.Write("<br />您的個人資料是----<br>");
            HttpContext.Current.Response.Write("<br />    帳號 =>  " + HttpContext.Current.Session["u_name"].ToString());
            // HttpContext.Current.Response.Write("<br />    姓名 =>  " + HttpContext.Current.Session["u_realname"].ToString());
            // HttpContext.Current.Response.Write("<br />    密碼 =>  " + HttpContext.Current.Session["u_passwd"].ToString());
        }
        else
        {
            HttpContext.Current.Response.Write("<h3><font color=red><b>嚴重警告！</b></font>您的帳號、密碼錯誤！是非法使用者～</h3>");
            HttpContext.Current.Response.End();     //--註解：程式立刻終止！
        }

        HttpContext.Current.Response.Write("<h3>Session.SessionID -- " + HttpContext.Current.Session.SessionID + "</h3>");


        //*********************************************
        // 上面兩段程式可以改寫成 if ((String)Session["Login"] == "OK")
        // 取代上面兩段 if 判別式if (Session["Login"] == null) 與 if (Session["Login"].ToString() == "OK")

        // 因為.ToString()中，一定要有內容或是『 "" 』，
        // 如果為 null就會報錯(並未將物件參考設定為物件的執行個體。)，

        // 以上參考自MSDN中的Object.ToString()方法中的說明，
        // 『Your ToString override should not return String.Empty or a null string.』
        // http://msdn.microsoft.com/zh-tw/library/system.object.tostring.aspx
    }
}