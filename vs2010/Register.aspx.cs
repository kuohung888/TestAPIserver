using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : Page
{
    protected void Page_Load(object sender, EventArgs e) { }

    // 验证：生日须满 18 岁
    protected void cvAge_ServerValidate(object source, ServerValidateEventArgs args)
    {
        DateTime dob;
        if (!DateTime.TryParse(args.Value, out dob))
        {
            args.IsValid = false;
            return;
        }
        // 计算年龄
        var age = DateTime.Today.Year - dob.Year;
        if (dob > DateTime.Today.AddYears(-age)) age--;

        args.IsValid = (age >= 18);
    }

    protected void btnReg_Click(object sender, EventArgs e)
    {
        Page.Validate();
        if (!Page.IsValid) return;

        lblResult.Text = "註冊成功！生日：" + txtDOB.Text;
    }
}