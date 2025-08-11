using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myEx_DropDownList01 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 初始化縣市下拉選單
            ddlCounty.DataSource = TaiwanAreas.Keys;
            ddlCounty.DataBind();
        }
    }

    // 縣市區域資料庫 (簡化範例)
    private static readonly Dictionary<string, List<string>> TaiwanAreas = new Dictionary<string, List<string>>
    {
        { "台北市", new List<string> { "中正區", "大同區", "中山區", "松山區", "大安區" } },
        { "新北市", new List<string> { "板橋區", "三重區", "中和區", "永和區", "新莊區" } },
        { "台中市", new List<string> { "中區", "東區", "南區", "西區", "北區" , "西屯區", "南屯區", "北屯區", "大里區", "神岡區"} },
        { "高雄市", new List<string> { "新興區", "前金區", "苓雅區", "鹽埕區", "鼓山區", "三民區", "小港區", "旗津區" } },
        { "台南市", new List<string> { "中西區", "東區", "南區", "北區", "安平區", "永康區", "仁德區" } }
    };

    // 縣市選擇變更事件
    protected void ddlCounty_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedCounty = ddlCounty.SelectedValue;
        ddlDistrict.Items.Clear();

        if (!string.IsNullOrEmpty(selectedCounty) && TaiwanAreas.ContainsKey(selectedCounty))
        {
            ddlDistrict.DataSource = TaiwanAreas[selectedCounty];
            ddlDistrict.DataBind();
            ddlDistrict.Items.Insert(0, new ListItem("請選擇區域", ""));
        }
        else
        {
            ddlDistrict.Items.Insert(0, new ListItem("請先選擇縣市", ""));
        }
    }


    // 自訂地址驗證
    protected void ValidateAddress(object source, ServerValidateEventArgs args)
    {
        args.IsValid = !string.IsNullOrEmpty(ddlCounty.SelectedValue) &&
                       !string.IsNullOrEmpty(ddlDistrict.SelectedValue);
    }

    // 送出按鈕事件
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            // 顯示結果
            lblName.Text = txtName.Text;
            lblFullAddress.Text = $"{ddlCounty.SelectedValue}{ddlDistrict.SelectedValue}{txtAddress.Text}";
            pnlResult.Style["display"] = "block";

            // 可在此加入資料庫儲存邏輯
            // SaveToDatabase(txtName.Text, ddlCounty.SelectedValue, ddlDistrict.SelectedValue, txtAddress.Text);
        }
    }
}