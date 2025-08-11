using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_ListItem_FindByText : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ListItem crItem;
        String searchText= TextBox1.Text;

        if (TextBox1.Text != "")   {
            searchText = TextBox1.Text;

            crItem = ListBox1.Items.FindByText(searchText);
            //== 注意！！.FindByText()方法。
            //== (1). 區分大小寫但不區分文化特性的比較，不執行部分搜尋或萬用字元搜尋。
            //== (2). 如果使用這個準則無法在集合中找到項目，則會傳回 null（VB為Nothing）。
            //== (3). 傳回值，是一個子選項（ListItem）。

            if (crItem == null)   {
                 Label1.Text = "<h3>找不到，不符合（有區分大小寫）。</h3>";
            }                
            else   {
                Label1.Text = "<h3> ***找到了！*** </h3>";
                Label1.Text += "<br />被搜尋到的子選項，「Text」屬性為 -- " + crItem.Text;
                Label1.Text += "<br />被搜尋到的子選項，「Value」屬性為 -- " + crItem.Value;
             }
        }
        else   {
            Label1.Text = "<h3>Sorry，您沒有輸入關鍵字....Orz。</h3>";
        }

        
        //-- 被搜尋到子選項，設為「已選取」。
        for (int i = 0; i < ListBox1.Items.Count; i++)
        {
            if (ListBox1.Items[i].Text == searchText)
                ListBox1.Items[i].Selected = true;
        }
    }
}