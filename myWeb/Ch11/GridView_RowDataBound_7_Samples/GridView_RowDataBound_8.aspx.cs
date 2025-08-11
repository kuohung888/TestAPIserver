using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_RowDataBound_7_Samples_GridView_RowDataBound_8 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }


    //*****************************************************
    //** 參考資料：http://www.allenkuo.com/GenericArticle/view1374.aspx
    //*****************************************************
    protected void Page_Init(object sender, EventArgs e)
    {
        CommandField cf = new CommandField();
        cf.ShowEditButton = true;

        GridView1.Columns.Add(cf);
    }
}