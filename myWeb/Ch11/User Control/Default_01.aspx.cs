using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_User_Control_Default_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //== 是否分頁？
        try
        {
            String answer = RadioButtonList1.SelectedValue.ToString();
            mis2000GV.YesOrNo_AllowPaging = bool.Parse(answer);
            //mis2000GV.YesOrNo_AllowPaging = Convert.ToBoolean(answer);

            //參考網址：  http://msdn.microsoft.com/zh-tw/library/86hw82a3.aspx
            // http://msdn.microsoft.com/zh-tw/library/ya2h6f82%28v=VS.100%29.aspx
        }
        catch (FormatException ex)
        {
            Response.Write(ex.Message.ToString());
        }
    }
}