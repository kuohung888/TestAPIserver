<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Repeater_Multi_Delete.aspx.cs" Inherits="Book_Sample_Ch12_ListView_Repeater_Multi_Delete" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            color: #FF0000;
            font-weight: bold;
        }
        .style2
        {
            font-weight: bold;
            color: #FFFFFF;
            background-color: #CC0000;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <span class="style2">Repeater控制項加入 CheckBox。</span><br />
        <br />
        這個功能有兩大步驟：<br />
        &nbsp;&nbsp;&nbsp;
        第一，動態<span class="style1">產生 </span>CheckBox控制項。<br />
        &nbsp;&nbsp;&nbsp;
        第二，<span class="style1">抓取</span>「動態產生」的控制項，會用到 .FindControl()方法。<br />
        <br />
        基本上，您有能力作這個範例，就可以做到「自動化投票區、問卷調查」這個範例了。<br />
        請看我的網站：<br />
        <br />
        (1).&nbsp;
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2011/05/05/24244.aspx">
        http://www.dotblogs.com.tw/mis2000lab/archive/2011/05/05/24244.aspx</a> （觀念說明）<br />
        (2).&nbsp;
        <a href="http://www.dotblogs.com.tw/mis2000lab/archive/2011/05/05/24269.aspx">
        http://www.dotblogs.com.tw/mis2000lab/archive/2011/05/05/24269.aspx</a> （範例） 
        <br />
        <br />
        <br />
        <br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" 
            onitemcommand="Repeater1_ItemCommand">

            <HeaderTemplate>
                <div align="center">
                <table border="1" width="90%">
                  <tr>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>批次刪除</b></font></td>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>id</b></font></td>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>Title(標題)</b></font></td>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>Author(作者)</b></font></td>
                  </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                  <td><small><asp:CheckBox ID="CheckBox1" runat="server" Text='<%#Eval("id")%>' /></small></td>
                  <td><small> <%#Eval("id")%> </small></td>
                  <td> <b><%#Eval("title")%> </b></td>
                  <td align="left"> <small><%#Eval("author")%> </small></td>
                </tr>
            </ItemTemplate>
            
            <FooterTemplate>
                </table>
                </div>
                <!-- 重點！！重點！！要自己動手稍微改一下！！ -->
                <asp:Button ID="Button1" runat="server" Text="Button--批次刪除（CommandName=myDelete）" 
                                   CommandName="myDelete" />
            </FooterTemplate>
        </asp:Repeater>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT [id], [title], [author] FROM [test]">
        </asp:SqlDataSource>
        <br />
    

        
    </div>
    </form>
</body>
</html>
