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

//----自己寫的----
using System.Web.Configuration;
using System.Data.SqlClient;
//----自己寫的----



public partial class Ch09_GridView_inside_DropDownList_DataSet_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            mis2000lab_DataSet();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;   //--進入「編輯」模式
        mis2000lab_DataSet();
    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;    //--取消「編輯」模式
        mis2000lab_DataSet();
    }





    //===============================================(Start)===
    protected void mis2000lab_DataSet()
    { 
        //**** db_user資料表的性別欄位，與RadioButtonList進行搭配 ****
        String sqlstr;
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString.ToString());
        SqlDataAdapter myAdapter =new SqlDataAdapter();
        DataSet ds = new DataSet();
 
        try
        {
            sqlstr = "select id, real_name, sex from db_user";
            myAdapter = new SqlDataAdapter(sqlstr, Conn);

            myAdapter.Fill(ds, "test");    //---- 這時候執行SQL指令。取出資料，放進 DataSet。

            GridView1.DataSource = ds.Tables["test"].DefaultView;      //----標準寫法
            GridView1.DataBind();

            //----重點(start)--------------------------------------------------------------
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                RadioButtonList u_radio = (RadioButtonList)GridView1.Rows[i].FindControl("RadioButtonList1");
                if (u_radio.Items[0].Value == ds.Tables["test"].Rows[i]["sex"].ToString())    {
                    u_radio.Items[0].Selected = true;
                    //--因為RadioButtonList1只有「男」、「女」兩個子選項
                }
                else   {
                    u_radio.Items[1].Selected = true;
                }                
           }
           //----重點(end)--------------------------------------------------------------- 
        }           
        catch (Exception ex)
        {
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<HR/>");
        }
        //===============================================(End)===
    }


}
