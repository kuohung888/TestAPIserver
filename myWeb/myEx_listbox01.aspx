<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_listbox01.aspx.cs" Inherits="myEx_listbox01" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>學生選課系統</title>
    <style>
        .container { display: flex; gap: 20px; margin-top: 30px; }
        .listbox { width: 250px; height: 300px; }
        .button-group { display: flex; flex-direction: column; justify-content: center; gap: 10px; }
        .btn { padding: 8px 15px; cursor: pointer; }
        h2 { color: #3a3a3a; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center;">
            <h2>課程加退選系統</h2>
            <div class="container">
                <!-- 課程清單 -->
                <div>
                    <div>可選課程</div>
                    <asp:ListBox ID="lbAvailableCourses" runat="server" CssClass="listbox" SelectionMode="Multiple"></asp:ListBox>
                </div>

                <!-- 操作按鈕 -->
                <div class="button-group">
                    <asp:Button ID="btnAdd" runat="server" Text="選課 →" CssClass="btn" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnRemove" runat="server" Text="← 退選" CssClass="btn" OnClick="btnRemove_Click" />
                </div>

                <!-- 已選課程 -->
                <div>
                    <div>已選課程</div>
                    <asp:ListBox ID="lbSelectedCourses" runat="server" CssClass="listbox" SelectionMode="Multiple"></asp:ListBox>
                </div>
            </div>
        </div>
    </form>
</body>
</html>