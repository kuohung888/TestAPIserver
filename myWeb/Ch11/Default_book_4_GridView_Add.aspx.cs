using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Ch11_Default_book_4_GridView_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "myInsert")
        {
            GridView1.DataSourceID = null; 
            //==註解： DataSourceID屬性如果是「空」的，就會引發錯誤，找不到資料！
            //==            此時便會展開 GridView的「EmptyData」樣版了！
        }
    }


    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        GridView1.DataSourceID = "SqlDataSource1";
        //== 完成新增一筆資料後，重新讓 GridView作 DataBinding，展示資料庫裡面的全部最新資料。
    }
}
