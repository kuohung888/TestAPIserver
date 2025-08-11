using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

//----自己寫的（宣告）----
using System.Web.Configuration;
using System.Data.SqlClient;
//----自己寫的（宣告）----


public partial class Ch14_Default_3_DataSet_ALL_Manual : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
                if (!Page.IsPostBack)  {
                    DBInit();
                }            
    }


    //====自己手寫的程式碼， DataAdapter / DataSet ====(start)
    protected void DBInit()
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
            myAdapter = new SqlDataAdapter("select id,test_time,title,author from test", Conn);
            DataSet ds = new DataSet();
            //----(2). 執行SQL指令（Select陳述句）----
            myAdapter.Fill(ds, "test");   //把資料庫撈出來的資料，填入DataSet裡面。


            //----(3). 自由發揮。自行撰寫程式，把每一筆紀錄呈現在畫面上 ----

            //---- DataSet是由許多 DataTable組成的，我們目前只放進一個名為 test的 DataTable而已。
            DataTable myTable = ds.Tables["test"];
            //作者註解： DataSet包含一或多個由資料列（Row）和資料行（Column，欄位）所組成的 
            // 「DataTable物件」集合，此集合中也可包含 DataTable物件中的主索引鍵、外部索引鍵、
            //  條件約束及資料的關聯資訊。
           
            string myString;
            myString = "<table border=1><tr><td>id</td><td>test_time</td><td>title</td><td>author</td></tr>";

            for (int i = 0; i < myTable.Rows.Count; i++)
            {  //---- 把DataTable裡面的紀錄，一列一列(Row)地呈現 ----
                myString = myString + "<tr>";
                myString = myString + "<td>" + myTable.Rows[i]["id"] + "</td>";
                myString = myString + "<td>" + myTable.Rows[i]["test_time"] + "</td>";
                myString = myString + "<td>" + myTable.Rows[i]["title"] + "</td>";
                myString = myString + "<td>" + myTable.Rows[i]["author"] + "</td>";
                myString = myString + "</tr>";
            }
            myString = myString + "</table>";
            Label1.Text = myString;
            //== 以上的 for迴圈，若改用 StringBuilder的話，效率會更快！！
            //=====重 點=====(end)
        }
        catch(Exception ex) 
        {
            Response.Write("<hr />" + ex.ToString() + "<hr />");
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
