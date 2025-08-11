'----自己寫的（宣告）----
Imports System
Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
Imports System.Text
'----自己寫的（宣告）----


Partial Class test_DataSet_DataReader_1_DataSet
    Inherits System.Web.UI.Page

    '====自己手寫的程式碼， DataAdapter / DataSet ====(Start)
    Sub DBInit()
        '=======微軟SDK文件的範本=======
        '----上面已經事先寫好 Imports System.Web.Configuration ----
        '----連結資料庫的另一種寫法----
        'Dim Conn As SqlConnection = New SqlConnection
        'Conn.ConnectionString = WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString
        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)


        Dim myAdapter As SqlDataAdapter
        myAdapter = New SqlDataAdapter("select id,test_time,title,author from test", Conn)

        Dim ds As New DataSet()

        Try  '==== 以下程式，只放「執行期間」的指令！=================
            '----(1). 連結資料庫----
            ' ---- 不用寫Conn.Open() ，DataAdapter會自動開啟
            '作者註解：SqlDataAdapter的 .Fill()方法使用 SQL指令的SELECT，從資料來源擷取資料。
            '   此時，DbConnection物件（如Conn）必須是有效的，但不需要是開啟的
            '  （因為DataAdapter會自動開啟或關閉連結）。
            '   如果在呼叫 .Fill ()方法之前關閉 IDbConnection，它會先開啟連接以擷取資料，
            '   然後再關閉連接。如果在呼叫 .Fill ()方法之前開啟連接，它會保持開啟狀態。
            '   因此，我們使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。

            '----(2). 執行SQL指令（Select陳述句）----
            myAdapter.Fill(ds, "test")    '---- 這時候執行SQL指令。取出資料，放進 DataSet。
            '---- DataSet是由許多 DataTable組成的，我們目前只放進一個名為 test的 DataTable而已。

            '********************************************
            '*** .Fill()方法之後，資料庫連線就中斷囉！ ***
            Response.Write("<hr />資料庫連線 Conn.State ---- " & Conn.State.ToString() & "<hr />")
            '********************************************


            '----(3). 自由發揮。由 GridView來呈現資料。----
            GridView1.DataSource = ds
            '----標準寫法 GridView1.DataSource = ds.Tables("test").DefaultView ----
            GridView1.DataBind()


        Catch ex As Exception
            Response.Write("<HR/> Exception Error Message----  " + ex.ToString())
        Finally
            '----(4). 釋放資源、關閉連結資料庫----
            '---- 不用寫，DataAdapter會自動關閉
            'If (Conn.State = ConnectionState.Open) Then
            '  Conn.Close()
            '  Conn.Dispose()
            'End If
        End Try

    End Sub
    '====自己手寫的程式碼， DataAdapter / DataSet ====(End)




    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            DBInit()    '--網頁第一次執行的時候，才會運作到這一行！
        End If
    End Sub

    '=============================================
    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        '== 分 頁 ==
        GridView1.PageIndex = e.NewPageIndex
        DBInit()
    End Sub

    Protected Sub GridView1_PageIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.PageIndexChanged
        Response.Write("<script>window.alert(""GridView has Been Paged!!"")</script>")
    End Sub

    '=============================================
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Response.Write("<br>your Row Index--" & GridView1.SelectedIndex)
        Response.Write("<br>your Table P.K.--" & GridView1.SelectedDataKey.Value)
    End Sub

    '=============================================
    Protected Sub GridView1_RowEditing(sender As Object, e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        GridView1.EditIndex = e.NewEditIndex
        DBInit()
    End Sub

    Protected Sub GridView1_RowCancelingEdit(sender As Object, e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        GridView1.EditIndex = -1   '--取消GridView的[編輯]模式(SelectedRowStyle)
        DBInit()
    End Sub

    '=============================================
    Protected Sub GridView1_RowCommand(sender As Object, e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "my_button" Then
            Response.Write("<script>window.alert(""my_Button"")</script>")
        End If

        If e.CommandName = "Edit" Then
            Response.Write("<script>window.alert(""Edit Button"")</script>")
        End If

        If e.CommandName = "my_NonSelect" Then
            GridView1.SelectedIndex = -1   '--取消光棒效果 (SelectedRowStyle)
        End If
    End Sub

    '=============================================
    Protected Sub GridView1_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        Response.Write("<hr />我要刪除 Row Index--" & GridView1.SelectedIndex)
        Response.Write("<br>我要刪除 Table P.K.--" & GridView1.DataKeys(e.RowIndex).Value)
        '----  Delete (ADO.NET)

        DBInit()
    End Sub

    '=============================================
    Protected Sub GridView1_RowUpdating(sender As Object, e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        Dim my_test_time, my_title, my_author As TextBox
        '先定義三個 TextBox物件！

        my_test_time = GridView1.Rows(e.RowIndex).Cells(5).Controls(0)
        Response.Write("<hr />修改後的 test_time--" & my_test_time.Text)

        my_title = GridView1.Rows(e.RowIndex).Cells(6).Controls(0)
        Response.Write("<hr />修改後的 title--" & my_title.Text)

        '----也可以用下面的寫法 CType( ) ----
        my_author = CType(GridView1.Rows(e.RowIndex).Cells(7).Controls(0), TextBox)
        Response.Write("<hr />修改後的 author--" & my_author.Text)

        '----  Update (ADO.NET)
    End Sub
End Class
