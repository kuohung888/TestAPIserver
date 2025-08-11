using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;     // ITemplate要用的NameSpace
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
public partial class Ch11_GridView_Dynamic_Add_Template_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Add_TF();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {  // GridView 分頁
        //GridView1.PageIndex = e.NewPageIndex;
        //Add_TF();
    }


    void Add_TF()
    {
        //*************************************************************************
        //--這一段 For迴圈，一旦取消，就會出現異常狀況！重複按下按鈕，會不斷增加樣板。
        //*************************************************************************
        //for (int index = 2; index < GridView1.Columns.Count; index++)    //index=2表示 GridView預設有兩個資料欄位出現在畫面上
        //{   //這個 for迴圈，如果取消。那麼重複按下按鈕，會不斷增加樣板。
        //    GridView1.Columns[index].Visible = false;
        //    // 將 GridView的「EnableViewState」屬性= false，也可以代替這段程式！
        //}

        for (int i = 0; i < Convert.ToInt32(DropDownList1.SelectedValue); i++)
        {
            TemplateField tf = new TemplateField();
            tf.ShowHeader = true;
            tf.HeaderTemplate = new Add_GridViewTemplate(DataControlRowType.Header, "<font color=yellow>動態加入的</font>");
            tf.ItemTemplate = new Add_GridViewTemplate(DataControlRowType.DataRow, "");

            GridView1.Columns.Add(tf);
        }

        //GridView已經搭配 SqlDataSource，所以下面一行可以省略。
        //GridView1.DataBind();
    }
}



//== Start ==================================================
public class Add_GridViewTemplate : ITemplate
{   // 需要的NameSpace -- System.Web.UI
    // 參考資料：http://msdn.microsoft.com/zh-tw/library/system.web.ui.itemplate.aspx

    private DataControlRowType dcrType;
    private string column_title;

    public Add_GridViewTemplate(DataControlRowType type, string colname)
    {
        dcrType = type;
        column_title = colname;
    }

    public void InstantiateIn(System.Web.UI.Control container)
    {  // ITemplate只有一個 InstantiateIn()方法，此方法需要輸入一個控制項(container)
        // 當實作Class時，定義子控制項和樣板所屬的Control 物件。這些子控制項依次定義在內嵌樣板內。
        switch (dcrType)
        {
            case DataControlRowType.Header:  // GridView表頭
                Literal literal1 = new Literal();
                literal1.Text = column_title;
                container.Controls.Add(literal1);
                break;

            case DataControlRowType.DataRow:  // Gridview資料列
                DropDownList ddl = new DropDownList();  //動態加入 DropDownList
                ddl.ID = "DropDownList_Add";
                ddl.AppendDataBoundItems = true;
                ddl.Items.Add(new ListItem("-----請選擇------", ""));
                ddl.Items.Add(new ListItem("子選項A", "a"));    // 左邊是Text，右邊是Value。
                ddl.Items.Add(new ListItem("子選項B", "b"));
                ddl.Items.Add(new ListItem("子選項C", "c"));
                container.Controls.Add(ddl);
                break;

            default:
                break;
        }
    }
}
//== End ====================================================