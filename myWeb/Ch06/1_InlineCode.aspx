<%@ Page Language="C#" %>

<%@ Import NameSpace = "System" %>
<%@ Import NameSpace = "System.Data" %>
<%@ Import NameSpace = "System.Data.SqlClient" %>

<%@ Import NameSpace = "System.Web.Configuration" %>
<!-- 作者註解：
寫 Inline Code的時候， NameSpace的英文大小寫，千萬不能寫錯。 -->


<%
    //註解：第一、連結SQL資料庫
    //SqlConnection Conn = new SqlConnection("Data Source=.;Initial Catalog=test;Persist Security Info=True;User ID=test;Password=test");
    
    // 下列寫法，必須搭配 System.Web.Configuration命名空間。
    // 連結字串存在 Web.Config檔案裡。    
    SqlConnection Conn = new SqlConnection(WebConfigurationManager.ConnectionStrings["testConnectionString"].ConnectionString);
    Conn.Open();

    //註解：第二、執行SQL指令，使用DataReader
    SqlCommand cmd = new SqlCommand("select Top 10 id,test_time,title from test", Conn);
    SqlDataReader dr = cmd.ExecuteReader();

    //註解：第三、自由發揮
    while (dr.Read())
    {
        Response.Write("文章編號：" + dr["id"].ToString() + "<br>");
        Response.Write("日    期：" + dr["test_time"].ToString() + "<br>");
        Response.Write("文章標題：" + dr["title"].ToString());
        Response.Write("<hr>");
    }

    //註解：第四、關閉資源
    cmd.Cancel();
    dr.Close();
    
    Conn.Close();
%>

