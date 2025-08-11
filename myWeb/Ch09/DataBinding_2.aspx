<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataBinding_2.aspx.cs" Inherits="Ch09_DataBinding_2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>資料繫結運算式（DataBinding Expression）</strong><br />
        <br />
        <br />
    <asp:FormView ID="FormView1" runat="server" CellPadding="4" DataKeyNames="id" ForeColor="#333333">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#E3EAEB" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />

            <ItemTemplate>
                id:   <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>'></asp:Label><br />

                title:  <asp:Label ID="titleLabel" runat="server" 
                                       Text='<%# DataBinder.Eval(Container.DataItem,"title") %>' Font-Bold="True" ForeColor="#FF0000"></asp:Label><br />
                           
                 summary:  <asp:Label ID="summaryLabel" runat="server" 
                                                Text='<%# Eval("summary") %>' Font-Italic="True" ForeColor="Gray" Font-Size="10pt"></asp:Label><br />
                            
                article:   <br />
                            <asp:TextBox ID="TextBox1" runat="server" 
                                                Text='<%# Eval("article") %>' Font-Size="Small" Height="300px" TextMode="MultiLine" Width="600px"></asp:TextBox><br /><br />                
            </ItemTemplate>
</asp:FormView>
    </div>
    </form>
 
</body>
</html>
