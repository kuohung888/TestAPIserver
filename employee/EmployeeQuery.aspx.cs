using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace employee
{
    public partial class EmployeeQuery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDepartmentDropDown();
            }
        }

        private void BindDepartmentDropDown()
        {
            string connStr = ConfigurationManager.ConnectionStrings["EmployeeDBConnectionString"].ConnectionString;
            string sql = "SELECT DISTINCT Department FROM Employees WHERE Department IS NOT NULL AND Department <> '' ORDER BY Department";
            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                conn.Open();
                ddlDepartment.DataSource = cmd.ExecuteReader();
                ddlDepartment.DataTextField = "Department";
                ddlDepartment.DataValueField = "Department";
                ddlDepartment.DataBind();
                ddlDepartment.Items.Insert(0, new System.Web.UI.WebControls.ListItem("全部", ""));
            }
        }

        protected void btnQuery_Click(object sender, EventArgs e)
        {
           

            string name = txtName.Text.Trim();
            string department = ddlDepartment.SelectedValue;

            string connStr = ConfigurationManager.ConnectionStrings["EmployeeDBConnectionString"].ConnectionString;
            string sql = @"SELECT EmployeeID, FirstName, LastName, Position, Department, HireDate, Salary
                           FROM Employees
                           WHERE (@Name = '' OR FirstName LIKE '%' + @Name + '%' OR LastName LIKE '%' + @Name + '%')
                             AND (@Department = '' OR Department = @Department)";

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@Name", name);
                cmd.Parameters.AddWithValue("@Department", department);

                DataTable dt = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
                gvResult.DataSource = dt;
                gvResult.DataBind();
            }
        }
    }
}