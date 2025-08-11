using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_TextWrap_02 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        GridView1.Attributes.Add("Style", "word-break:break-all; word-break:break-word");
        // 在GridView轉換成傳統HTML表格時，加入這段CSS。

        // 執行後，網頁的HTML原始檔：  
        // <table cellspacing="0" rules="all" border="1" id="GridView1" style="border-collapse:collapse;word-break:break-all; word-break:break-word">
    }
}