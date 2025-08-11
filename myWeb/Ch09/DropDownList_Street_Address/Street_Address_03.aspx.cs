using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//----自己寫的（宣告)----
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//----自己寫的（宣告)----


public partial class Book_Sample_Ch09_DropDownList_Street_Address_Street_Address_03 : System.Web.UI.Page
{

    SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
    SqlDataReader dr = null;
    SqlCommand cmd =  null;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList2.Items.Count > 1)
        {
            DropDownList2.Items.Clear();  //-- 清除「區域」所有的 子選項

            DropDownList2.Items.Add("請選擇--");  //-- 手動設定一個子選項
            DropDownList2.Items[0].Value = "0";
            //----------------------------------------------------
            DropDownList3.Items.Clear();  //-- 清除「道路」所有的 子選項

            DropDownList3.Items.Add("請選擇--");  //-- 手動設定一個子選項
            DropDownList3.Items[0].Value = "0";
        }

        try   {
            DB_Open("select * from Address_2 Where a1_id = " + DropDownList1.SelectedValue, DropDownList2);
        }
        catch (Exception ex)
        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        }
        finally
        {   // == 釋放資源、關閉資料庫的連結。
            DB_Close();
        }
    }


    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList3.Items.Count > 1)
        {
            DropDownList3.Items.Clear();  //-- 清除所有的 子選項

            DropDownList3.Items.Add("請選擇--");  //-- 手動設定一個子選項
            DropDownList3.Items[0].Value = "0";
        }

        try   {
            DB_Open("select * from Address_3 Where a2_id = " + DropDownList2.SelectedValue, DropDownList3);
        }
        catch (Exception ex)
        {   //---- 如果程式有錯誤或是例外狀況，將執行這一段
            Response.Write("<b>Error Message----  </b>" + ex.ToString() + "<hr />");
        }
        finally
        {   // == 釋放資源、關閉資料庫的連結。
            DB_Close();
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Label1.Text = DropDownList1.SelectedItem.Text + "<br />" + DropDownList2.SelectedItem.Text + "<br />" + DropDownList3.SelectedItem.Text;
    }


    //=========================================================
    protected void DB_Open(String sqlstr, DropDownList my_WebControls)
    {
        cmd = new SqlCommand(sqlstr, Conn);
        Conn.Open();   //---- 這時候才連結DB
        dr = cmd.ExecuteReader();   //---- 這時候執行SQL指令，取出資料

        my_WebControls.DataSource = dr;   //-- DropDownList的基本設定，Text與 Value已經在HTML畫面裡設定完成。
        my_WebControls.DataBind();
    }

    protected void DB_Close()
    {
        if (dr != null)   {
            cmd.Cancel();
            dr.Close();
        }
        if (Conn.State == ConnectionState.Open)   {
            Conn.Close();
            Conn.Dispose(); //---- 一開始宣告有用到 New的,最後必須以 .Dispose()結束
        }
    }

}