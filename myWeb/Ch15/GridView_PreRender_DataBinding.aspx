<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GridView_PreRender_DataBinding.aspx.cs" Inherits="Book_Sample_Ch15_GridView_PreRender_DataBinding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <p>
        <br />
    </p>
    <form id="form1" runat="server">
        <p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="id" OnDataBound="GridView1_DataBound" OnPageIndexChanging="GridView1_PageIndexChanging" OnPreRender="GridView1_PreRender">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="title" HeaderText="title" SortExpression="title" />
                    <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
                </Columns>
            </asp:GridView>
        </p>
        <p>
            &nbsp;</p>
    <div>
    
    </div>
    </form>
</body>
</html>
