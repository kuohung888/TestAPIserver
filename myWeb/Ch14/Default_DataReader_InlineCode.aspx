<%@ Page Language="C#"  %>
<%@ Import NameSpace = "System.Data" %>
<%@ Import NameSpace = "System.Data.SqlClient" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Inline Code</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
<%
//註解：因為是 Inline Code，把程式跟畫面會在同一個檔案裡面，所以命名空間（NameSpace）要在一開始就宣告完畢。

   
//--註解：第一，連結SQL資料庫
SqlConnection Conn = new SqlConnection("server=localhost; uid=test; pwd=test; database=test");
Conn.Open();

//--註解：第二，執行SQL指令，使用DataReader
string sqlstr = "select id,test_time,title,summary from test ";
SqlCommand cmd  = new SqlCommand(sqlstr ,Conn);
SqlDataReader dr = cmd.ExecuteReader();

//--註解：第三，自由發揮
      Response.Write("<table width=’90%’ border=1>");

while(dr.Read())
{
    Response.Write("<tr>");  
      Response.Write("<td>" + dr["id"] + "</td>");
      Response.Write("<td>" + dr["test_time"] + "</td>");
      Response.Write("<td>" + dr["title"] + "</td>");
      Response.Write("<td>" + dr["summary"] + "</td>");
    Response.Write("</tr>");
}

      Response.Write("</table>");

//--註解：第四，關閉資料庫的連接 與 釋放資源
cmd.Cancel();
dr.Close();

Conn.Close();
%>
    
    </div>
    </form>
 
</body>
</html>
