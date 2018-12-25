#Build image
FROM microsoft/dotnet:2.2.100-sdk AS build

WORKDIR /app

# Copy all the project to build and publish
COPY . .
RUN dotnet publish -c Release -o out

# build runtime image
FROM microsoft/dotnet:2.2.0-aspnetcore-runtime
WORKDIR /app

COPY start.sh .
RUN chmod +x start.sh

COPY --from=build /app/DockerWeb/out ./api
COPY --from=build /app/Docker.Worker/out ./worker

ENV ASPNETCORE_URLS http://0.0.0.0:5000/
EXPOSE 5000

ENTRYPOINT ["/app/start.sh"]
