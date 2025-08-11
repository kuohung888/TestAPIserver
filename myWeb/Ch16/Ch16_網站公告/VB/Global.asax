<%@ Application Language="VB" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' 應用程式啟動時執行的程式碼
        For i As Integer = 1 To 15
            Application("A" & i) = ""
        Next
        
        
        '===========================================
        '== 線上人數
        Application("UsersOnline") = 0

        '===========================================
        '== 網站公告
        Application("PublicMessage") = ""

        '===========================================
        '== 連線字串寫在 Global.asax裡面 Application 
        Application("App_DBConnString") = "Data Source=.;Initial Catalog=test;Persist Security Info=True;User ID=test;Password=test"
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' 應用程式關閉時執行的程式碼
    End Sub


    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' 發生未處理錯誤時執行的程式碼
    End Sub



    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' 啟動新工作階段時執行的程式碼
        Session.Timeout = 1  ' --註解：Session生命週期，縮短為1分鐘。
        
        Application.Lock()
        Application("UsersOnline") = CInt(Application("UsersOnline")) + 1
        Application.UnLock()
        
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' 工作階段結束時執行的程式碼。
        ' 注意:
        '     只有在 Web.config檔將 sessionstate模式設定為 InProc時，才會引發 Session_End事件。
        '     如果將工作階段模式設定為(StateServer) 或 SQLServer，就不會引發這個事件。
        Application.Lock()
        Application("UsersOnline") = CInt(Application("UsersOnline")) - 1
        Application.UnLock()
        
    End Sub

</script>