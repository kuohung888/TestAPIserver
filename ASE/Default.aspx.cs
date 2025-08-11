using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    private string connStr = ConfigurationManager.ConnectionStrings["ASEConnectionString"].ConnectionString;

    // 用於儲存排序欄位與方向
    private string SortExpression
    {
        get { return ViewState["SortExpression"] as string ?? "WorkOrderDate"; }
        set { ViewState["SortExpression"] = value; }
    }
    private string SortDirection
    {
        get { return ViewState["SortDirection"] as string ?? "DESC"; }
        set { ViewState["SortDirection"] = value; }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDropdownLists();
            BindGrid(0);
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        gvWorkOrders.PageIndex = 0; // 查詢時回到第一頁
        BindGrid(0);
    }

    protected void gvWorkOrders_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
    {
        gvWorkOrders.PageIndex = e.NewPageIndex;
        BindGrid(e.NewPageIndex);
    }

    protected void gvWorkOrders_Sorting(object sender, System.Web.UI.WebControls.GridViewSortEventArgs e)
    {
        if (SortExpression == e.SortExpression)
        {
            // 反轉排序方向
            SortDirection = SortDirection == "ASC" ? "DESC" : "ASC";
        }
        else
        {
            SortExpression = e.SortExpression;
            SortDirection = "ASC";
        }
        BindGrid(gvWorkOrders.PageIndex);
    }



    private void LoadDropdownLists()
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();

            // 載入客戶編號
            SqlCommand cmdCustomer = new SqlCommand("SELECT CustomerCode FROM Customers ORDER BY CustomerCode", conn);
            SqlDataReader readerCustomer = cmdCustomer.ExecuteReader();
            ddlCustomerCode.DataSource = readerCustomer;
            ddlCustomerCode.DataTextField = "CustomerCode";
            ddlCustomerCode.DataValueField = "CustomerCode";
            ddlCustomerCode.DataBind();
            readerCustomer.Close();

            // 載入站點代號
            SqlCommand cmdWorkstation = new SqlCommand("SELECT WorkstationCode FROM Workstations ORDER BY WorkstationCode", conn);
            SqlDataReader readerWorkstation = cmdWorkstation.ExecuteReader();
            ddlWorkstationCode.DataSource = readerWorkstation;
            ddlWorkstationCode.DataTextField = "WorkstationCode";
            ddlWorkstationCode.DataValueField = "WorkstationCode";
            ddlWorkstationCode.DataBind();
            readerWorkstation.Close();

            // 載入機台編號
            SqlCommand cmdMachine = new SqlCommand("SELECT MachineCode FROM Machines ORDER BY MachineCode", conn);
            SqlDataReader readerMachine = cmdMachine.ExecuteReader();
            ddlMachineCode.DataSource = readerMachine;
            ddlMachineCode.DataTextField = "MachineCode";
            ddlMachineCode.DataValueField = "MachineCode";
            ddlMachineCode.DataBind();
            readerMachine.Close();
        }
    }

    private void BindGrid(int pageIndex)
    {
        using (SqlConnection conn = new SqlConnection(connStr))
        {
            conn.Open();

            string sql = @"
            SELECT 
                WO.WorkOrderNumber, 
                C.CustomerCode, 
                WS.WorkstationCode, 
                M.MachineCode, 
                WO.WorkOrderDate, 
                WO.Status
            FROM WorkOrders WO
            INNER JOIN Customers C ON WO.CustomerID = C.CustomerID
            INNER JOIN Workstations WS ON WO.WorkstationID = WS.WorkstationID
            INNER JOIN Machines M ON WO.MachineID = M.MachineID
            WHERE 1=1
        ";

            if (!string.IsNullOrEmpty(ddlCustomerCode.SelectedValue))
            {
                sql += " AND C.CustomerCode = @CustomerCode ";
            }
            if (!string.IsNullOrEmpty(txtWorkOrderNumber.Text.Trim()))
            {
                sql += " AND WO.WorkOrderNumber LIKE @WorkOrderNumber ";
            }
            if (!string.IsNullOrEmpty(ddlWorkstationCode.SelectedValue))
            {
                sql += " AND WS.WorkstationCode = @WorkstationCode ";
            }
            if (!string.IsNullOrEmpty(ddlMachineCode.SelectedValue))
            {
                sql += " AND M.MachineCode = @MachineCode ";
            }
            if (!string.IsNullOrEmpty(txtDateFrom.Text.Trim()))
            {
                sql += " AND WO.WorkOrderDate >= @DateFrom ";
            }
            if (!string.IsNullOrEmpty(txtDateTo.Text.Trim()))
            {
                sql += " AND WO.WorkOrderDate <= @DateTo ";
            }
            if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
            {
                sql += " AND WO.Status = @Status ";
            }

            sql += $" ORDER BY {SortExpression} {SortDirection} ";

            SqlCommand cmd = new SqlCommand(sql, conn);

            if (!string.IsNullOrEmpty(ddlCustomerCode.SelectedValue))
            {
                cmd.Parameters.AddWithValue("@CustomerCode", ddlCustomerCode.SelectedValue);
            }
            if (!string.IsNullOrEmpty(txtWorkOrderNumber.Text.Trim()))
            {
                cmd.Parameters.AddWithValue("@WorkOrderNumber", "%" + txtWorkOrderNumber.Text.Trim() + "%");
            }
            if (!string.IsNullOrEmpty(ddlWorkstationCode.SelectedValue))
            {
                cmd.Parameters.AddWithValue("@WorkstationCode", ddlWorkstationCode.SelectedValue);
            }
            if (!string.IsNullOrEmpty(ddlMachineCode.SelectedValue))
            {
                cmd.Parameters.AddWithValue("@MachineCode", ddlMachineCode.SelectedValue);
            }
            if (!string.IsNullOrEmpty(txtDateFrom.Text.Trim()))
            {
                DateTime dtFrom;
                if (DateTime.TryParse(txtDateFrom.Text.Trim(), out dtFrom))
                    cmd.Parameters.AddWithValue("@DateFrom", dtFrom);
            }
            if (!string.IsNullOrEmpty(txtDateTo.Text.Trim()))
            {
                DateTime dtTo;
                if (DateTime.TryParse(txtDateTo.Text.Trim(), out dtTo))
                    cmd.Parameters.AddWithValue("@DateTo", dtTo);
            }
            if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
            {
                cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);

            gvWorkOrders.DataSource = dt;
            gvWorkOrders.DataBind();
        }
    }
}