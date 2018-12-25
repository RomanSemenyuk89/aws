using Microsoft.AspNetCore.Mvc;


namespace DockerWeb.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AboutController : ControllerBase
    {
        //public AboutController()
        //{
        //}

        [HttpGet]
        public ActionResult<string> Get()
        {
            return "version 1.0";
        }
    }
}
