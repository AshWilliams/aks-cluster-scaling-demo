using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace ScalingDemo.API.Controllers
{
    [Route("status")]
    [ApiController]
    public class StatusController : ControllerBase
    {
        public StatusController()
        {
        }

        [HttpGet("health")]
        public async Task<IActionResult> CheckHealthAsync()
        {
            return await Task.FromResult(Ok());
        }

        [HttpGet("ready")]
        public async Task<IActionResult> CheckReadinessAsync()
        {
            return await Task.FromResult(Ok());
        }
    }
}