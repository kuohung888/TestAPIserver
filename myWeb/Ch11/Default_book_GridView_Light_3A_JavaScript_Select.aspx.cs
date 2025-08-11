using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch07_Default_book_GridView_Light_3A_JavaScript : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;
                
            if (e.Row.RowState == DataControlRowState.Selected)
                return;

                e.Row.Attributes.Add("OnMouseover", "this.style.backgroundColor='#E3EAEB'");
                e.Row.Attributes.Add("OnMouseout", "this.style.backgroundColor='#FFFFFF'");
        
            //    // if (e.Row.RowState == (DataControlRowState.Selected) ||
            //    //    e.Row.RowState == (DataControlRowState.Selected & DataControlRowState.Alternate))
            //{
            //    e.Row.Attributes.Remove("OnMouseover");
            //    e.Row.Attributes.Remove("OnMouseout");
            //}

}




    //=== 對照組（尚未修改以前）========================
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {       //==要加入 JavaScript的光棒效果，每一列（Row）都必須加入才行。    
                e.Row.Attributes.Add("OnMouseover", "this.style.backgroundColor='#E3EAEB'");
                e.Row.Attributes.Add("OnMouseout", "this.style.backgroundColor='#FFFFFF'");
        }
    }


}