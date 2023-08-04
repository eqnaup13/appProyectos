using Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Models.Entidades;

namespace API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EstadoController : ControllerBase
    {
        private readonly ApplicationDbContext _context;

        public EstadoController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<List<Proyecto>>> Get()
        {
            var lista = await _context.Estado.ToListAsync();
            return Ok(lista);
        }
    }
}
