using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch02_8_sample : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      // 註解：先將 if判別式的「整個架構」寫好。
      int a = 20;

      if (a > 10) 
      {
          Response.Write("恭喜你！ a 大於 10");
          // 註解：把 if判別式的架構完成後，再來寫裡面的內容！
      }

    }
}