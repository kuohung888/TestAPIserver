<%@ Page Language="C#"  AutoEventWireup="true" CodeFile="ChartMultiDim.aspx.cs" Inherits="ChartMultiDim" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8" />
  <title>多維度座標圖表分析</title>
  <link href="Styles/style.css" rel="stylesheet" />

  <!-- 載入 jQuery 與 Chart.js -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
  <form id="form1" runat="server">
    <!-- 啟用 PageMethods -->
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

    <h1>多維度座標圖表分析</h1>

    <!-- 篩選區 -->
    <div class="chart-filters">
      <asp:Label runat="server" AssociatedControlID="ddlStation2" Text="測站名稱:" />
      <asp:DropDownList runat="server" ID="ddlStation2"></asp:DropDownList>

      <asp:Label runat="server" AssociatedControlID="ddlItem2" Text="檢測項目:" />
      <asp:DropDownList runat="server" ID="ddlItem2"></asp:DropDownList>

      <button type="button" id="btnDraw3">繪製多維度圖表</button>
    </div>

    <!-- Bubble 圖繪製區 -->
    <canvas id="multiChart" width="900" height="600"></canvas>
  </form>

  <script type="text/javascript">
      $(function () {
          // 頁面載入先取得篩選清單
          PageMethods.GetDistinctStations(onStationsLoaded);
          PageMethods.GetDistinctItems(onItemsLoaded);

          $('#btnDraw3').click(drawMultiChart);
      });

      var stations = [], items = [];

      function onStationsLoaded(result) {
          var ddl = $('#<%= ddlStation2.ClientID %>');
          ddl.append($('<option>', { value: '', text: '全部' }));
          $.each(result, function (i, s) {
              ddl.append($('<option>', { value: s, text: s }));
          });
          stations = result;
      }

      function onItemsLoaded(result) {
          var ddl = $('#<%= ddlItem2.ClientID %>');
      ddl.append($('<option>', { value: '', text: '全部' }));
      $.each(result, function (i, it) {
        ddl.append($('<option>', { value: it, text: it }));
      });
      items = result;
    }

    function drawMultiChart() {
      var station = $('#<%= ddlStation2.ClientID %>').val();
      var item    = $('#<%= ddlItem2.ClientID %>').val();

          PageMethods.GetMultiDimData(station, item, function (data) {
              // 準備 X/Y 軸標籤
              var xs = [...new Set(data.map(d => d.StationName))];
              var ys = [...new Set(data.map(d => d.ItemName))];

              // 轉成 Bubble 格式
              var pts = data.map(d => ({
                  x: xs.indexOf(d.StationName),
                  y: ys.indexOf(d.ItemName),
                  r: Math.sqrt(d.Avg) * 3
              }));

              var ctx = document.getElementById('multiChart').getContext('2d');
              if (window.multiChart) window.multiChart.destroy();

              window.multiChart = new Chart(ctx, {
                  type: 'bubble',
                  data: { datasets: [{ label: '平均濃度(Bubble)', data: pts, backgroundColor: 'rgba(75,192,192,0.5)' }] },
                  options: {
                      scales: {
                          x: {
                              title: { display: true, text: '測站名稱' },
                              ticks: {
                                  callback: function (val) { return xs[val]; }
                              }
                          },
                          y: {
                              title: { display: true, text: '檢測項目' },
                              ticks: {
                                  callback: function (val) { return ys[val]; }
                              }
                          }
                      },
                      plugins: {
                          tooltip: {
                              callbacks: {
                                  label: function (ctx) {
                                      var d = data[ctx.dataIndex];
                                      return `${d.StationName} / ${d.ItemName}: ${d.Avg}`;
                                  }
                              }
                          }
                      }
                  }
              });
          },
              function (err) {
                  alert('讀取多維度資料失敗');
              });
      }
  </script>
</body>
</html>