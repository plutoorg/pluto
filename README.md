
# Git 
git reset
git add . 
git commit -m 'message' 
git push 

# pluto
Pluto
dotnet new webapi -n plutoservice  
dotnet sln pluto.sln add plutoservice/plutoservice.csproj
dotnet new sln

# Docker 
docker image rm 44ed84cf4d7a
docker image ls
docker rm --force 02a58b0893df
docker ps -a 
#

# Sample Data -----------------------------------
/* db.inventory.insertMany([
   { name: "Kubernets Demo App", author: "P K Rout", description: "Prasanta Kumar Rout" },
   { name: "Kubernets AZ 400", author: "Matt T", description: "Mathew Thankachan" },
   { name: "AZ-900 Certification", author: "Biswajit Panda", description: "Biswajit" }
) */


db.Library.Books.insertMany([
{name: "Kubernets demo" , author: "P K Rout" , description: "About Kubernets Architecture" , returned: "True"}
{name: "Azure Fundamentals" , author: "B Panda" , description: "About Azure Fundamental Course " , returned: "False"}
])
# ----------------------------------------------

# Enable HTTPS 

-- dotnet user-secrets set "Pluto:ServiceApiPwd" "password#1" --project "/Users/prasantrout/Desktop/PlutoWorkspace/pluto/plutoweb"
dotnet user-secrets init
dotnet user-secrets -p plutoweb.csproj set "Kestrel:Certificates:Development:Password" "password#1"

dotnet dev-certs https -ep ${HOME}/.aspnet/https/plutoweb.pfx -p crypticpassword
dotnet dev-certs https --trust
dotnet dev-certs https --clean 

dotnet user-secrets -p plutoweb.csproj set "Kestrel:Certificates:Development:Password" "crypticpassword"

Steps 
1- -p 8080:80 -p 8081:443 
2- -e ASPNETCORE_URLS="https://+;http://+"
3- -e ASPNETCORE_HTTPS_PORT = 8081
4- -e ASPNETCORE_ENVIRONMENT = Development 
5- -v $HOME\microsoft\usersecrets\:/root/.microsoft/usersecrets
6- -v pluto\plutoweb\plutoweb.pfx:/root/.aspnet/https/
7- plotoweb 


docker run --rm -it -p 8000:80 -p 8001:443 -e ASPNETCORE_URLS="https://+;http://+" -e ASPNETCORE_HTTPS_PORT=8001 -e ASPNETCORE_ENVIRONMENT=Development -v ${HOME}/.microsoft/usersecrets/:/root/.microsoft/usersecrets -v ${HOME}/.aspnet/https:/root/.aspnet/https/ aspnetapp

# Removed Unwanted Images 
docker run -ti --rm prasant/alpinedemo:1.0 /bin/sh
docker rmi $(docker images -q --filter "dangling=true")

# Docker Image Tagging before pushing into docker Hub
Docker tag plutoweb prasantrout/plutoweb:v1.0



