using plutoservice.Model;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace plutoservice.Services
{
    public interface IBookService
    {
        Task CreateBookAsync(Book book);
        Task<IEnumerable<Book>> GetAllBooksAsync();

        // Task DeleteAsync(string id);

        // Task<Book> GetAsync(string id);
        // Task<Book> UpdateAsync(Book book);
    }
}