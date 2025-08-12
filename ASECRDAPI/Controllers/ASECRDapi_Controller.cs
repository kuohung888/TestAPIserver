using Microsoft.AspNetCore.Mvc;

namespace ASECRDAPI.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ASECRDapi_Controller :  ControllerBase
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

            return Ok(new
            {
                function = "hw_bin_list",
                parameters = new {
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
}
