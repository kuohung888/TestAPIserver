using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Book_New_Samples_ListItemCollection_ListItem_01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)    //== 網頁第一次執行
        {
            // Create a new ListItemCollection.
            ListItemCollection listBoxData = new ListItemCollection();
            // Add items to the collection.
            listBoxData.Add(new ListItem("apples"));  //== 寫法一。加入新的子選項（ListItem型態）。
            listBoxData.Add(new ListItem("bananas"));
            listBoxData.Add(new ListItem("cherries"));
            listBoxData.Add("grapes");  //== 寫法二。加入新的子選項的「文字」（Text屬性）。
            listBoxData.Add("mangos");
            listBoxData.Add("oranges");
            //== 以下是 DataBinding（資料繫結、數據綁定）
            ListBox1.DataSource = listBoxData;
            ListBox1.DataBind();

            // Create a new ListItemCollection.
            ListItemCollection ddBoxData = new ListItemCollection();
            //== 以下是 DataBinding（資料繫結、數據綁定）
            DropDownList1.DataSource = ddBoxData;
            DropDownList1.DataBind();
        }

        // 以下只是「防呆」，沒選項了，怕人家按下去出錯。
        if (ListBox1.Items.Count == 0)
            moveButton1.Enabled = false;

        if (DropDownList1.Items.Count == 0)
            moveButton2.Enabled = false;

    }


    protected void moveButton1_Click(object sender, EventArgs e)
    {
        DropDownList1.SelectedIndex = -1;  //-- 沒有預設「被選取」的子選項。

        // Add the selected item to DropDownList1.
        DropDownList1.Items.Add(ListBox1.SelectedItem);
        // Delete the selected item from ListBox1.
        ListBox1.Items.Remove(ListBox1.SelectedItem);

        // 以下只是「防呆」，沒選項了，怕人家按下去出錯。
        if (ListBox1.Items.Count == 0)
            moveButton1.Enabled = false;
        else
            moveButton2.Enabled = true;
    }


    protected void moveButton2_Click(object sender, EventArgs e)
    {
        ListBox1.SelectedIndex = -1;  //-- 沒有預設「被選取」的子選項。

        // Add the selected item to ListBox1.
        ListBox1.Items.Add(DropDownList1.SelectedItem);
        // Delete the selected item from DropDownList1.
        DropDownList1.Items.Remove(DropDownList1.SelectedItem);

        // 以下只是「防呆」，沒選項了，怕人家按下去出錯。
        if (DropDownList1.Items.Count == 0)
            moveButton2.Enabled = false;
        else
            moveButton1.Enabled = true;
    }
}