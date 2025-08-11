using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//================================
using Microsoft.VisualBasic;
//--務必「加入參考」之後，才能在這裡加入命名空間！
//================================



public partial class Book_Sample_Ch03_WebControls_CS_Using_VB_Function : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String s = "Hello! The World!";

        Response.Write(Strings.Len(s));
    }
}