'----自己（宣告）寫的----
Imports System
Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
'----自己（宣告）寫的----

Partial Class test_ADO_NET_Default_1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '=======微軟SDK文件的範本=======

        '== 第一，連結資料庫。
        '----上面已經事先寫好 Imports System.Web.Configuration ----
        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString)
        Conn.Open()   '---- 這時候才連結DB

        '== 第二，執行SQL指令。
        Dim dr As SqlDataReader = Nothing
        Dim cmd As SqlCommand = New SqlCommand("select id,test_time,summary,author from test", Conn)
        dr = cmd.ExecuteReader()   '---- 這時候執行SQL指令，取出資料

        '==第三，自由發揮，把執行後的結果呈現到畫面上。
        GridView1.DataSource = dr
        GridView1.DataBind()
        '==自己寫迴圈==
        'While dr.Read()
        '    Response.Write(dr("author") & "<br / >")
        'End While

        '== 第四，釋放資源、關閉資料庫的連結。
        If Not (dr Is Nothing) Then
            cmd.Cancel()
            '----關閉DataReader之前，一定要先「取消」SqlCommand
            '參考資料： http://blog.darkthread.net/blogs/darkthreadtw/archive/2007/04/23/737.aspx
            dr.Close()
        End If

        If (Conn.State = ConnectionState.Open) Then
            Conn.Close()
            Conn.Dispose() '---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
        End If

    End Sub


End Class
