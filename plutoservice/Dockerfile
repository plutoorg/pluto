FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base
WORKDIR /app
EXPOSE 5008

ENV ASPNETCORE_URLS=http://+:5008

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-dotnet-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
COPY ["plutoservice/plutoservice.csproj", "plutoservice/"]
RUN dotnet restore "plutoservice/plutoservice.csproj"
COPY . .
WORKDIR "/src/plutoservice"
RUN dotnet build "plutoservice.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "plutoservice.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "plutoservice.dll"]
