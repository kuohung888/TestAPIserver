using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myEx_DropDownList02 : System.Web.UI.Page
{
    // 範例資料：縣市、區域與郵遞區號
    private static readonly Dictionary<string, List<DistrictInfo>> taiwanData =
        new Dictionary<string, List<DistrictInfo>>()
    {
        {
            "臺北市", new List<DistrictInfo>()
            {
                new DistrictInfo("中正區", "100"),
                new DistrictInfo("大同區", "103"),
                new DistrictInfo("中山區", "104"),
            }
        },
        {
            "高雄市", new List<DistrictInfo>()
            {
                new DistrictInfo("鼓山區", "804"),
                new DistrictInfo("三民區", "807"),
                new DistrictInfo("鳥松區", "833"),
            }
        },
    };

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlCity.Items.Clear();
            ddlCity.Items.Add(new ListItem("--請選擇縣市--", ""));
            foreach (var city in taiwanData.Keys)
                ddlCity.Items.Add(new ListItem(city, city));

            ddlDistrict.Items.Add(new ListItem("--請先選縣市--", ""));
            ddlZip.Items.Add(new ListItem("--請先選縣市--", ""));
        }
    }

    protected void ddlCity_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDistrict.Items.Clear();
        ddlZip.Items.Clear();

        if (taiwanData.TryGetValue(ddlCity.SelectedValue, out var list))
        {
            ddlDistrict.Items.Add(new ListItem("--請選擇區域--", ""));
            foreach (var d in list)
                ddlDistrict.Items.Add(new ListItem(d.Name, d.Code));
            ddlZip.Items.Add(new ListItem("--請先選區域--", ""));
        }
        else
        {
            ddlDistrict.Items.Add(new ListItem("--請先選縣市--", ""));
            ddlZip.Items.Add(new ListItem("--請先選縣市--", ""));
        }
    }

    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlZip.Items.Clear();
        if (taiwanData.TryGetValue(ddlCity.SelectedValue, out var list))
        {
            var info = list.Find(d => d.Code == ddlDistrict.SelectedValue);
            if (info != null)
                ddlZip.Items.Add(new ListItem(info.Code, info.Code));
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            litResult.Text = $@"
                姓名：{txtName.Text}<br/>
                地址：{ddlCity.SelectedValue}{ddlDistrict.SelectedItem.Text}
                      {ddlZip.SelectedValue}{txtAddress.Text}";
            pnlResult.Visible = true;
        }
    }

    public class DistrictInfo
    {
        public string Name { get; set; }
        public string Code { get; set; }
        public DistrictInfo(string name, string code)
        {
            Name = name; Code = code;
        }
    }
}
