using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch12_ListView_ListView_ItemDataBound : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
	{
		// 參考資料 https://msdn.microsoft.com/zh-tw/library/system.web.ui.webcontrols.listviewitem.itemtype(v=vs.110).aspx
		if (e.Item.ItemType == ListViewItemType.DataItem)
		{
			// 發現 e.Item.DataItem 原來是 System.Data.DataRowView
			//Response.Write(e.Item.DataItem.ToString() + "<br>");
			
			System.Data.DataRowView DRV = (System.Data.DataRowView)e.Item.DataItem;

			// (1). 列出第一個欄位的值
			Response.Write("id--" + DRV.Row.ItemArray[0] + "<br />");

			// (2). 列出某一個欄位的值，透過.FindControl()方法
			Label LB = (Label)e.Item.FindControl("nameLabel");
			Response.Write(LB.Text + "<br />");

			// (3). 資料來源 http://www.dotblogs.com.tw/dyco/archive/2009/06/15/8830.aspx
			Response.Write(DataBinder.Eval(e.Item.DataItem, "student_id").ToString() + "<hr />");

		}
	}
}