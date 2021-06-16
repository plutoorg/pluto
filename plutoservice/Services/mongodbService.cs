using System.Security.Authentication;
using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using plutoservice.BusinessLogic;

//Mongodb Service to create mongo connection in Azure cloud
namespace plutoservice.Services
{
    public class MongoDatabase
    {
        private AppSettings _configuration;

        private MongoClient _mongoClient;

        private IMongoDatabase _mongoDatabase;

        //IConfiguration configuration 


        public MongoDatabase(AppSettings configuration)
        {
            _configuration = configuration;

            MongoClientSettings settings = MongoClientSettings.FromUrl(
                new MongoUrl(_configuration.CosmosDb.ConnectionString));

            settings.SslSettings = new SslSettings()
            {
                EnabledSslProtocols = SslProtocols.Tls12
            };

            _mongoClient = new MongoClient(settings);

            _mongoDatabase = _mongoClient.GetDatabase(_configuration.CosmosDb.DatabaseName);

        }

        public IMongoCollection<T> GetCollection<T>(string collectionName)
        {
            return _mongoDatabase.GetCollection<T>(collectionName);
        }

    }
}