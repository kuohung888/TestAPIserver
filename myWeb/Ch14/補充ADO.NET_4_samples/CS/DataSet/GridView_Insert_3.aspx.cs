using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//===========================
using System.Web.Configuration;   //自己寫的（宣告）
using System.Data;
using System.Data.SqlClient;
//===========================


public partial class Book_Sample_B09_Manual_Input_GridView_Insert_3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)  {
            DBinit();   //--第一次載入網頁，才會執行本程式。
        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //-- 參考資料：http://msdn.microsoft.com/zh-tw/library/system.data.sqlclient.sqldataadapter.insertcommand(VS.80).aspx
        //-- DataSet將資料加入DataTable：http://msdn.microsoft.com/zh-tw/library/z16c79x4(VS.80).aspx
        //*******************************************************
        //****  DataSet  /  資料新增 ****

        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString.ToString());
        DataSet ds = new DataSet();

        SqlDataAdapter u_Adapter = new SqlDataAdapter();
        u_Adapter.SelectCommand = new SqlCommand("Select * from test", Conn);
        u_Adapter.Fill(ds, "test");   //---- 這時候執行SQL指令。取出資料，放進 DataSet。

        DataRow new_row = ds.Tables["test"].NewRow();
        //-- 手動新增一行 DataRow
        new_row["class"] = DropDownList1.SelectedValue;
        new_row["title"] = TextBox2.Text;
        new_row["summary"] = TextBox3.Text;
        new_row["article"] = TextBox4.Text;
        new_row["author"] = TextBox5.Text;

        ds.Tables["test"].Rows.Add(new_row);  //--將新增的一行 DataRow加入 DataSet裡面


        //==事先寫好 InsertCommand =============================(start)
        u_Adapter.InsertCommand = new SqlCommand("INSERT INTO [test] ([test_time], [class], [title], [summary], [article], [author]) VALUES (getdate(), @class, @title, @summary, @article, @author)", Conn);
        //-- InsertCommand 參數 --(start)
        u_Adapter.InsertCommand.Parameters.Add("@class", SqlDbType.NVarChar, 50);
        u_Adapter.InsertCommand.Parameters["@class"].Value = DropDownList1.SelectedValue;

        u_Adapter.InsertCommand.Parameters.Add("@title", SqlDbType.NVarChar, 100);
        u_Adapter.InsertCommand.Parameters["@title"].Value = TextBox2.Text;

        u_Adapter.InsertCommand.Parameters.Add("@summary", SqlDbType.NVarChar, 250);
        u_Adapter.InsertCommand.Parameters["@summary"].Value = TextBox3.Text;

        u_Adapter.InsertCommand.Parameters.Add("@article", SqlDbType.NVarChar, 16);
        u_Adapter.InsertCommand.Parameters["@article"].Value = TextBox4.Text;

        u_Adapter.InsertCommand.Parameters.Add("@author", SqlDbType.NVarChar, 100);
        u_Adapter.InsertCommand.Parameters["@author"].Value = TextBox5.Text;
        //-- InsertCommand 參數 --(end)
        //=================================================(end)

        u_Adapter.Update(ds, "test");
        //---- 這時候執行SQL指令。把 DataSet裡面的新資料，回寫到資料庫！
        //---- 因為DataSet的狀態已經被改變，多了新的一列DataRow，所以會自動執行 InsertCommand


        //== 重新資料繫結，讓 GridView展示資料庫裡面的最新情況==
        DBinit();
    }



    //====自己手寫的程式碼， DataAdapter / DataSet ====(start)
    protected void DBinit()
    {
        //----上面已經事先寫好 using System.Web.Configuration ----
        //----連結資料庫的另一種寫法----
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        SqlDataAdapter myAdapter = null;

        try
        {
            //----(1). 連結資料庫----
            //Conn.Open();  //---- 這一行註解掉，可以不用寫，DataAdapter會自動開啟

            //作者註解：SqlDataAdapter的 .Fill()方法使用 SQL指令的SELECT，從資料來源擷取資料。
            //   此時，DbConnection物件（如Conn）必須是有效的，但不需要是開啟的
            //  （因為DataAdapter會自動開啟或關閉連結）。
            //   如果在呼叫 .Fill ()方法之前關閉 IDbConnection，它會先開啟連接以擷取資料，
            //   然後再關閉連接。如果在呼叫 .Fill ()方法之前開啟連接，它會保持開啟狀態。
            //   因此，我們使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。
            
            //=====重 點=====(start)
            myAdapter = new SqlDataAdapter("select top 5 * from test order by id DESC", Conn);
            DataSet ds = new DataSet();

            //----(2). 執行SQL指令（Select陳述句）----
            myAdapter.Fill(ds, "test");   //把資料庫撈出來的資料，填入DataSet裡面。
            
            //----(3). 自由發揮。由 GridView來呈現資料。----
            GridView1.DataSource = ds;
            //----標準寫法 GridView1.DataSource = ds.Tables["test"].DefaultView; ----
            GridView1.DataBind();
            //=====重 點=====(end)
        }
        catch (Exception ex)
        {
            Response.Write("<HR/>" + ex.ToString() + "<HR/>");
        }
        //finally
        //{   
        //----(4). 釋放資源、關閉連結資料庫----
        //---- 不用寫，DataAdapter會自動關閉
        //    if (Conn.State == ConnectionState.Open)  {
        //          Conn.Close();
        //          Conn.Dispose();
        //    }  //使用SqlDataAdapter的時候，不需要寫程式去控制Conn.Open()與 Conn.Close()。
        //}
        //====自己手寫的程式碼， DataAdapter / DataSet ====(end)
    }
}