using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_User_Control_UC_Samples_MSDN_01 : System.Web.UI.Page
{

        protected void Page_Init(object sender, EventArgs e)
       {   //** 在 Page_Init事件裡面設定UC的「預設值」。
            Spinner1.MaxValue = 10;
            Spinner1.MinValue = 0;
        }
        //==== 上面的 Page_Init事件也可以寫成下面這樣。Visual Studio會自動產生架構。
        //protected override void OnInit(EventArgs e)
        //{
        //    Spinner1.MaxValue = 10;
        //    Spinner1.MinValue = 0;
        //    base.OnInit(e);   //這段程式碼，自己會跑出來
        //}

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
         Label1.Text = Spinner1.MaxValue.ToString();
         Label2.Text = Spinner1.MinValue.ToString();

        //  在包含網頁中, 以宣告方式設定 MinValue  和 MaxValue 屬性（這兩個屬性，已經寫在UC裡面）
        //  <MIS2000Lab:UC ID="Spinner1" runat="server" MinValue="0" MaxValue="10" />
    }
}