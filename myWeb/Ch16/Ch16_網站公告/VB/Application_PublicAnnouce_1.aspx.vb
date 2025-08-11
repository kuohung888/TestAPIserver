
Partial Class VS2010_Book_Sample_Ch16_Program__Book_App_Session_Application_PublicAnnouce_1
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Application.Lock()

        Application("PublicMessage") = TextBox1.Text

        Application.UnLock()
    End Sub
End Class
