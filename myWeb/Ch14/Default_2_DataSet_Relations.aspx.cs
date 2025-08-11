using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//*********************************自己加寫（宣告）的NameSpace
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
//*********************************

public partial class Book_Sample_Ch14_Default_2_DataSet_Relations : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
        DataSet myDataSet = new DataSet();
        String myStr = "";

        SqlDataAdapter mySqlDataAdapter1, mySqlDataAdapter2;
        mySqlDataAdapter1 = new SqlDataAdapter("select id, title from test", Conn);
        mySqlDataAdapter2 = new SqlDataAdapter("select id, test_id, article from test_talk", Conn);

        try
        {
            //Conn.Open();   //-- DataAdapter會自動開啟DB連線。
            mySqlDataAdapter1.Fill(myDataSet, "test");
            mySqlDataAdapter2.Fill(myDataSet, "test_talk");

            //== 重點一 ===============================================
            //== 兩個 Tables 彼此作關聯，並將此關聯命名為 Relation_TT
            myDataSet.Relations.Add("Relation_TT",
                        myDataSet.Tables["test"].Columns["id"],
                        myDataSet.Tables["test_talk"].Columns["test_id"]);

            //== DataRelationCollection的 .Add() 方法
            // 參考資料：http://msdn.microsoft.com/zh-tw/library/system.data.datarelationcollection.add(v=VS.80).aspx

            //== DataRelationCollection物件 -- 會啟用相關父/子 DataTable物件之間的巡覽。
            // 參考資料：http://msdn.microsoft.com/zh-tw/library/system.data.datarelationcollection(v=VS.80).aspx
            // 您可以透過將 DataRelationCollection物件定義為 [DataTable]或 [DataSet]的屬性來建立該物件，
            // 而不是透過直接使用建構函式 (Constructor) 來建立(使用 DataSet 的 Relations 屬性，或 DataTable 的 ParentRelations 屬性)。 
            // 若要存取集合，使用 DataSet物件的 Relations屬性。
            // 一有了集合之後，您就可以藉由使用 .Add()、.Clear() 和 .Remove()之類的方法來管理它所包含的物件。


            //== 重點二 ===============================================
            //== 透過雙重迴圈（巢狀迴圈），類似「留言版」。把相關的紀錄一筆一筆列出來。
            foreach (DataRow myDRow1 in myDataSet.Tables["test"].Rows)
            {
                myStr = myStr + "<p>test資料表 -- " + myDRow1["id"].ToString() + "  /  <b>";
                myStr = myStr + myDRow1["title"].ToString() + "</b><br />";

                myStr = myStr + "# ==讀者留言== # <br /><small>";
                // ========= （第二個迴圈）==========
                foreach (DataRow myDRow2 in myDRow1.GetChildRows(myDataSet.Relations["Relation_TT"]))
                {
                    //== DataRow.GetChildRows()方法 (DataRelation)
                    // == 參考資料：http://msdn2.microsoft.com/zh-tw/library/hbt8xha8(VS.80).aspx                     
                    myStr = myStr + "test_talk資料表 -- " + myDRow2["id"].ToString() + "&nbsp;&nbsp;";
                    myStr = myStr + "<b><font color=red>" + myDRow2["test_id"].ToString() + "</font></b>&nbsp;&nbsp;";
                    myStr = myStr + myDRow2["article"].ToString() + "<br />";
                }
                //==============================

                myStr = myStr + "</small><hr />";
                Label1.Text = myStr;
            }                       
        }
        catch(Exception ex)
        {
            Response.Write("<br /> Exception Error Message :" + ex.ToString());
        }            
        finally
        {
            mySqlDataAdapter1.Dispose();
            mySqlDataAdapter2.Dispose();
            //Conn.Close();   //-- DataAdapter會自動關閉DB連線。
        }

    }
}