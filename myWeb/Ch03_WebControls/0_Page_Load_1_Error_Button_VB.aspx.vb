
Partial Class Book_Sample_Ch03_Program__Book_WebControls_0_Page_Load_1_Error_Button_VB
    Inherits System.Web.UI.Page


    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        '-- 務必把「畫面上」 Label1的文字（Text屬性）預設為零。

        Label1.Text = CInt(Label1.Text) + 1
        '-- 也可以寫成跟C#語法一樣的。  Label1.Text = Convert.ToInt32(Label1.Text) + 1
    End Sub

End Class
