using MySql.Data.MySqlClient;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI.WebControls;

public partial class mysqlDBAccess_1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtKeyword.Attributes.Add("placeholder", "請輸入關鍵字");
            LoadData();
        }
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        GridView1.PageIndex = 0; // 查詢後從第一頁開始
        LoadData(txtKeyword.Text.Trim());
    }

    protected void ddlPageSize_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView1.PageSize = int.Parse(ddlPageSize.SelectedValue);
        GridView1.PageIndex = 0; // 調整筆數後也從第一頁
        LoadData(txtKeyword.Text.Trim());
    }



    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        LoadData(txtKeyword.Text.Trim());
    }


    private void LoadData(string keyword = "")
    {
        string connStr = ConfigurationManager.ConnectionStrings["MySqlConnStr"].ConnectionString;
        using (MySqlConnection conn = new MySqlConnection(connStr))
        {
            conn.Open();

            string sql = "SELECT * FROM common_defect_statistics_report ";
            if (!string.IsNullOrEmpty(keyword))
            {
                sql += " WHERE defect_code LIKE @keyword OR product_name LIKE @keyword";
            }
         

            using (MySqlCommand cmd = new MySqlCommand(sql, conn))
            {
                if (!string.IsNullOrEmpty(keyword))
                {
                    cmd.Parameters.AddWithValue("@keyword", "%" + keyword + "%");
                }

                using (MySqlDataAdapter adapter = new MySqlDataAdapter(cmd))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();


                    lblTotalCount.Text = string.Format("查詢結果共 {0} 筆資料", dt.Rows.Count);
                }
            }
        }
    }
}
