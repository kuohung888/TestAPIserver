using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

//=======================
using System.Text;  //自己寫的（宣告）！！！



public partial class Ch16_Case_2 : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["my_name"] == null)
        {  //====防止有人沒註冊就闖入
            Response.Write("抱歉，請用正當程序，進行登入！......<a href=Case_1_Login.aspx>登入畫面</a>");
            Response.End();
        }

        if (Page.IsPostBack == false)
        {
            List_All();    
            //====第一次進到聊天室，會立刻出現目前所有人的談話內容
            //因為這功能很常用到，所以寫成一個 Function重複呼叫（放在程式的最後）。

            //====歡迎新夥伴加入====
            Application.Lock();
            
            StringBuilder my_Label = new StringBuilder();
            for (int i = 15; i > 0; i--)
            {
                Application["A" + i] = (string)Application["A"+ (i - 1)];
                my_Label.Append(Application["A" + i]);
            }
            //==== 上面這段 for迴圈，是聊天室程式裡面的重點！ ====
            //  每當有人發表一則留言，原本畫面上的留言，就會向上推擠。
            //  最新的留言，總會出現在畫面下方的最後一筆。
            //  為了良好的效率，這裡我們改用 StringBuilder來處理字串。

            Application["A1"] = (string)(Session["my_name"].ToString() + "  " + DateTime.Now.ToLongTimeString() + "  說： <b>====Hello~ Everybody~ 歡迎新夥伴加入！！====</b><br />");

            my_Label.Append(Application["A1"].ToString());
            Label1.Text = my_Label.ToString();

            Application.UnLock();
         }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {   //====送出留言
        Application.Lock();

        StringBuilder my_Label = new StringBuilder();
        for (int i = 15; i > 0; i--)
        {
            Application["A" + i] = (string)Application["A" + (i - 1)];
            my_Label.Append(Application["A" + i]);
        }

        Application["A1"] = ("<font color=" + Session["my_color"] + ">" + Session["my_name"] + "  " + DateTime.Now.ToLongTimeString() + "  說： " + TextBox1.Text + "</font><br />");
        my_Label.Append(Application["A1"]);
        Label1.Text = my_Label.ToString();

        Application.UnLock();
    }
    

    protected void Button2_Click(object sender, EventArgs e)
    {   //====離開聊天室====
        Application.Lock();

        StringBuilder my_Label = new StringBuilder();
        for (int i = 15; i > 0; i--)
        {
            Application["A" + i] = (string)Application["A" + (i - 1)];
            my_Label.Append(Application["A" + i]);
        }
        Application["A1"] = ("<font color=" + Session["my_color"] + ">" + Session["my_name"] + "  " + DateTime.Now.ToLongTimeString() + "  說： <font color=" + Session["my_color"] + ">掰掰～各位好朋友，再見了</font><br />");
        my_Label.Append((string)Application["A1"]);
        Label1.Text = my_Label.ToString();
        Session.Abandon();  //離開後，清除Session

        Application.UnLock();

        Response.Redirect("Case_1_Login.aspx");   //回到聊天室的「登入畫面」
    }


    protected void List_All()
    {   //====列出「目前」聊天室的所有談話內容====
        StringBuilder chatroom = new StringBuilder();

        for (int i = 15; i > 0; i--)
        {
            chatroom.Append((string)Application["A" + i]);
        }

        Label1.Text = chatroom.ToString();
    }
}
