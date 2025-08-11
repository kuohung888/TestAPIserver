using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch15_Page_Life : System.Web.UI.Page
{
    //  C#用戶必須自己手動撰寫這些事件。
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)        {
            Response.Write("<hr /><b>第一次執行頁面</b>...Page_PreInit事件。 <br />");
        }
        else        {
            Response.Write("<hr />Page_PreInit事件 ，重複發生。<br />");
        }
    }


    protected void Page_Init(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)        {
            Response.Write("<hr /><b>第一次執行頁面</b>...Page_Init事件。 <br />");
        }
        else        {
            Response.Write("<hr />Page_Init事件 ，重複發生。<br />");
        }
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)        {
            Response.Write("<hr /><b>第一次執行頁面</b>...Page_Load事件。 <br />");
        }
        else        {
            Response.Write("<hr />Page_Load事件，重複發生。 <br />");
        }
    }


    protected void Page_PreRender(object sender, EventArgs e)
    {
        Response.Write("<hr />Page_PreRender事件 <br />");
        Response.Write("重點！！每個已經設定「其 DataSourceID屬性的資料繫結控制項」會呼叫其 .DataBind()方法。");
    }
}