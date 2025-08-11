using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_9_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
  

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            // 註解：日曆
            if (Calendar1.SelectedDates.Count >= 1)
            {
                // 使用者有點選日期，就會執行這一區。
                TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
            }
            else
            {
                throw new Exception("尚未選擇生日！");
            }
                

        }
        catch (Exception ex)   // 註解：不填寫資料，則出現警告視窗
        {
            Literal myMsg = new Literal();
            myMsg.Text = "<script>alert('" + ex.Message.ToString() + "')</script>";

            Page.Form.Controls.Add(myMsg);
            // 註解：把上面的 JavaScript警告視窗，臨時加入頁面（Page）裡頭。
            
            //throw;   //正確-- throw(ex);
            //把上面的 throw註解取消，看看程式會出現什麼成果？？
            //請參閱 http://msdn.microsoft.com/zh-tw/library/0yd65esw%28v=VS.100%29.aspx

            //要重新擲回目前由沒有參數 catch 子句處理的例外狀況，請使用不含引數的 throw 陳述式。
            // http://msdn.microsoft.com/zh-tw/library/0yd65esw%28v=vs.80%29.aspx
        }
    }

}