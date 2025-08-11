using System;
using System.Collections;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

//----自己寫的（宣告）----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告）----


public partial class Ch09_GridView_inside_DropDownList_Manual : System.Web.UI.Page
{
    //--共用變數-------------------
    DataSet ds = new DataSet();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            mis2000lab_DataSet();
        }        
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        mis2000lab_DataSet();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        mis2000lab_DataSet();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)    //--重點！！
        {
            //----重點(start)--------------------------------------------------------------
            //--不需要 for迴圈了
                RadioButtonList u_radio = (RadioButtonList)e.Row.FindControl("RadioButtonList1");    //--重點！！
                if (u_radio.Items[0].Value == ds.Tables["test"].Rows[e.Row.RowIndex]["sex"].ToString())   {
                    u_radio.Items[0].Selected = true;
                    //--因為RadioButtonList1只有「男」、「女」兩個子選項
                }
                else   {
                    u_radio.Items[1].Selected = true;
                }
            //----重點(end)---------------------------------------------------------------        
        }         
    }


    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        //-- 更新資料，寫回資料庫！
        TextBox my_real_name = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];
        Response.Write("<br />您剛剛修改的名字：" + my_real_name.Text);

        RadioButtonList my_sex = (RadioButtonList)GridView1.Rows[e.RowIndex].Cells[3].FindControl("RadioButtonList1");
        Response.Write("<br />您剛剛修改的性別：" + my_sex.SelectedValue.ToString());


        SqlDataSource SqlDataSource1 = new SqlDataSource();
        //== 連結資料庫的連接字串 ConnectionString  ==
        SqlDataSource1.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString;


        //== 設定SQL指令將會用到的參數 ==
        int my_id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);  //====主索引鍵====
        SqlDataSource1.UpdateParameters.Add("id", my_id.ToString());
        SqlDataSource1.UpdateParameters.Add("real_name", my_real_name.Text);
        SqlDataSource1.UpdateParameters.Add("sex", my_sex.SelectedValue.ToString());

        SqlDataSource1.UpdateCommand = "UPDATE [db_user] SET [real_name] = @real_name, [sex] = @sex WHERE [id] = @id";
        SqlDataSource1.Update();

        SqlDataSource1.Dispose();

        //-- 更新完畢，回到原本資料呈現的畫面
        GridView1.EditIndex = -1;    //--取消「編輯」模式
        mis2000lab_DataSet();
    }


    //======================================
    protected void mis2000lab_DataSet()
    {
        //**** db_user資料表的性別欄位，與RadioButtonList進行搭配 ****
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter;
        try
        {
            String sqlstr = "select id, real_name, sex from db_user";
            myAdapter = new SqlDataAdapter(sqlstr, Conn);

            myAdapter.Fill(ds, "test");    //---- 這時候執行SQL指令。取出資料，放進 DataSet。

            GridView1.DataSource = ds.Tables["test"].DefaultView;      //----標準寫法
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
        }
    }


}
