'----自己寫的（宣告）----
Imports System
Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
'----自己寫的（宣告）----


Partial Class test_ADO_NET_Default_3_DataSet_ALL_Manual
    Inherits System.Web.UI.Page

    '====自己手寫的程式碼， DataAdapter / DataSet ====(start)
    Sub DBInit()
        '----上面已經事先寫好 Imports System.Web.Configuration ----
        '----連結資料庫的另一種寫法----
        'Dim Conn As SqlConnection = New SqlConnection()       
        'Conn.ConnectionString = WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString
        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)
        Dim myAdapter As SqlDataAdapter

        Try    '==== 以下程式，只放「執行期間」的指令！=================
            '----(1). 連結資料庫----
            'Conn.Open()   '-- DataAdapter會自己開啟連結，不用自己寫。

            '=====重 點=====
            myAdapter = New SqlDataAdapter("select id,test_time,title,author from test", Conn)
            Dim ds As New DataSet()
            '----(2). 執行SQL指令（Select陳述句）----
            myAdapter.Fill(ds, "test")

            '----(3). 自由發揮。自行撰寫程式 (HTML表格），呈現在畫面上----
            Dim myTable As DataTable = ds.Tables("test")  '==重點！！

            Dim i As Integer
            Dim myString As String
            myString = "<table border=1><tr><td>id</td><td>test_time</td><td>title</td><td>author</td></tr>"
            For i = 0 To myTable.Rows.Count - 1    '---- 一列一列地呈現 ----
                myString = myString & "<tr>"
                myString = myString & "<td>" & myTable.Rows(i).Item("id") & "</td>"
                myString = myString & "<td>" & myTable.Rows(i).Item("test_time") & "</td>"
                myString = myString & "<td>" & myTable.Rows(i).Item("title") & "</td>"
                myString = myString & "<td>" & myTable.Rows(i).Item("author") & "</td>"
                myString = myString & "</tr>"
            Next
            myString = myString & "</table>"
            Label1.Text = myString
            '=====重 點=====

        Catch ex As Exception
            Response.Write("<HR/>" + ex.ToString() + "<HR/>")
        Finally
            '----(4). 釋放資源、關閉連結資料庫----
            '---- 不用寫，DataAdapter會自動關閉
            '---- Close the connection when done with it.
            'If (Conn.State = ConnectionState.Open) Then
            '    Conn.Close()
            '    Conn.Dispose()
            'End If
        End Try
    End Sub
    '====自己手寫的程式碼， DataAdapter / DataSet ====(end)


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            DBInit()
        End If
    End Sub

End Class
