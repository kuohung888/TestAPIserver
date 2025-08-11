using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_ListItem_CopyTo_Clear_AddRange : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //-- (1). 宣告一個 ListItem陣列
        ListItem[] myListItemArray = new ListItem[ListBox1.Items.Count];
        ListBox1.Items.CopyTo(myListItemArray, 0);
        //-- 將全部子選項的集合，複製到陣列裡面。

        //-- (2). 刪除 ListBox的所有子選項。
        ListBox1.Items.Clear();


        String listResults= "";

        foreach(ListItem myItem2 in myListItemArray)
        {
            listResults = listResults + myItem2.Text + "<br />";
        }
        Label1.Text = "子選項已經全部刪除，如下：<br />" + listResults;


        DropDownList1.Items.AddRange(myListItemArray);
        //-- (3). 透過陣列，批次搬移所有的 Item。
        //-- 資料來源：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listitemcollection.addrange.aspx
    }
}