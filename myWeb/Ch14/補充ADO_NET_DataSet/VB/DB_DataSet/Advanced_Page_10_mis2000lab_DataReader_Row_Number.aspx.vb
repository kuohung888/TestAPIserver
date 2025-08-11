Imports System.Data
Imports System.Data.SqlClient
Imports System.Text    '-- StringBuilder需要用到
Imports Microsoft.VisualBasic   '-- for Timer


Partial Class VS2010_Book_Sample_Advanced_Page_10_mis2000lab_Row_Number
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '-------計時，開始--------------------------------------------------
        Dim e_start As Double = Nothing
        e_start = Microsoft.VisualBasic.DateAndTime.Timer
        '--Timer 屬性會傳回午夜過後的秒數和毫秒數。秒數是傳回值的整數部分，毫秒則是小數部分
        '--http://msdn2.microsoft.com/zh-tw/library/t94fw4e9(VS.80).aspx
        Response.Write("Start----" & e_start & "<br />")
        '--------------------------------------------------------------------------


        '==========   ASP.NET  DataReader 分頁程式 by MIS2000 Lab.   ==========        
        Dim haveRec = False

        '-- p 就是「目前在第幾頁?」
        Dim p As String = Request("p")

        '=============  ADO.NET / DataReader ==(Start)======
        'Dim Conn As SqlConnection = New SqlConnection("server=localhost; uid=test; pwd=test; database=test;MultipleActiveResultSets=True")
        Dim Conn As SqlConnection = New SqlConnection("Data Source=.\MSSQLSERVER2008;Initial Catalog=test;Integrated Security=True;MultipleActiveResultSets=True")
        '-- 使用多重結果集（MARS）
        Conn.Open()

        Dim cmd As SqlCommand = New SqlCommand("select count(id) from test", Conn)
        '=============  ADO.NET / DataReader==(End)======

        '---每頁展示 5筆資料
        Dim PageSize As Integer = 5

        '--SQL指令共撈到多少筆（列）資料。RecordCount資料總筆（列）數
        Dim RecordCount As Integer = CType(cmd.ExecuteScalar().ToString, Integer)
        cmd.Cancel()

        '--如果撈不到資料，程式就結束。-- Start --------------
        If RecordCount = 0 Then
            Response.Write("<h2>抱歉！無法找到您需要的資料！</h2>")
            Conn.Close()
            Response.End()
        End If    '--如果撈不到資料，程式就結束。-- End ------


        '--Pages 資料的總頁數。搜尋到的所有資料，共需「幾頁」才能全部呈現？
        Dim Pages As Integer = 0
        Pages = ((RecordCount + PageSize) - 1) \ PageSize

        '--底下這一段IF判別式，是用來防呆，防止一些例外狀況。-- start --
        '--有任何問題，就強制跳回第一頁（p=1）。
        If IsNumeric(Request("p")) Then
            '--頁數（p）務必是一個整數。而且需要大於零、比起「資料的總頁數」要少
            If Request("p") <> "" And CInt(Request("p")) > 0 And CInt(Request("p")) <= Pages Then
                p = CInt(Request("p"))
            Else
                p = 1
            End If
        Else
            p = 1
        End If  '--上面這一段IF判別式，是用來防呆，防止一些例外狀況。-- end --

        '--NowPageCount，目前這頁的資料，要從 DataSet裡面的第幾筆（列）開始撈資料？？
        Dim NowPageCount As Integer = 0
        If (p > 0) Then
            NowPageCount = (p - 1) * PageSize    '--PageSize，每頁展示5筆資料（上面設定過了）
        End If

        Response.Write("<h3>搜尋資料庫:&nbsp;&nbsp; (共計" & RecordCount & "筆 / 共需" & Pages & "頁)</h3>")
        Response.Write("<hr width='97%' size='1'>")


        Dim html_sb As New StringBuilder
        '-- StringBuilder的用法，請參考 http://msdn2.microsoft.com/zh-tw/library/system.text.stringbuilder(VS.80).aspx
        html_sb.Append("<table border=0 width='95%'>")

        '========================
        '== 組合SQL指令 =============
        Dim dr As SqlDataReader = Nothing
        Dim SqlStr As String = "Select test_time, id, title, summary from (select ROW_NUMBER() OVER(ORDER BY id) AS 'RowNo', * from test) as t where t.RowNo between " & NowPageCount & " and " & (NowPageCount + PageSize)
        '==SQL指令的 ROW_NUMBER。參考資料： http://technet.microsoft.com/zh-tw/library/ms186734.aspx 
        Dim cmd1 As SqlCommand = New SqlCommand(SqlStr, Conn)
        dr = cmd1.ExecuteReader()
        '========================
        While (dr.Read())
            haveRec = True

            '--以下是「資料呈現在畫面上」的HTML碼
            html_sb.Append("<tr><td WIDTH='12%' valign=top><font size='2' color=#800000>★(" & dr.Item("test_time").ToString() & ")</font></td>")
            html_sb.Append("<td WIDTH='88%'><a href='Default_Disp.aspx?id=" & dr.Item("id").ToString() & "'><b>" & dr.Item("title").ToString() & "</b></a></td></tr>")
            html_sb.Append("<tr><td WIDTH='12%'></td><td WIDTH='88%'><font color='#666666' size='2'>" & dr.Item("summary").ToString() & "</font></td></tr>")
            html_sb.Append("<tr><td colspan='2' height='12'> </td></tr>")
        End While
        html_sb.Append("</table>")


        If (haveRec) Then  '-- 以下區塊，是畫面下方的分頁功能---------------------------------------------------------
            Response.Write(html_sb.ToString())

            If (Pages > 0) Then
                '--有傳來「頁數(p)」，而且頁數正確（大於零），出現<上一頁>、<下一頁>這些功能
                Response.Write("<div align='center'>")
                If (p > 1) Then
                    Response.Write("<a href='Advanced_Page_10_mis2000lab_DataReader_Row_Number.aspx?p=" & (p - 1) & "'>[<<<上一頁]</a>")
                End If

                Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b><a href='http://127.0.0.1/'>[首頁]</a></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;")

                If (p < Pages) Then
                    Response.Write("<a href='Advanced_Page_10_mis2000lab_DataReader_Row_Number.aspx?p=" & (p + 1) & "'>[下一頁>>>]</a>")
                End If

                '========= MIS2000 Lab.自製的「每十頁」一間隔，分頁功能=========start====
                Response.Write("<hr width='97%' size=1>")

                Dim K As Integer = 0
                Dim block_page As Integer = 0
                block_page = p \ 10   '--只取除法的整數成果（商），若有餘數也不去管它。

                If block_page > 0 Then
                    Response.Write("<a href='Advanced_Page_10_mis2000lab_DataReader_Row_Number.aspx?p=" & (((block_page - 1) * 10) + 9) & "'> [前十頁<<]  </a>&nbsp;&nbsp;")
                End If

                For K = 0 To 10
                    If (block_page * 10 + K) <= Pages Then           '--- Pages 資料的總頁數。共需「幾頁」來呈現所有資料？
                        If ((block_page * 10) + K) = p Then             '--- p 就是「目前在第幾頁」
                            Response.Write("[<b>" & p & "</b>]" & "&nbsp;&nbsp;&nbsp;")
                        Else
                            If ((block_page * 10) + K) <> 0 Then
                                Response.Write("<a href='Advanced_Page_10_mis2000lab_DataReader_Row_Number.aspx?p=" & (block_page * 10 + K) & "'>" & (block_page * 10 + K) & "</a>")
                                Response.Write("&nbsp;&nbsp;&nbsp;")
                            End If
                        End If
                    End If
                Next

                If (block_page < (Pages \ 10)) And (Pages >= ((block_page + 1) * 10 + 1)) Then
                    Response.Write("&nbsp;&nbsp;<a href='Advanced_Page_10_mis2000lab_DataReader_Row_Number.aspx?p=" & (block_page + 1) * 10 + 1 & "'>  [>>後十頁]  </a>")
                End If
                Response.Write("</div>")
                '========= MIS2000 Lab.自製的「每十頁」一間隔，分頁功能=========end====
            End If
        End If

        cmd1.Cancel()
        dr.Close()
        Conn.Close()

        '-------計時，結束--------------------------------------------------
        Dim e_finish As Double = Nothing
        e_finish = Microsoft.VisualBasic.DateAndTime.Timer
        Response.Write("Finish----" & e_finish & "<br />")

        Response.Write("耗時----" & (e_finish - e_start).ToString & "秒<hr />")
        '--------------------------------------------------------------------------
    End Sub
End Class
