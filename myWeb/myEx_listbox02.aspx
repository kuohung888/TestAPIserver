<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_listbox02.aspx.cs" Inherits="myEx_listbox02" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>學生選課系統</title>
    <style>
        .container { display: flex; gap: 20px; margin-top: 20px; }
        .listbox { width: 280px; height: 250px; }
        .info-panel { background-color: #f8f9fa; padding: 15px; margin-top: 20px; border: 1px solid #dee2e6; }
        .credit-label { color: #dc3545; font-weight: bold; }
        .disabled-control { opacity: 0.6; pointer-events: none; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="max-width: 900px; margin: 0 auto;">
            <h2 style="text-align: center;">學生課程加退選系統</h2>
            
            <!-- 學生姓名輸入 -->
            <div style="margin-bottom: 15px;">
                <asp:Label runat="server" Text="學生姓名：" AssociatedControlID="txtStudentName" />
                <asp:TextBox ID="txtStudentName" runat="server" Width="200px" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtStudentName" 
                    ErrorMessage="請輸入姓名" ForeColor="Red" Display="Dynamic" />
            </div>

            <div class="container">
                <!-- 可選課程 (左側) -->
                <div>
                    <div>可選課程 <span class="credit-label">(總學分: <asp:Label ID="lblAvailableCredits" runat="server" Text="0"></asp:Label>)</span></div>
                    <asp:ListBox ID="lbAvailableCourses" runat="server" CssClass="listbox" 
                        SelectionMode="Multiple" DataTextField="Name" DataValueField="Credit" />
                </div>

                <!-- 操作按鈕 -->
                <div style="display: flex; flex-direction: column; justify-content: center; gap: 10px;">
                    <asp:Button ID="btnAdd" runat="server" Text="選課 →" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                    <asp:Button ID="btnRemove" runat="server" Text="← 退選" CssClass="btn btn-danger" OnClick="btnRemove_Click" />
                    <asp:Button ID="btnConfirm" runat="server" Text="確認選課" CssClass="btn btn-success" OnClick="btnConfirm_Click" />
                </div>

                <!-- 已選課程 (右側) -->
                <div>
                    <div>已選課程 <span class="credit-label">(總學分: <asp:Label ID="lblSelectedCredits" runat="server" Text="0"></asp:Label>/12)</span></div>
                    <asp:ListBox ID="lbSelectedCourses" runat="server" CssClass="listbox" 
                        SelectionMode="Multiple" DataTextField="Name" DataValueField="Credit" />
                </div>
            </div>
            <div style="color:brown">*每門課程綁定的學分數字預設都是3學分，只有雲端計算、機器學習與網路程式設計是4學分。</div>
            <!-- 確認後顯示區 -->
            <asp:Panel ID="pnlResult" runat="server" CssClass="info-panel" Visible="false">
                <h4>選課確認結果</h4>
                <p>學生姓名：<asp:Label ID="lblStudentName" runat="server" Font-Bold="true"></asp:Label></p>
                <p>已選課程：</p>
                <asp:BulletedList ID="bltSelectedCourses" runat="server"></asp:BulletedList>
                <p>總學分數：<asp:Label ID="lblTotalCredits" runat="server" Font-Bold="true"></asp:Label></p>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
