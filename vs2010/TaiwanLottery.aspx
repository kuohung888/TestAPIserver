<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TaiwanLottery.aspx.cs" Inherits="TaiwanLottery._539" %>


<asp:Content ID="ContentHead" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet" />
    <style>
        body {
            font-family: "微軟正黑體", Arial, sans-serif;
            background: #f5f7fa;
            margin: 30px;
            color: #333;
        }
        h1 {
            text-align: center;
            color: #2c3e50;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 12px 20px;
            margin: 10px 5px 20px 5px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        button:hover {
            background-color: #2980b9;
        }
        .numbers-group {
            margin-bottom: 20px;
        }
        .numbers {
            display: inline-block;
            margin-right: 10px;
            font-weight: bold;
            font-size: 18px;
            color: #2c3e50;
        }
        .number {
            display: inline-block;
            width: 30px;
            height: 30px;
            line-height: 30px;
            margin: 0 3px;
            background-color: #ecf0f1;
            border-radius: 50%;
            text-align: center;
            color: #34495e;
            font-weight: 700;
        }
        .number.hit {
            background-color: #27ae60;
            color: white;
        }
        .result {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
            padding: 15px;
            border-radius: 6px;
            background-color: #f39c12;
            color: white;
            text-align: center;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</asp:Content>
<asp:Content ID="ContentMain" ContentPlaceHolderID="PlaceHolder1" runat="server">
        <div class="container">
            <h1>今彩539 隨機選號與兌獎</h1>

            <asp:Button ID="btnGenerate" runat="server" Text="隨機選號" OnClick="btnGenerate_Click" />
            <asp:Button ID="btnDraw" runat="server" Text="兌獎" OnClick="btnDraw_Click" />

            <div id="randomNumbers" class="numbers-group">
                <asp:Literal ID="ltRandomNumbers" runat="server"></asp:Literal>
            </div>

            <div id="drawNumber" class="numbers-group">
                <asp:Literal ID="ltDrawNumber" runat="server"></asp:Literal>
            </div>

           <asp:Panel ID="result" runat="server" CssClass="result" Visible="false">
            <asp:Literal ID="ltResult" runat="server"></asp:Literal>
          </asp:Panel>


            <asp:HiddenField ID="hfRandomNumbers" runat="server" />
        </div>
</asp:Content>
