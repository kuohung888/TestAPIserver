
Partial Class Book_Sample_Ch03_WebControls_TextBox_Click_VB
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        '-- 1.x的寫法：
        '   TextBox1.Attributes[ "onclick "]   =   Page.GetPostBackEventReference(Button1);   

        '-- 2.0以後的寫法： 
        TextBox1.Attributes("onclick") = ClientScript.GetPostBackEventReference(Button1, Nothing)
        '-- 傳回字串，該字串可用於用戶端事件中造成回傳(PostBack)給伺服器。
        '-- 資料來源：  http://msdn.microsoft.com/zh-tw/library/ms153112

        '-- 重點，您必須在 .aspx檔最上方，@ Page指示詞裡面，設定 EnableEventValidation="false"才行！
    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Response.Write("<big><font color=darkgreen>您剛剛做了 Click動作 --</font></big> " & System.DateTime.Now.ToLongTimeString())
    End Sub
End Class
