using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Ch16_ViewState_1 : System.Web.UI.Page
{
    //參考資料：http://msdn.microsoft.com/zh-tw/library/ms227551(VS.80).aspx
    ArrayList PageArrayList;   //—註解：公用變數

    protected void Page_Load(object sender, EventArgs e)
    {
        //—註解：您可以將資訊儲存在ViewState中，
        //   在下次將網頁要求（Request）重新傳送至伺服器時，可以在Page_Load()事件期間存取ViewState。
        if (ViewState["my_ViewState"] == null)
        {
            Button1.Visible = true;

            //—註解：如果 ViewState空無一物，我們就先設定一個。
            PageArrayList = new ArrayList(4);
            PageArrayList.Add("item 1（一號）");
            PageArrayList.Add("item 2（二號）");
            PageArrayList.Add("item 3（三號）");
            PageArrayList.Add("item 4（四號）");

            ViewState.Add("my_ViewState", PageArrayList);    //把資料寫進 ViewState
            //-- 也可以寫成這樣  ViewState["my_ViewState"] = PageArrayList;
        }
        else
        {
            //—註解：如果 ViewState有東西在裡面，那麼就透過 ListBox呈現出來
              PageArrayList = (ArrayList)ViewState["my_ViewState"];

              ListBox1.DataSource = PageArrayList;
              ListBox1.DataBind();

              Button1.Visible = false;
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Write("您已經按下按鈕！！");
        //按下按鈕，將會導致 PostBack的動作，也就是「將網頁要求傳送至伺服器」
    }
}
