<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // 應用程式啟動時執行的程式碼
        if (Application["UsersOnline"] == null)
        {
            Application["UsersOnline"] = 0;   //註解：網站人數，從0開始算起。
        }

        //===========================================
        //== 網站公告
        Application["PublicMessage"] = "";
               
        //===========================================
        //== 連線字串寫在 Global.asax裡面 Application 
        Application["App_DBConnString"] = "Data Source=.;Initial Catalog=test;Persist Security Info=True;User ID=test;Password=test";
    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  應用程式關閉時執行的程式碼
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // 發生未處理錯誤時執行的程式碼
    }

    void Session_Start(object sender, EventArgs e) 
    {
        // 啟動新工作階段時執行的程式碼
        
        Session.Timeout = 1;    //註解：Session生命週期，縮短為1分鐘。   
        
        Application.Lock();
        Application["UsersOnline"] = Convert.ToInt32(Application["UsersOnline"]) + 1;
        Application.UnLock();            
    }

    void Session_End(object sender, EventArgs e) 
    {
        // 工作階段結束時執行的程式碼。 
        // 注意: 只有在 Web.config 檔將 sessionstate 模式設定為 InProc 時，
        // 才會引發 Session_End 事件。如果將工作階段模式設定為 StateServer 
        // 或 SQLServer，就不會引發這個事件。
        Application.Lock();
        Application["UsersOnline"] = Convert.ToInt32(Application["UsersOnline"]) - 1;
        Application.UnLock();
        
    }
       
</script>
