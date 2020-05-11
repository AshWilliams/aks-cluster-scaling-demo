FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /source

COPY *.sln .
COPY ScalingDemo.API/*.csproj ./ScalingDemo.API/
RUN dotnet restore -r linux-x64

COPY ScalingDemo.API/. ./ScalingDemo.API/
WORKDIR /source/ScalingDemo.API
RUN dotnet publish ScalingDemo.API.csproj -c release -o /app -r linux-x64 --self-contained true --no-restore

FROM mcr.microsoft.com/dotnet/core/runtime-deps:3.1-buster-slim
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["./ScalingDemo.API"]