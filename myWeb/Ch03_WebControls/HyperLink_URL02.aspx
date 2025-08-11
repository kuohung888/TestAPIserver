<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HyperLink_URL02.aspx.cs" Inherits="Book_Sample_Ch03_WebControls_HyperLink_URL02" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            font-weight: bold;
            background-color: #FF9966;
        }
        .style2
        {
            font-weight: bold;
            background-color: #FFCC66;
        }
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
          自己動手，在<b>GridView「編輯資料行」</b>裡面，增添兩個 Field -- <span class="style1">HyperLinkField</span>與<span 
              class="style2">TemplateField </span>
         <br />
          <br />
                                重點屬性 -- 
          HyperLink控制項 的 NavigateUrl=<span class="style3">&#39;</span><span 
              class="style4">&lt;%# </span>&quot;Default_Disp.aspx?id=&quot; + Eval(&quot;id&quot;)<span 
              class="style4">%&gt;</span><span class="style3">&#39;</span><br />
          <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="id" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                    ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />

                <asp:HyperLinkField DataNavigateUrlFields="id" 
                    DataNavigateUrlFormatString="Default_Disp.aspx?id={0}" DataTextField="title" 
                    HeaderText="GridView的HyperLinkField" />

                <asp:TemplateField HeaderText="GridView的TemplateField">
                    <ItemTemplate>

                        [樣板]自己加入 HyperLink控制項<br />    
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# "Default_Disp.aspx?id=" + Eval("id")%>'  Target="_blank">
                                            <%#Eval("title")%> 
                                </asp:HyperLink>

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
            SelectCommand="SELECT top 10 [id], [title] FROM [test]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
