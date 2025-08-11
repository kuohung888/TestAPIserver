<%@ Control Language="C#" ClassName="Default_book_4_UserControl_2_MSDN" AutoEventWireup="true" CodeFile="Default_book_4_UserControl_2_MSDN.ascx.cs" 
    Inherits="Default_book_4_UserControl_2_MSDN" %>


<!-- 資料來源：http://msdn.microsoft.com/zh-tw/library/c0az2h86(v=vs.80).aspx
         HOW TO：以程式設計方式建立 ASP.NET 使用者控制項的執行個體  -->


<br />
        <asp:GridView ID="GridView2" runat="server"
            AutoGenerateColumns="False" BackColor="White" 
            BorderColor="#CC9966" BorderStyle="None"
            BorderWidth="1px" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource2"
            Font-Size="X-Small" PageSize="1">
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <Columns>
                <asp:BoundField DataField="id" HeaderText="id"
                    SortExpression="id" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="article" HeaderText="article（文章內容，全文）" 
                    SortExpression="article" >
                    <FooterStyle ForeColor="Maroon" />
                </asp:BoundField>
                <asp:BoundField DataField="author" HeaderText="author（作者）" 
                    SortExpression="author">
                    <ItemStyle Font-Bold="True" ForeColor="#006600" />
                </asp:BoundField>
            </Columns>
            <PagerStyle ForeColor="#330099" HorizontalAlign="Center" BackColor="#FFFFCC" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <EmptyDataTemplate>
                <span style="color: #ff0000">
                Sorry.....This Record is Nothing~ 。抱歉！找不到資料！</span>
            </EmptyDataTemplate>
        </asp:GridView>
        
        
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:testConnectionString %>"
                SelectCommand="SELECT Top 5 id,article,author FROM [test]">                  
        </asp:SqlDataSource>
        
