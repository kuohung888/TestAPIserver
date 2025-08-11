using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_dropdownlist_Request : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write("<h2>");

        Response.Write(Request["DropDownList1"].ToString() + "<br />");
        //-- 即使IIS編譯之後，轉成標準HTML表單的下拉式選項，ID名稱仍為 DropDownList1。

        //-- 建議使用 DropDownList1.UniqueID（獨一無二的ID，專門給JavaScript使用）會更好！
        Response.Write(Request[DropDownList1.UniqueID].ToString());

        Response.Write("</h2>");
    }
}