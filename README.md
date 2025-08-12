建立 Web API 專案
開啟 Visual Studio 2022

點選「建立新專案」

搜尋並選擇 ASP.NET Core Web API

專案名稱：例如輸入 AseMockApi

點選「下一步」，選擇 .NET 版本（建議使用 .NET 6 或以上）

將「啟用 OpenAPI 支援」勾選上（方便測試）

建立專案！

2. 設計 API Endpoint（模擬資料回傳）
你會在 Controllers 資料夾看到預設的 WeatherForecastController.cs。我們可以新增一個控制器 AseMockController.cs：
這是一個簡化版的 endpoint，可根據參數回傳可重現的假資料。

4. 執行與測試
按下 F5 或點選「啟動」

Visual Studio 會啟動內建 Kestrel Server，並打開 Swagger 網頁

在 Swagger UI 中你會看到 /api/AseMock/hw-bin-list 端點，輸入參數並測試！

測試代碼如下：
using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/[controller]")]
public class AseMockController : ControllerBase
{
    [HttpGet("hw-bin-list")]
    public IActionResult GetHwBinList(
        [FromQuery] string select_BD,
        [FromQuery] string select_Tester,
        [FromQuery] string select_Lot,
        [FromQuery] string select_Wafer,
        [FromQuery] string select_Test_item)
    {
        var seed = (select_BD + select_Tester + select_Lot + select_Wafer + select_Test_item).GetHashCode();
        var totalUnits = 5000 + Math.Abs(seed % 3000);
        var passUnits = totalUnits * 6 / 10;
        var bins = new[] {
            new { code = "B00", name = "PASS", count = passUnits },
            new { code = "B01", name = "BIN-1", count = totalUnits - passUnits }
        };

        return Ok(new {
            function = "hw_bin_list",
            params = new {
                select_BD,
                select_Tester,
                select_Lot,
                select_Wafer,
                select_Test_item
            },
            totalUnits,
            passUnits,
            failUnits = totalUnits - passUnits,
            yield = (passUnits * 100.0 / totalUnits).ToString("F2"),
            bins
        });
    }
}
