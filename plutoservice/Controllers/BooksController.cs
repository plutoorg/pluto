using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using plutoservice.Model;
using plutoservice.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace plutoservice.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly IBookService _bookService;

        public BooksController(IBookService bookService)
        {
            _bookService = bookService;
        }

        // GET: api/<LibraryController>
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var books = await _bookService.GetAllBooksAsync();

            if (!books.Any())
            {
                return await Task.FromResult(StatusCode((int)HttpStatusCode.OK, "Empty"));
            }

            return await Task.FromResult(StatusCode((int)HttpStatusCode.OK, books.ToList()));
        }

        // POST api/<LibraryController>
        [Route("insert")]
        [HttpPost]
        public async Task<IActionResult> InsertBook([FromBody] Book book)
        {
            if (ModelState.IsValid)
            {
                //book.Id = Guid.NewGuid().ToString();
                await _bookService.CreateBookAsync(book);
                return RedirectToAction("GetAll");
            }

            return await Task.FromResult(StatusCode((int)HttpStatusCode.BadRequest, book));
        }

    }
}



















/*

 // GET api/<LibraryController>/5
        [HttpGet("{id}")]
        public async Task<IActionResult> Get([FromRoute] string id)
        {
            return await Task.FromResult(StatusCode((int)HttpStatusCode.OK, _cosmoService.GetAsync(id)));
        }

 // POST api/<LibraryController>
        [Route("edit")]
        [HttpPost]
        public async Task<IActionResult> EditBook([FromBody] Book book)
        {
            if (ModelState.IsValid)
            {
                var req = await _cosmoService.UpdateAsync(book);

                if(req == null)
                {
                    return await Task.FromResult(StatusCode((int)HttpStatusCode.OK, "Book not found"));
                }

                return RedirectToAction("GetAll");
            }

            return await Task.FromResult(StatusCode((int)HttpStatusCode.BadRequest, book));
        }


        // POST api/<LibraryController>
        [HttpPost]
        public async Task<IActionResult> DeleteBook([FromBody] Book book)
        {
            if (String.IsNullOrEmpty(book.Id))
            {
                return await Task.FromResult(StatusCode((int)HttpStatusCode.BadRequest, "Insert book id!"));
            }

            await _cosmoService.DeleteAsync(book.Id);

            return await Task.FromResult(StatusCode((int)HttpStatusCode.OK));
        }


*/