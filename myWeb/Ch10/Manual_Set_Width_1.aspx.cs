using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch10_Manual_Set_Width_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //--資料來源：http://msdn.microsoft.com/zh-tw/library/ms178296.aspx

        int colWidth  = Convert.ToInt32(Server.HtmlEncode(TextBox1.Text));

        if (colWidth > 0)
        {
            for (int i = 0; i < GridView1.Columns.Count; i++)
            {
                GridView1.Columns[i].ItemStyle.Width = colWidth;
                // GridView每一欄（行）Columns(i)的寬度（ItemStyle.Width）屬性
            }
        }
        else
        {
            Label1.Text = "輸入的寬度，不可小於、等於[零]";
        }
            
    }
}