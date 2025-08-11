using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch12_ListView_Repeater_NamingContainer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Response.Write("<h3>您剛剛按下的按鈕是：（從零算起。由下而下）</h3>");
        Response.Write(Repeater1.Items[e.Item.ItemIndex].ItemIndex.ToString());
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        //== Repeater的「Items」屬性，指的是 ItemTemplate有五筆記錄！
        foreach (RepeaterItem myCurrentItem in Repeater1.Items)
        {
           // Display the UniqueID.
            Control myItem = (Control)myCurrentItem.Controls[7];
            myLabel1.Text += "<br />The UniqueID is : " + myItem.UniqueID;

            //==============================================
            Control myNamingContainer = (Control)myCurrentItem.Controls[7].NamingContainer;

            // Display the NamingContainer.
            myLabel2.Text += "<br />The NamingContainer is : " + myNamingContainer.UniqueID;
        }


        //===================================
        //== 上面的 .Controls()方法，裡面的 Index索引值。
        //== 輸入 1，可以抓到 Button1。
        //== 輸入 3，可以抓到 Label1。id欄位。
        //== 輸入 5，可以抓到 Label2。test_time欄位。
        //== 輸入 7，可以抓到 Label3。Title欄位。
        //==請您參閱範例 Repeater_Items.aspx，會比較容易瞭解。
    }
}