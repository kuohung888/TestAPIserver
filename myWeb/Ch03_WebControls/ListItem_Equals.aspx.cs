using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_ListItem_Equals : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void addButton_Click(object sender, EventArgs e)
    {
        //--參考來源： http://msdn.microsoft.com/zh-tw/library/bsc2ak47.aspx

        if (ListBox1.Items.Equals(DropDownList1.SelectedItem))
        {
            Response.Write("<Script Language=JavaScript>window.alert(\"這個 Object相等\")</Script>");
        }            
        else
        {
            Response.Write("<Script Language=JavaScript>window.alert(\" ***抱歉，這個 Object不相等*** \")</Script>");
            //-- Items（子選項的集合）與 SelectItem（子選項）並不是同一個 Object。
            //-- Items（子選項的集合）是 ListItemCollection類別。
            //-- SelectItem（子選項）是	ListItem類別。
        }

    }
}