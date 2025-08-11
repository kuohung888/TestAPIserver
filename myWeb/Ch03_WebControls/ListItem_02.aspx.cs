using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//=======================================
using System.Data;   //==請自己動手加入命名空間。
//=======================================

public partial class _Book_New_Samples_ListItemCollection_ListItem_02 : System.Web.UI.Page
{
    //== 全域變數 ==
    private DataView dv;
    private DataTable dt = new DataTable();


    protected void Page_Load(object sender, EventArgs e)
    {
        // Set the number of rows displayed in the ListBox to be// the number of items in the ListBoxCollection.
        ListBox1.Rows = ListBox1.Items.Count;

        // If the DataTable is already stored in the Web form's default
        // HttpSessionState variable, then don't recreate the DataTable.
        if (Session["data"] == null)
        {
            // Add columns to the DataTable.
            dt.Columns.Add(new DataColumn("Item"));
            dt.Columns.Add(new DataColumn("Price"));
            // Store the DataTable in the Session variable so it can // be accessed again later.
            Session["data"] = dt;

            // Use the table to create a DataView, because the DataGrid// can only bind to a data source that implements IEnumerable.
            dv = new DataView(dt);

            // 以下是 DataBinding（資料繫結、數據綁定）
            GridView1.DataSource = dv;
            GridView1.DataBind();
        }
    }

    protected void addButton_Click(object sender, EventArgs e)
    {

        foreach (ListItem item in ListBox1.Items)
        {
            if (item.Selected)
            {
                // Add the item to the GridView1.
                // First, get the DataTable from the Session variable.
                dt = (DataTable)Session["data"];

                if (dt != null)
                {
                    // Create a new DataRow in the DataTable.
                    DataRow dr = dt.NewRow();
                    // Add the item to the new DataRow.
                    dr["Item"] = item.Text;
                    // Add the item's value to the DataRow.
                    dr["Price"] = item.Value;
                    // Add the DataRow to the DataTable.
                    dt.Rows.Add(dr);

                    // 重新作一次DataBinding（資料繫結、數據綁定）
                    dv = new DataView(dt);

                    GridView1.DataSource = dv;
                    GridView1.DataBind();
                }
            }
         }

    }
}