#FROM registry.access.redhat.com/ubi8/dotnet-31:3.1
FROM registry.access.redhat.com/ubi8/ubi-init
USER 1001

RUN yum -y update
RUN yum -y dotnet-sdk-3.1;

RUN mkdir qotd-csharp
WORKDIR qotd-csharp
ADD . .

RUN dotnet publish -c Release

EXPOSE 80

CMD ["dotnet", "./bin/Release/netcoreapp3.0/publish/qotd-csharp.dll"]
