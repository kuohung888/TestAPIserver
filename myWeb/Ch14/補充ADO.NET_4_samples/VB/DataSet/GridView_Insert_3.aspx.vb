'----自己寫的----
Imports System
Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
'----自己寫的----

Partial Class test_GridView_GridView_Insert_3
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            DBinit()   '--第一次載入網頁，才會執行本程式。
        End If
    End Sub


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        '-- 參考資料：http://msdn.microsoft.com/zh-tw/library/system.data.sqlclient.sqldataadapter.insertcommand(VS.80).aspx
        '-- DataSet將資料加入DataTable：http://msdn.microsoft.com/zh-tw/library/z16c79x4(VS.80).aspx
        '*******************************************************
        '****  DataSet  /  資料新增 ****

        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)
        Dim ds As New DataSet()

        Dim u_Adapter As New SqlDataAdapter()
        u_Adapter.SelectCommand = New SqlCommand("Select * from test", Conn)
        u_Adapter.Fill(ds, "test")  '---- 這時候執行SQL指令。取出資料，放進 DataSet。

        Dim new_row As DataRow = ds.Tables("test").NewRow()
        '-- 手動新增一行 DataRow
        new_row("class") = DropDownList1.SelectedValue
        new_row("title") = TextBox2.Text
        new_row("summary") = TextBox3.Text
        new_row("article") = TextBox4.Text
        new_row("author") = TextBox5.Text

        ds.Tables("test").Rows.Add(new_row)  '--將新增的一行 DataRow加入 DataSet裡面


        '==事先寫好 InsertCommand ===================================
        u_Adapter.InsertCommand = New SqlCommand("INSERT INTO [test] ([test_time], [class], [title], [summary], [article], [author]) VALUES (getdate(), @class, @title, @summary, @article, @author)", Conn)
        '-- InsertCommand 參數 --(start)
        u_Adapter.InsertCommand.Parameters.Add("@class", SqlDbType.NVarChar, 50)
        u_Adapter.InsertCommand.Parameters("@class").Value = DropDownList1.SelectedValue

        u_Adapter.InsertCommand.Parameters.Add("@title", SqlDbType.NVarChar, 100)
        u_Adapter.InsertCommand.Parameters("@title").Value = TextBox2.Text

        u_Adapter.InsertCommand.Parameters.Add("@summary", SqlDbType.NVarChar, 250)
        u_Adapter.InsertCommand.Parameters("@summary").Value = TextBox3.Text

        u_Adapter.InsertCommand.Parameters.Add("@article", SqlDbType.NVarChar, 16)
        u_Adapter.InsertCommand.Parameters("@article").Value = TextBox4.Text

        u_Adapter.InsertCommand.Parameters.Add("@author", SqlDbType.NVarChar, 100)
        u_Adapter.InsertCommand.Parameters("@author").Value = TextBox5.Text
        '-- InsertCommand 參數 --(end)
        '=====================================================

        u_Adapter.Update(ds, "test")
        '---- 這時候執行SQL指令。把 DataSet裡面的新資料，回寫到資料庫！
        '---- 因為DataSet的狀態已經被改變，多了新的一列DataRow，所以會自動執行 InsertCommand


        '== 重新資料繫結，讓 GridView展示資料庫裡面的最新情況==
        DBinit()
    End Sub



    Sub DBinit()
        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)

        Dim u_Adapter As SqlDataAdapter
        u_Adapter = New SqlDataAdapter("select top 5 * from test order by id DESC", Conn)

        Dim ds As New DataSet()

        Try  '==== 以下程式，只放「執行期間」的指令！=================
            '----(1). 連結資料庫----
            'Conn.Open()   '---- 不用寫，DataAdapter會自動開啟

            '----(2). 執行SQL指令（Select陳述句）----
            u_Adapter.Fill(ds, "test")    '---- 這時候執行SQL指令。取出資料，放進 DataSet。

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
            'Conn.Close()
            'Conn.Dispose()
            'End If
        End Try
    End Sub
End Class
