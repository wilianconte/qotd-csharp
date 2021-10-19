FROM registry.access.redhat.com/ubi8/dotnet-31:3.1
#USER 1001

USER root

RUN mkdir qotd-csharp
WORKDIR qotd-csharp
ADD . .

RUN yum -y update

RUN dotnet publish -c Release



EXPOSE 80

CMD ["dotnet", "./bin/Release/netcoreapp3.0/publish/qotd-csharp.dll"]
