'----自己（宣告）寫的----
Imports System
Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
'----自己（宣告）寫的----


Partial Class _Book_New_Samples_DB_DataReader_RecordsAffected
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        '== (1). 開啟資料庫的連結。
        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString)
        Conn.Open()

        '== (2). 執行SQL指令。或是查詢、撈取資料。
        Dim cmd As SqlCommand = New SqlCommand("Update test set title = '真珠草萃取物可以治療肝炎 韓國技轉錦鴻' where id =3", Conn)


        '== (3). 自由發揮。把撈出來的紀錄，呈現在畫面上。
        Dim RecordsAffected As Integer = cmd.ExecuteNonQuery()
        Label1.Text = "執行 Update的SQL指令以後，影響了" & RecordsAffected & "列的紀錄。"

        '== (4). 釋放資源、關閉資料庫的連結。

        cmd.Cancel()

        '---- Close the connection when done with it.
        If (Conn.State = ConnectionState.Open) Then
            Conn.Close()
            Conn.Dispose()
        End If
    End Sub

End Class
