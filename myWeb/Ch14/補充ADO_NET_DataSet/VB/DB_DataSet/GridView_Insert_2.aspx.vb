'----自己寫的----
Imports System
Imports System.Web.Configuration
Imports System.Data
Imports System.Data.SqlClient
'----自己寫的----

Partial Class test_GridView_GridView_Insert_2
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        '----連結資料庫的「連結字串」 ----
        Dim Conn As New SqlConnection(WebConfigurationManager.ConnectionStrings("testConnectionString").ConnectionString.ToString)

        If Check_InputData(TextBox2.Text) Or Check_InputData(TextBox3.Text) Or Check_InputData(TextBox4.Text) Or Check_InputData(TextBox5.Text) Then
            Response.Write("出現可疑的字眼，程式中斷！")
            Return
        End If

        Dim cmd As New SqlCommand("INSERT INTO [test]([test_time], [class], [title], [summary], [article], [author]) VALUES(getdate(), '" & DropDownList1.SelectedValue.ToString() & "', '" & TextBox2.Text & "', '" & TextBox3.Text & "', '" & TextBox4.Text & "', '" & TextBox5.Text & "')", Conn)

        Try
            Conn.Open()   '----(1). 這時候才連結DB
            Dim i As Integer = cmd.ExecuteNonQuery()   '----(2). 執行SQL指令，新增一筆資料

            If i > 0 Then
                Label1.Text = "新增" & i & "筆資料！"   '----(3). 自由發揮、畫面。執行SQL指令，
                '----新增一筆資料之後，成功或是失敗，要在畫面上反映出來。
            End If
            cmd.Cancel()

            '===============================================(start)
            '---- 新增完成後，重新整理 GridView，以呈現最新文章 --------------------------
            Dim dr As SqlDataReader = Nothing
            Dim cmd_dr As New SqlCommand("Select Top 5 * from Test Order by id DESC", Conn)
            dr = cmd_dr.ExecuteReader

            GridView1.DataSource = dr
            GridView1.DataBind()

            If Not (dr Is Nothing) Then
                cmd_dr.Cancel()
                '---- 關閉DataReader之前，一定要先「取消」SqlCommand
                dr.Close()
            End If
            '===============================================(end)

        Catch ex As Exception   '---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>")

        Finally
            '----(4). 關閉DB的連結。
            '---- Close the connection when done with it.
            If (Conn.State = ConnectionState.Open) Then
                Conn.Close()
                Conn.Dispose() '---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
            End If
        End Try
    End Sub


    Protected Function Check_InputData(ByVal u_input As String) As Boolean
        '-- 判斷輸入字串，是否有SQL Injection（資料隱碼）攻擊
        If InStr(1, u_input, "--") <> 0 Or InStr(1, u_input, "1=1") <> 0 Then
            Return True
        End If

        Return False
    End Function
End Class
