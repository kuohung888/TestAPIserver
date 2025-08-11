<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Default_book_4_UserControl_2.ascx.cs" Inherits="Ch11_Default_book_4_UserControl_2" %>

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
                SelectCommand="SELECT id,article,author FROM [test] WHERE ([id] = @id)">            
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>            
        </asp:SqlDataSource>
        
<span style="background-color: #663300"><span style="color: #ffff66">
<span style="font-size: 10pt;">
<br />
透過 GridView1傳來的「id」，來決定上面GridView2的資料。</span></span></span>