using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace plutoservice.BusinessLogic
{
    public class AppSettings
    {
        public CosmosDb CosmosDb { get; set; }
    }

    public class CosmosDb
    {
        public string Account { get; set; }

        public string Key { get; set; }

        public string DatabaseName { get; set; }

        public string ContainerName { get; set; }

        public string ConnectionString {get; set;}
    }
}