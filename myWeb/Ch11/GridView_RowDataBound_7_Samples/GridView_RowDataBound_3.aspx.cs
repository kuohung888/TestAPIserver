using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch11_GridView_RowDataBound_3 : System.Web.UI.Page
{

    //============================
    protected int widestData;
    //== 資料來源： http://msdn.microsoft.com/zh-tw/library/ms178296(v=VS.100).aspx


    protected void Page_Load(object sender, EventArgs e)
    {
        widestData = 0;
    }


    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        System.Data.DataRowView drv;
        drv = (System.Data.DataRowView)e.Row.DataItem;
        if (e.Row.RowType == DataControlRowType.DataRow)          //== 通常都會搭配這段 if 判別式
        {
            if (drv != null)
            {
                String catName = drv[1].ToString();
                //Response.Write(catName + "<br />");   //-- catName是第二格（title欄位）的文字

                int catNameLen = catName.Length;
                if (catNameLen > widestData)
                {
                    widestData = catNameLen;
                }
                GridView1.Columns[2].ItemStyle.Width = widestData * 30;
                GridView1.Columns[2].ItemStyle.Wrap = false;   //--  是否自動換列？
            }
        }
        //*********************************************************
        //*** 重點！！請您瞭解這個事件的參數 e代表什麼意思？ ***
        //*********************************************************
        //-- 這個事件的「e」，代表 GridView產生畫面上的「每一列」。
    }
}