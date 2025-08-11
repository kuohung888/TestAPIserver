using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChartMultiDim : System.Web.UI.Page
{

    private static DataTable dataTable;

    protected void Page_Load(object sender, EventArgs e)
    {
        // 首次呼叫時或應用重啟後載入 CSV
        if (dataTable == null)
        {
            LoadCsvToDataTable();
        }
    }

    /// <summary>
    /// 讀取 CSV 建立 DataTable
    /// </summary>
    private void LoadCsvToDataTable()
    {
        var dt = new DataTable();
        string path = Server.MapPath("~/App_Data/aqx_data.csv");
        using (var sr = new StreamReader(path))
        {
            bool first = true;
            while (!sr.EndOfStream)
            {
                var line = sr.ReadLine();
                if (string.IsNullOrWhiteSpace(line)) continue;
                var cols = line.Split(',');

                if (first)
                {
                    foreach (var h in cols) dt.Columns.Add(h.Trim());
                    first = false;
                }
                else
                {
                    var dr = dt.NewRow();
                    for (int i = 0; i < cols.Length && i < dt.Columns.Count; i++)
                        dr[i] = cols[i].Trim();
                    dt.Rows.Add(dr);
                }
            }
        }
        dataTable = dt;
    }

    /// <summary>
    /// 取得 distinct 測站名稱
    /// </summary>
    [WebMethod]
    public static string[] GetDistinctStations()
    {
        return dataTable.AsEnumerable()
                        .Select(r => r.Field<string>("sitename"))
                        .Distinct()
                        .OrderBy(s => s)
                        .ToArray();
    }

    /// <summary>
    /// 取得 distinct 檢測項目
    /// </summary>
    [WebMethod]
    public static string[] GetDistinctItems()
    {
        return dataTable.AsEnumerable()
                        .Select(r => r.Field<string>("itemname"))
                        .Distinct()
                        .OrderBy(i => i)
                        .ToArray();
    }

    /// <summary>
    /// 多維度資料：StationName, ItemName, Avg
    /// </summary>
    [WebMethod]
    public static object[] GetMultiDimData(string stationName, string itemName)
    {
        var query = dataTable.AsEnumerable()
            .Where(r => (string.IsNullOrEmpty(stationName) || r.Field<string>("sitename") == stationName)
                     && (string.IsNullOrEmpty(itemName)    || r.Field<string>("itemname") == itemName));

        var result = query
            .GroupBy(r => new
            {
                Station = r.Field<string>("sitename"),
                Item = r.Field<string>("itemname")
            })
            .Select(g => new
            {
                StationName = g.Key.Station,
                ItemName = g.Key.Item,
                Avg = Math.Round(g.Average(r => Convert.ToDouble(r.Field<string>("concentration"))), 2)
            })
            .ToArray();

        return result;
    }
}