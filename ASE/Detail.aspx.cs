using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
public partial class Detail : System.Web.UI.Page
{

    private string connStr = ConfigurationManager.ConnectionStrings["ASEConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string workOrderNumber = Request.QueryString["workOrderNumber"];
            if (!string.IsNullOrEmpty(workOrderNumber))
            {
                LoadWorkOrderDetail(workOrderNumber);
            }
            else
            {
                // 無工單號參數，導回列表頁
                Response.Redirect("Default.aspx");
            }
        }
    }

    private void LoadWorkOrderDetail(string workOrderNumber)
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            string sql = @"
                    SELECT WO.WorkOrderNumber, E.EmployeeName, E.Position, E.Phone
                    FROM WorkOrders WO
                    INNER JOIN Employees E ON WO.EmployeeID = E.EmployeeID
                    WHERE WO.WorkOrderNumber = @WorkOrderNumber
                ";

            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@WorkOrderNumber", workOrderNumber);

            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                lblWorkOrderNumber.Text = "工單號：" + reader["WorkOrderNumber"].ToString();
                lblEmployeeName.Text = "負責員工：" + reader["EmployeeName"].ToString();
                lblEmployeePosition.Text = "職稱：" + reader["Position"].ToString();
                lblEmployeePhone.Text = "聯絡電話：" + reader["Phone"].ToString();
            }
            else
            {
                lblWorkOrderNumber.Text = "找不到該工單資料。";
                lblEmployeeName.Text = "";
                lblEmployeePosition.Text = "";
                lblEmployeePhone.Text = "";
            }
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}