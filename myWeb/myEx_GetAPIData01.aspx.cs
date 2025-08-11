
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;            // for WebClient
using System.Text;          // for Encoding
using System.Web.UI;
using System.Web.UI.WebControls;
namespace TourApp
{
    public partial class myEx_GetAPIData01 : System.Web.UI.Page
    {
        private const string ApiUrl =
            "https://openapi.kcg.gov.tw/Api/Service/Get/80bbbbd3-9ee4-4244-98e9-b4c08deda91b";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAndBindData();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            LoadAndBindData();
        }

        private void LoadAndBindData()
        {
            var list = FetchData();
            gvSpots.DataSource = list;
            gvSpots.DataBind();

            // ─────── 加這幾行，讓 HeaderRow 成為 THEAD ───────
            if (gvSpots.HeaderRow != null)
                gvSpots.HeaderRow.TableSection = TableRowSection.TableHeader;

        }


        protected void gvSpots_PreRender(object sender, EventArgs e)
        {
            // 確保有 HeaderRow
            if (gvSpots.HeaderRow != null)
                gvSpots.HeaderRow.TableSection = TableRowSection.TableHeader;

            // （可選）若要 footer：
            // if (gvSpots.FooterRow != null)
            //     gvSpots.FooterRow.TableSection = TableRowSection.TableFooter;
        }


        // 同步抓資料：WebClient 範例（支援 .NET 4.0 起）
        private List<Spot> FetchData()
        {
            using (var wc = new WebClient { Encoding = Encoding.UTF8 })
            {
                string json = wc.DownloadString(ApiUrl);
                var root = JsonConvert.DeserializeObject<ApiRoot>(json);
                return root.Data.Select(x => new Spot
                {
                    Id = x.Id,
                    Status = x.Status,
                    Name = x.Name,
                    Description = x.Description,
                    Particpation = x.Particpation,
                    Location = x.Location,
                    Add = x.Add,
                    Tel = x.Tel,
                    Org = x.Org,
                    Start = x.Start,
                    End = x.End,
                    Cycle = x.Cycle,
                    Noncycle = x.Noncycle,
                    Map = x.Map,
                    Px = x.Px,
                    Py = x.Py,
                    Travellinginfo = x.Travellinginfo,
                    Parkinginfo = x.Parkinginfo,
                    Charge = x.Charge,
                    Remarks = x.Remarks,
                    Changetime = x.Changetime
                }).ToList();
            }
        }

    }
    // JSON Root
    public class ApiRoot
    {
        [JsonProperty("data")]
        public List<Spot> Data { get; set; }
    }

    // 直接把 SpotRaw 跟 Spot 合併，用 Auto-Property
    public class Spot
    {
        [JsonProperty("Id")]
        public string Id { get; set; }

        [JsonProperty("Status")]
        public string Status { get; set; }

        [JsonProperty("Name")]
        public string Name { get; set; }

        [JsonProperty("Description")]
        public string Description { get; set; }

        [JsonProperty("Particpation")]
        public string Particpation { get; set; }

        [JsonProperty("Location")]
        public string Location { get; set; }

        [JsonProperty("Add")]
        public string Add { get; set; }

        [JsonProperty("Tel")]
        public string Tel { get; set; }

        [JsonProperty("Org")]
        public string Org { get; set; }

        [JsonProperty("Start")]
        public string Start { get; set; }

        [JsonProperty("End")]
        public string End { get; set; }

        [JsonProperty("Cycle")]
        public string Cycle { get; set; }

        [JsonProperty("Noncycle")]
        public string Noncycle { get; set; }

        [JsonProperty("Map")]
        public string Map { get; set; }

        [JsonProperty("Px")]
        public string Px { get; set; }

        [JsonProperty("Py")]
        public string Py { get; set; }

        [JsonProperty("Travellinginfo")]
        public string Travellinginfo { get; set; }

        [JsonProperty("Parkinginfo")]
        public string Parkinginfo { get; set; }

        [JsonProperty("Charge")]
        public string Charge { get; set; }

        [JsonProperty("Remarks")]
        public string Remarks { get; set; }

        [JsonProperty("Changetime")]
        public string Changetime { get; set; }
    }
}

