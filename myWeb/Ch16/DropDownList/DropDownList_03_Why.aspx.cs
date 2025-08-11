using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch16_DropDownList_DropDownList_03_Why : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //*** 正確寫法 ******
        // 點選哪一個子選項，哪一個就是.Selected = true
        //int i = DropDownList1.SelectedIndex;
        //DropDownList1.Items[i].Selected = true;


        //*** 錯誤寫法 ******
        DropDownList1.Items[4].Selected = true;
        // 預設的情況下，第一個子選項（Index = 0）就是 .Selected
        // 您用程式去變動「預設選定的」子選項，就會出現兩個 .Selected = true而報錯！！

    }
}