'----自己寫的----
Imports System
Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
'----自己寫的----

Partial Class test_ADO_NET_Default_2_DataSet_Manual
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

        Dim ds As New DataSet

        Try  '==== 以下程式，只放「執行期間」的指令！=================
            '----(1). 連結資料庫----
            'Conn.Open()   '---- 不用寫，DataAdapter會自動開啟

            '----(2). 執行SQL指令（Select陳述句）----
            myAdapter.Fill(ds, "test")    '---- 這時候執行SQL指令。取出資料，放進 DataSet。

            '----(3). 自由發揮。由 GridView來呈現資料。----
            GridView1.DataSource = ds     '----標準寫法 GridView1.DataSource = ds.Tables("test").DefaultView ----
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
            DBInit()   '---只有第一次執行本程式，才會進入 if判別式內部。
        End If
    End Sub


    Protected Sub GridView1_RowUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdateEventArgs) Handles GridView1.RowUpdating
        '==========================================================
        '----修改、更新      
        '----    參考資料  http://msdn2.microsoft.com/zh-tw/library/33y2221y(VS.80).aspx
        '==========================================================
        '----因為前面有三個「功能鍵(編輯、選取、刪除)」，所以Cells( )從零算起，需扣掉前三個功能鍵與 id欄位。
        Dim my_test_time, my_title, my_author As TextBox
        '先定義三個 TextBox物件！

        my_test_time = GridView1.Rows(e.RowIndex).Cells(4).Controls(0)
        my_title = GridView1.Rows(e.RowIndex).Cells(5).Controls(0)
        '----也可以用下面的寫法 CType( ) ----
        my_author = CType(GridView1.Rows(e.RowIndex).Cells(6).Controls(0), TextBox)

        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)
        Dim myAdapter As SqlDataAdapter = New SqlDataAdapter

        '----------------------事先寫好 UpdateCommand / DeleteCommand / InsertCommand
        myAdapter.UpdateCommand = New SqlCommand("update [test] set [test_time] = @test_time, [title] = @title, [author] = @author where [id] = @id", Conn)
        '----下面 [日期格式] 如果不修正，會發生錯誤！
        myAdapter.UpdateCommand.Parameters.Add("@test_time", SqlDbType.DateTime, 10)
        myAdapter.UpdateCommand.Parameters("@test_time").Value = CDate(my_test_time.Text)
        '----上面這兩行，改成下面這樣寫，也是可以
        '---- myAdapter.UpdateCommand.Parameters("@test_time").Value = FormatDateTime(my_test_time.Text, DateFormat.ShortDate)

        '----以下是「參數」
        '----    參考資料：  http://msdn2.microsoft.com/zh-tw/library/system.data.sqlclient.sqlcommand.parameters.aspx
        myAdapter.UpdateCommand.Parameters.Add("@title", SqlDbType.VarChar, 50)
        myAdapter.UpdateCommand.Parameters("@title").Value = my_title.Text

        myAdapter.UpdateCommand.Parameters.Add("@author", SqlDbType.VarChar, 50)
        myAdapter.UpdateCommand.Parameters("@author").Value = my_author.Text

        myAdapter.UpdateCommand.Parameters.Add("@id", SqlDbType.Int, 4)
        myAdapter.UpdateCommand.Parameters("@id").Value = CInt(GridView1.DataKeys(e.RowIndex).Value.ToString)
        '---- GridView1.DataKeys(e.RowIndex).Value 是指：「使用者點選的那一列」資料，所對應的資料表「主索引鍵（Primary Key）值」。


        '********************************************************************
        '-----方法A！----------------------------------(請任選其一)
        'Conn.Open()
        'myAdapter.UpdateCommand.ExecuteNonQuery()
        'myAdapter.Dispose()
        '********************************************************************
        '-----方法B！----------------------------------(請任選其一)
        Dim ds As New DataSet
        myAdapter.SelectCommand = New SqlCommand("select * from test", Conn)
        myAdapter.Fill(ds, "test")
        'Conn.Close()   '-- 這種寫法類似DataReader，直接執行SQL指令，所以仍須自己關閉資料庫的連結。 

        '---直接修改 DataSet的內容 --------------------------------
        ds.Tables("test").Rows(e.RowIndex).Item("test_time") = my_test_time.Text
        ds.Tables("test").Rows(e.RowIndex).Item("title") = my_title.Text
        ds.Tables("test").Rows(e.RowIndex).Item("author") = my_author.Text
        myAdapter.Update(ds, "test")
        '********************************************************************

        '==========================================================
        '===  另外一種寫法，透過SqlCommandBuilder自動產生 Update / Delete / Insert等相關指令
        '==========================================================
        'Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)
        ''Conn.Open()  '----不需要設定資料庫的連結與關閉，因為DataAdapter會自行處理
        '
        'Dim myAdapter As SqlDataAdapter
        'myAdapter = New SqlDataAdapter("select id,test_time,title,author from test", Conn)

        ''-----透過SqlCommandBuilder自動產生 Update / Delete / Insert等相關指令------------------------
        ''-----必須寫在[Select]的SQL指令完成後，才能自動產生 Update / Delete / Insert等---------
        ''-----缺點：SqlCommandBuilder 比對的參數太多了，在大量作業時可能會拖慢效能。-----
        ''-----          SqlCommandBuilder 只針對[單一表格]方可正常運作，並無法處理複雜的 Join資料表格 ----  
        'Dim mySQLComBuild As SqlCommandBuilder = New SqlCommandBuilder(myAdapter)
        ''---------------------------------------------------------------------------------------------------------------------------------
        'Dim ds As New DataSet
        'myAdapter.Fill(ds, "test")

        ''----------------------直接修改 DataSet的內容--------------------------------
        'ds.Tables("test").Rows(e.RowIndex).Item("test_time") = my_test_time.Text
        'ds.Tables("test").Rows(e.RowIndex).Item("title") = my_title.Text
        'ds.Tables("test").Rows(e.RowIndex).Item("author") = my_author.Text

        'myAdapter.Update(ds, "test")  ‘--把改寫後的DataSet，回寫到實體的資料庫裡面！
        'myAdapter.Dispose()
        '==========================================================

        '----修改、更新完成！！離開「編輯」模式  ----
        GridView1.EditIndex = -1
        DBInit()
    End Sub

    Protected Sub GridView1_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles GridView1.PageIndexChanging
        '----分頁----
        GridView1.PageIndex = e.NewPageIndex
    End Sub

    Protected Sub GridView1_PageIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PageIndexChanged
        '----分頁----
        DBInit()
    End Sub

    Protected Sub GridView1_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles GridView1.RowEditing
        '----編輯模式----
        GridView1.EditIndex = e.NewEditIndex
        DBInit()
        '----畫面上的GridView，已經事先設定好「DataKeyName」屬性 = id ----
        '----所以編輯時，主索引鍵id 欄位會自動變成「唯讀」----
    End Sub

    Protected Sub GridView1_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles GridView1.RowCancelingEdit
        '----離開「編輯」模式----
        GridView1.EditIndex = -1
        DBInit()
    End Sub



    Protected Sub GridView1_RowDeleting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting
        '======================================================
        '----刪除一筆資料
        '----    參考資料：http://msdn2.microsoft.com/zh-tw/library/system.data.sqlclient.sqldataadapter.deletecommand(VS.80).aspx
        '======================================================
        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)

        '== 標準寫法如下
        '== 參考資料： http://msdn.microsoft.com/zh-tw/library/system.data.sqlclient.sqldataadapter.deletecommand.aspx
        Dim myAdapter As SqlDataAdapter = New SqlDataAdapter

        '---- 事先寫好 UpdateCommand / DeleteCommand / InsertCommand
        myAdapter.DeleteCommand = New SqlCommand("delete from [test] where [id] = @id", Conn)

        '----以下是「參數」
        myAdapter.DeleteCommand.Parameters.Add("@id", SqlDbType.Int, 4)
        myAdapter.DeleteCommand.Parameters("@id").Value = CInt(GridView1.DataKeys(e.RowIndex).Value)
        '-- GridView1.DataKeys(e.RowIndex).Value 是指：「使用者點選的那一列」資料，所對應的資料表「主索引鍵（Primary Key）值」。

        '********************************************************************
        '-----方法A！----------------------------------(請任選其一)
        'Conn.Open()
        'myAdapter.DeleteCommand.ExecuteNonQuery()
        'myAdapter.Dispose()
        'Conn.Close()   '-- 這種寫法類似DataReader，直接執行SQL指令，所以仍須自己關閉資料庫的連結。 

        '-----方法B！----------------------------------(請任選其一)
        Dim ds As New DataSet
        myAdapter.SelectCommand = New SqlCommand("select * from test", Conn)
        myAdapter.Fill(ds, "test")

        ds.Tables("test").Rows(e.RowIndex).Delete()  '--會呼叫 DeleteCommand
        myAdapter.Update(ds, "test")  '--直接修改 DataSet的內容 
        '********************************************************************

        '----「刪除」已經完成！！記得重新整理畫面，重新載入資料----
        DBInit()
    End Sub

End Class
