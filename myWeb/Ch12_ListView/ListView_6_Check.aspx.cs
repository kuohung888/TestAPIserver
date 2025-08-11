using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//===================================
using System.Collections;   //--DictionaryEntry需要用到！
//===================================


public partial class Book_Sample_Ch12_ListView_ListView_6_Check : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void ListView1_ItemInserting(object sender, ListViewInsertEventArgs e)
    {
        //--資料來源：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listview.itemupdating.aspx

        // Cancel the update operation if any of the fields is empty or null.
        foreach (DictionaryEntry de in e.Values)   //--注意這裡的差異！
        {
            // Check if the value is null or empty.
            if (de.Value == null || de.Value.ToString().Trim().Length == 0)
            {
                Label1.Text = "（欄位不可以留空白！必填！）Cannot set a field to an empty value.";
                e.Cancel = true;   //取消本次的更新。
            }
        }
    }


    protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
    {
        //--資料來源：http://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listview.itemupdating.aspx

        // Cancel the update operation if any of the fields is empty or null.
        foreach (DictionaryEntry de in e.NewValues)   //--注意這裡的差異！
        {
            // Check if the value is null or empty.
            if (de.Value == null || de.Value.ToString().Trim().Length == 0)
            {
                Label1.Text = "（欄位不可以留空白！必填！）Cannot set a field to an empty value.";
                e.Cancel = true;   //取消本次的更新。
            }
        }
    }
}