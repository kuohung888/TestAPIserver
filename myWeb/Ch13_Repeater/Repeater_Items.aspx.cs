using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch12_ListView_Repeater_Items : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Response.Write("<h3>您剛剛按下的按鈕是：（從零算起。由下而下）</h3>");

        Response.Write("Repeater1.Items(e.Item.ItemIndex).ItemIndex --" + Repeater1.Items[e.Item.ItemIndex].ItemIndex.ToString());
        Response.Write("<br />e.Item.ItemIndex --" + e.Item.ItemIndex);

        Response.Write("<br />Repeater1.Items.Count --" + Repeater1.Items.Count + "<hr / >");
        //== Repeater的「Items」屬性，指的是 ItemTemplate有五筆記錄！

        foreach (RepeaterItem row in Repeater1.Items)
        {
            Response.Write("<br />Repeater1.Items的 ItemType --" + row.ItemType);
            //=========================================
            //== Itemtype = 2 代表 Item（資料呈現的那一列）。
            //== ItemType =3 代表 AlternatingItem（隔列換色）。

            Response.Write("<ul>");
            for(int  i  = 0; i < 9; i++)
            {
                Response.Write("<li>Repeater1.Items的 控制項 UniqueID --" + row.Controls[i].UniqueID + "</li>");
            }                
            Response.Write("</ul>");
        }
    }
}