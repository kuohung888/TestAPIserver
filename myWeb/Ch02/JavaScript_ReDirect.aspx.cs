using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch02_JavaScript_ReDirect : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //==== 失敗 ===
        //Response.Write("<script language='JavaScript'>window.alert('新增成功..');</script>");   //--這行都不會出現
        //Response.Redirect("http://www.yahoo.com.tw");


        //=========================================================


        //==== 成功！ ====
        //Response.Write("<script language='JavaScript'>if (confirm(\"按下確定，才會導向到其他網頁！\")) { window.location = \"http://www.google.com\"; } </script>");
        //--參考資料：http://www.tizag.com/javascriptT/javascriptconfirm.php



        //==== 成功！ ====
        Response.Write("<script language='JavaScript'>alert('JavaScript成功..');location.href='http://www.google.com';</script>");
        //--參考資料：http://www.blueshop.com.tw/board/FUM20041006161839LRJ/BRD201108181608513UW.html
    }
}