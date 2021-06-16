using System.Collections.Generic;
using System.Threading.Tasks;
using MongoDB.Bson;
using MongoDB.Driver;
using plutoservice.Model;

// # #//
namespace plutoservice.Services
{
    public class BooksService : IBookService
    {
        private MongoDatabase _mongodb;
    
        // # Initialize DB Instance
        public BooksService(MongoDatabase mongoDatabase)
        {
            this._mongodb = mongoDatabase;
        }

        //# Get the Collection and details 
        public async Task<IEnumerable<Book>> GetAllBooksAsync()
        {
            var filter = new BsonDocument();

            return await _mongodb
            .GetCollection<Book>("Books")
            .Find(filter)
            .ToListAsync();
        }

        // Insert One Book 
        public async Task CreateBookAsync(Book _book)
        {
            await _mongodb
            .GetCollection<Book>("Books")
            .InsertOneAsync(_book);
        }
    }

}