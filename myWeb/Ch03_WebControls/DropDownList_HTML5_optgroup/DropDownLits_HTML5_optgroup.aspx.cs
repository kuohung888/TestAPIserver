using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Book_Sample_Ch03_WebControls_DropDownLits_HTML5_optgroup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //資料來源：http://stackoverflow.com/questions/130020/dropdownlist-control-with-optgroups-for-asp-net-webforms
        // 請在 /App_Code裡面加入這個 DropDownListAdapter類別檔
        // 請把 本目錄底下的 /App_Borwser放到網站的根目錄

        ListItem item1 = new ListItem("Camel", "1");
        item1.Attributes["OptionGroup"] = "Mammals";

        ListItem item2 = new ListItem("Lion", "2");
        item2.Attributes["OptionGroup"] = "Mammals";

        ListItem item3 = new ListItem("Whale", "3");
        item3.Attributes["OptionGroup"] = "Mammals";

        ListItem item4 = new ListItem("Walrus", "4");
        item4.Attributes["OptionGroup"] = "Mammals";

        ListItem item5 = new ListItem("Velociraptor", "5");
        item5.Attributes["OptionGroup"] = "Dinosaurs";

        ListItem item6 = new ListItem("Allosaurus", "6");
        item6.Attributes["OptionGroup"] = "Dinosaurs";

        ListItem item7 = new ListItem("Triceratops", "7");
        item7.Attributes["OptionGroup"] = "Dinosaurs";

        ListItem item8 = new ListItem("Stegosaurus", "8");
        item8.Attributes["OptionGroup"] = "Dinosaurs";

        ListItem item9 = new ListItem("Tyrannosaurus", "9");
        item9.Attributes["OptionGroup"] = "Dinosaurs";

        ddlItems.Items.Add(item1);
        ddlItems.Items.Add(item2);
        ddlItems.Items.Add(item3);
        ddlItems.Items.Add(item4);
        ddlItems.Items.Add(item5);
        ddlItems.Items.Add(item6);
        ddlItems.Items.Add(item7);
        ddlItems.Items.Add(item8);
        ddlItems.Items.Add(item9);
    }
}