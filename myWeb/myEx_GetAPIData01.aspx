<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myEx_GetAPIData01.aspx.cs" Inherits="TourApp.myEx_GetAPIData01" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>高雄旅遊查詢</title>
<style>
    body {
    background: #f2f5f7;
    font-family: "Segoe UI", sans-serif;
    margin: 0;
    padding: 20px;
}

.container {
    max-width: 960px;
    margin: 0 auto;
    background: #fff;
    padding: 30px;
    border-radius: 6px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

h1 {
    margin-bottom: 20px;
    color: #333;
}

.toolbar {
    margin-bottom: 15px;
}

.input {
    padding: 8px 12px;
    width: 200px;
    margin-right: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.btn {
    padding: 8px 16px;
    background: #0078d7;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.btn:hover {
    background: #005a9e;
}

.table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 15px;
}

.table th, .table td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
}

.table tr:nth-child(even) {
    background: #f9f9f9;
}

.pager {
    text-align: center;
}

.pager a, .pager span {
    margin: 0 5px;
    color: #0078d7;
}
</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>高雄市旅遊景點查詢</h1>
            
            <!-- 操作按鈕與查詢欄位 -->
            <div class="toolbar">
                <asp:Button ID="btnUpdate" runat="server" Text="即時擷取公開網站資料" OnClick="btnUpdate_Click" CssClass="btn" />
                
            </div>

                   

            
            <!-- 下面這個 GridView 取消 Server 分頁 -->
            <asp:GridView ID="gvSpots" runat="server"
                          AutoGenerateColumns="false"
                          AllowPaging="false"
                          CssClass="display"  OnPreRender="gvSpots_PreRender">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" />
                    <asp:BoundField DataField="Name"  headerText="名稱"/>
                    <asp:BoundField DataField="Location" HeaderText="地點" />
                    <asp:BoundField DataField="Tel" HeaderText="電話" />
                    <asp:BoundField DataField="Add" HeaderText="地址" />
                    <asp:BoundField DataField="Org" HeaderText="承辦單位" />
                    <asp:BoundField DataField="Particpation" HeaderText="身分" />
                    <asp:BoundField DataField="Start" HeaderText="開放時間" />
                    <asp:BoundField DataField="End" HeaderText="結束時間" />
                    <asp:BoundField DataField="Changetime" HeaderText="異動時間" />
                </Columns>
            </asp:GridView>
          
        </div>
    </form>

     <!-- jQuery + DataTables JS -->
    <script src="Scripts/jquery-1.7.min.js"></script>
   <script src="Scripts/dataTables.min.js"></script>
   <script src="Scripts/dataTables.js"></script>

<script>
    $(document).ready(function () {
        $('#<%= gvSpots.ClientID %>').DataTable({
          paging: true,
          pageLength: 50,
          searching: true,
          ordering: true,
          info: true,
          dom: '<"top"f>rt<"bottom"lip><"clear">',
          language: {
              searchPlaceholder: '輸入關鍵字即時搜尋…',
              search: '',
              lengthMenu: '每頁顯示 _MENU_ 筆',
              info: '共 _TOTAL_ 筆 (第 _START_ 至 _END_ 筆)',
              infoEmpty: '無資料',
              paginate: { previous: '&lsaquo;', next: '&rsaquo;' }
          }
      });
  });
</script>
</body>
</html>