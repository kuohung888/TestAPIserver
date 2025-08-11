
Partial Class test_GridView_GridView_Insert_1
    Inherits System.Web.UI.Page



    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        '-- SqlDataSource已經幫我們完成新增（Insert Into）的SQL指令
        SqlDataSource1.Insert()

    End Sub
End Class
