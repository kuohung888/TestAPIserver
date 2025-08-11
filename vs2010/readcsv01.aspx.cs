using Microsoft.VisualBasic.FileIO;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web.Services;
using System.Web.UI.WebControls;

namespace AirQualityWeb
{
    public partial class readcsv01 : System.Web.UI.Page
    {


        // 靜態 DataTable 快取 CSV 資料
        private static DataTable dataTable;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 首次載入或應用程式重啟後，讀取 CSV
            if (dataTable == null)
            {
                LoadCsvToDataTable();
            }

            if (!IsPostBack)
            {
                // 綁定主篩選下拉與表格
                BindFilterDropDowns();
                BindGrid(dataTable);
            }

        }

        /// <summary>
        /// 以 StreamReader 讀取 aqx_data.csv，建立 DataTable
        /// </summary>
        private void LoadCsvToDataTable()
        {
            dataTable = new DataTable();
            string csvPath = Server.MapPath("~/App_Data/aqx_data.csv");

            using (var sr = new StreamReader(csvPath))
            {
                bool firstLine = true;
                while (!sr.EndOfStream)
                {
                    string line = sr.ReadLine();
                    if (string.IsNullOrWhiteSpace(line)) continue;

                    // 簡易用逗號切割
                    string[] cols = line.Split(',');

                    if (firstLine)
                    {
                        // 第一行作為欄位
                        foreach (string header in cols)
                        {
                            dataTable.Columns.Add(header.Trim());
                        }
                        firstLine = false;
                    }
                    else
                    {
                        // 其餘行新增為 DataRow
                        DataRow row = dataTable.NewRow();
                        for (int i = 0; i < cols.Length && i < dataTable.Columns.Count; i++)
                        {
                            row[i] = cols[i].Trim();
                        }
                        dataTable.Rows.Add(row);
                    }
                }
            }
        }

        /// <summary>
        /// 綁定主頁面篩選下拉：測站名稱 / 檢測項目 / 監測月份
        /// </summary>
        private void BindFilterDropDowns()
        {
            // 測站名稱
            ddlSite.Items.Clear();
            ddlSite.Items.Add(new ListItem("全部", ""));
            dataTable.AsEnumerable()
                     .Select(r => r.Field<string>("sitename"))
                     .Distinct()
                     .OrderBy(n => n, StringComparer.CurrentCulture)
                     .ToList()
                     .ForEach(n => ddlSite.Items.Add(new ListItem(n, n)));

            // 檢測項目
            ddlItem.Items.Clear();
            ddlItem.Items.Add(new ListItem("全部", ""));
            dataTable.AsEnumerable()
                     .Select(r => r.Field<string>("itemname"))
                     .Distinct()
                     .OrderBy(n => n, StringComparer.CurrentCulture)
                     .ToList()
                     .ForEach(n => ddlItem.Items.Add(new ListItem(n, n)));

            // 監測月份
            ddlMonth.Items.Clear();
            ddlMonth.Items.Add(new ListItem("全部", ""));
            dataTable.AsEnumerable()
                     .Select(r => r.Field<string>("monitormonth"))
                     .Distinct()
                     .OrderBy(n => n)
                     .ToList()
                     .ForEach(n => ddlMonth.Items.Add(new ListItem(n, n)));
        }

        /// <summary>
        /// 綁定圖表下拉用的「測站名稱」
        /// </summary>
        private void BindChartStationDropdown(DropDownList ddl)
        {
            ddl.Items.Clear();
            ddl.Items.Add(new ListItem("全部", ""));
            dataTable.AsEnumerable()
                     .Select(r => r.Field<string>("sitename"))
                     .Distinct()
                     .OrderBy(n => n, StringComparer.CurrentCulture)
                     .ToList()
                     .ForEach(n => ddl.Items.Add(new ListItem(n, n)));
        }

        /// <summary>
        /// 綁定第二張圖的「檢測項目」
        /// </summary>
        private void BindChartItemDropdown(DropDownList ddl)
        {
            ddl.Items.Clear();
            ddl.Items.Add(new ListItem("全部", ""));
            dataTable.AsEnumerable()
                     .Select(r => r.Field<string>("itemname"))
                     .Distinct()
                     .OrderBy(n => n, StringComparer.CurrentCulture)
                     .ToList()
                     .ForEach(n => ddl.Items.Add(new ListItem(n, n)));
        }

        /// <summary>
        /// 主頁面篩選條件改變時重新綁定 GridView
        /// </summary>
        protected void FilterChanged(object sender, EventArgs e)
        {
            var filters = new List<string>();

            if (!string.IsNullOrEmpty(ddlSite.SelectedValue))
                filters.Add($"[sitename] = '{Escape(ddlSite.SelectedValue)}'");
            if (!string.IsNullOrEmpty(ddlItem.SelectedValue))
                filters.Add($"[itemname] = '{Escape(ddlItem.SelectedValue)}'");
            if (!string.IsNullOrEmpty(ddlMonth.SelectedValue))
                filters.Add($"[monitormonth] = '{Escape(ddlMonth.SelectedValue)}'");

            var dv = new DataView(dataTable)
            {
                RowFilter = string.Join(" AND ", filters)
            };
            BindGrid(dv.ToTable());
        }

        /// <summary>
        /// 取代單引號，避免 DataView RowFilter 語法錯誤
        /// </summary>
        private string Escape(string s) => s.Replace("'", "''");

        /// <summary>
        /// 綁定 GridView
        /// </summary>
        private void BindGrid(DataTable dt)
        {
            gvData.DataSource = dt;
            gvData.DataBind();
        }

        /// <summary>
        /// GridView 排序事件
        /// </summary>
        protected void gvData_Sorting(object sender, GridViewSortEventArgs e)
        {
            string expr = e.SortExpression;
            string dir = "ASC";

            if (ViewState["SortExpr"] as string == expr)
                dir = (ViewState["SortDir"] as string == "ASC") ? "DESC" : "ASC";

            ViewState["SortExpr"] = expr;
            ViewState["SortDir"] = dir;

            var dv = new DataView(dataTable)
            {
                Sort = $"[{expr}] {dir}"
            };
            BindGrid(dv.ToTable());
        }

        

    }
}
