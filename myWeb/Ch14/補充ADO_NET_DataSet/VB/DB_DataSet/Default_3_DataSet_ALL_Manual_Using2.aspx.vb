'----自己寫的（宣告）----
Imports System
Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text  '-- for StringBuilder
'----自己寫的（宣告）----


Partial Class _Book_New_Samples_DB_DataSet_Default_3_DataSet_ALL_Manual_2_Using
    Inherits System.Web.UI.Page

    '====自己手寫的程式碼， DataAdapter / DataSet ====(start)
    Sub DBInit()
        '----上面已經事先寫好 Imports System.Web.Configuration ----
        '----(1). 連結資料庫----
        '----連結資料庫的另一種寫法----
        'Dim Conn As SqlConnection = New SqlConnection       
        'Conn.ConnectionString = WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString
        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)
        'Conn.Open()   '-- DataAdapter會自己開啟連結，不用自己寫。


        '*** 第一個 Using ************(Start)
        Using myAdapter As New SqlDataAdapter("select id,test_time,title,author from test", Conn)

            Using ds As New DataSet()  '== 第二個 Using ====(Start)
                '----(2). 執行SQL指令（Select陳述句）----
                myAdapter.Fill(ds, "test")

                '----(3). 自由發揮。自行撰寫程式 (HTML表格），呈現在畫面上----
                Dim myTable As DataTable = ds.Tables("test")  '==重點！！

                Dim myString As New StringBuilder()   '-- StringBuilder 不建議使用 Using來作。
                myString.Append("<table border=1><tr><td>id</td><td>test_time</td><td>title</td><td>author</td></tr>")

                For i As Integer = 0 To myTable.Rows.Count - 1    '---- 一列一列地呈現 ----
                    myString.Append("<tr>")
                    myString.Append("   <td>" & myTable.Rows(i).Item("id") & "</td>")
                    myString.Append("   <td>" & myTable.Rows(i).Item("test_time") & "</td>")
                    myString.Append("   <td>" & myTable.Rows(i).Item("title") & "</td>")
                    myString.Append("   <td>" & myTable.Rows(i).Item("author") & "</td>")
                    myString.Append("</tr>")
                Next
                myString.Append("</table>")


                Label1.Text = myString.ToString()
            End Using  '== 第二個 Using ====(End)
        End Using
        '*** 第一個 Using ************(End)

        '----(4). 釋放資源、關閉連結資料庫----
        '---- 不用寫，DataAdapter會自動關閉
        '---- Close the connection when done with it.
        'If (Conn.State = ConnectionState.Open) Then
        '    Conn.Close()
        '    Conn.Dispose()
        'End If

    End Sub
    '====自己手寫的程式碼， DataAdapter / DataSet ====(end)


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            DBInit()
        End If
    End Sub


End Class
