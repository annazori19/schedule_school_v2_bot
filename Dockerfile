FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY ["ScheduleBot.csproj", "./"]
RUN dotnet restore "ScheduleBot.csproj"
COPY . .
RUN dotnet publish "ScheduleBot.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/runtime:8.0
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "ScheduleBot.dll"]
