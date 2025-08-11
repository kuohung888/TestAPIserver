<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_9x9_HomePage.aspx.cs" Inherits="Book_Sample_Ch11_GridView_9x9_HomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GridView--九宮格</title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-style: solid;
            border-width: 1px;
        }
    </style>
</head>
<body>
    <p>
        首先，在GridView的樣板（ItemTemplate）裡面，繪製一個 3 X 3的表格 &lt;table&gt;</p>
    <p>
        表格&lt;table&gt;裡面放置幾個 Label，並且將ID設定成流水號！<br />
    </p>
    <form id="form1" runat="server">
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="id" DataSourceID="SqlDataSource1" PageSize="3" 
                OnRowDataBound="GridView1_RowDataBound"  OnRowCreated="GridView1_RowCreated" AllowPaging="True">
                <Columns>
                    <asp:TemplateField HeaderText="標題：九宮格">
                        <ItemTemplate>

                           <table class="auto-style1">
                                <tr>
                                    <td bgcolor="#CCCCCC" width="120">
                                         <asp:Label ID="LabelA1" runat="server"></asp:Label><br />
                                         <asp:Label ID="LabelB1" runat="server"></asp:Label><br />
                                         <asp:Label ID="LabelC1" runat="server"></asp:Label><br />
                                    </td>
                                    <td  width="120">&nbsp;
                                         <asp:Label ID="LabelA2" runat="server"></asp:Label><br />
                                         <asp:Label ID="LabelB2" runat="server"></asp:Label><br />
                                         <asp:Label ID="LabelC2" runat="server"></asp:Label><br />
                                    </td>
                                    <td bgcolor="#99FFCC"  width="120">&nbsp;
                                         <asp:Label ID="LabelA3" runat="server"></asp:Label><br />
                                         <asp:Label ID="LabelB3" runat="server"></asp:Label><br />
                                         <asp:Label ID="LabelC3" runat="server"></asp:Label><br />
                                    </td>
                                </tr>
                            </table>       
                            <br />

                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:testConnectionString %>" 
                SelectCommand="SELECT [id] FROM [test]">
            </asp:SqlDataSource>
        </p>
        <p>
            &nbsp;</p>


    <p>
        &nbsp;</p>


    </form>

    </body>
</html>
