<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HyperLink_URL03.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_HyperLink_URL03" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title> </title>
    <style type="text/css">

        .style3
        {
            font-weight: bold;
            background-color: #FF9999;
        }
        .style4
        {
            font-weight: bold;
            background-color: #FFFF00;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                                重點屬性 -- HyperLink控制項 的 NavigateUrl=<span class="style3">&#39;</span><span 
            class="style4">&lt;%# </span>&quot;Default_Disp.aspx?id=&quot; + Eval(&quot;id&quot;)<span 
            class="style4">%&gt;</span><span class="style3">&#39;</span>
    <br /><br />
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <div align="center">
                <table border="1" width="90%">
                  <tr>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>id</b></font></td>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>Date & Time</b></font></td>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>Title</b></font></td>
                    <td bgcolor="#800000"><font color="#FFFFFF"><b>Summary</b></font></td>
                  </tr>
            </HeaderTemplate>

            <ItemTemplate>
                <tr>
                  <td><small> <%#Eval("id")%> </small></td>
                  <td><small> <%#Eval("test_time", "{0:d}")%> </small></td>
                  <td> 
                            <a href="Default_Disp.aspx?id=<%#Eval("id")%>">
                                 <b><big><%#Eval("title")%> </big></b>
                            </a>
                            <br />
                            HyperLink -- 
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# "Default_Disp.aspx?id=" + Eval("id")%>' 
                                            Target="_blank"><b><big><%#Eval("title")%> </big></b></asp:HyperLink>
                  </td>
                  <td align="left"> <small><%#Eval("summary")%> </small></td>
                </tr>
            </ItemTemplate>
            
            <AlternatingItemTemplate >
                <tr>
                  <td bgcolor="gray"><small> <%#Eval("id")%> </small></td>
                  <td bgcolor="gray"><small> <%#Eval("test_time", "{0:d}")%> </small></td>
                  <td bgcolor="gray"> 
                            <a href="Default_Disp.aspx?id=<%#Eval("id")%>">
                                 <b><big><%#Eval("title")%> </big></b>
                            </a>  
                            <br />
                            HyperLink -- 
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# "Default_Disp.aspx?id=" + Eval("id")%>' 
                                            Target="_blank"><b><big><%#Eval("title")%> </big></b></asp:HyperLink>   
                  </td>
                  <td bgcolor="gray" align="left"> <small><%#Eval("summary")%> </small></td>
                </tr>
            </AlternatingItemTemplate>

            <FooterTemplate>
                </table>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
            SelectCommand="SELECT * FROM [test]">            
        </asp:SqlDataSource>
        <br />

    </form>
  
</body>
</html>

