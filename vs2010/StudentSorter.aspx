<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentSorter.aspx.cs" Inherits="StudentSorter" %>

<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .array-example {
            text-align: center;
            margin: 40px auto;
            font-size: 1.2em;
        }
        .array-example h2 {
            color: #2c3e50;
        }
        .array-example button {
            padding: 6px 12px;
            font-size: 1em;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
    </style>
</asp:Content>
<asp:Content ID="ContentMain" ContentPlaceHolderID="PlaceHolder1" runat="server">
    <div class="container">
         <h2>學生成績排序</h2>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="姓名" />
                <asp:BoundField DataField="Chinese" HeaderText="國文" />
                <asp:BoundField DataField="English" HeaderText="英文" />
                <asp:BoundField DataField="Math" HeaderText="數學" />
                <asp:BoundField DataField="TotalScore" HeaderText="總分" />
                <asp:BoundField DataField="AverageScore" HeaderText="平均分" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btnTotalScore" runat="server" Text="依總分(高低)排序" OnClick="btnTotalScore_Click" />
        <asp:Button ID="btnAverageScore" runat="server" Text="依平均分數排序" OnClick="btnAverageScore_Click" />
 
     
    </div>
</asp:Content>