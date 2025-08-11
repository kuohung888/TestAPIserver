'----自己寫的（宣告）----
Imports System
Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
'----自己寫的（宣告）----


Partial Class _Book_New_Samples_DB_DataSet_Default_2_2_DataSet_GridView
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        '=======微軟SDK文件的範本=======
        '----上面已經事先寫好 Imports System.Web.Configuration ----
        '----(1). 連結資料庫----
        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)
        ' ---- 不用寫Conn.Open() ，DataAdapter會自動開啟
            '作者註解：SqlDataAdapter的 .Fill()方法使用 SQL指令的SELECT，從資料來源擷取資料。
            '  此時，DbConnection物件（如Conn）必須是有效的，但不需要是開啟的
            '  （因為DataAdapter會自動開啟或關閉連結）。
            '   如果在呼叫 .Fill ()方法之前關閉 IDbConnection，它會先開啟連接以擷取資料，
            '   然後再關閉連接。如果在呼叫 .Fill ()方法之前開啟連接，它會保持開啟狀態。
            '   因此，我們使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。


        '----(2). 執行SQL指令（Select陳述句）----
        Dim myAdapter As SqlDataAdapter = New SqlDataAdapter("select id,test_time,title,author from test", Conn)
        Dim ds As New DataSet()

        myAdapter.Fill(ds, "test")    '---- 這時候執行SQL指令。取出資料，放進 DataSet。


        '----(3). 自由發揮。由 GridView來呈現資料。----
        GridView1.DataSource = ds
        '----標準寫法 GridView1.DataSource = ds.Tables("test").DefaultView ----
        GridView1.DataBind()


        '----(4). 釋放資源、關閉連結資料庫----
        '---- 不用寫，DataAdapter會自動關閉
        'If (Conn.State = ConnectionState.Open) Then
        '  Conn.Close()
        '  Conn.Dispose()
        'End If

    End Sub
End Class
