FROM steamcmd/steamcmd:windows-core as steamcmd
RUN ./steamcmd.exe +login anonymous +app_update 298740 +quit
FROM mcr.microsoft.com/dotnet/framework/runtime:4.8.1
COPY --from=steamcmd /steamcmd/steamapps/common/SpaceEngineersDedicatedServer/ ./
ADD https://aka.ms/vs/16/release/vc_redist.x64.exe vc_redist.x64.exe
RUN vc_redist.x64.exe /install /quiet /norestart /log vc_redist.log; rm vc_redist.x64.exe; mkdir data
ENTRYPOINT /DedicatedServer64/SpaceEngineersDedicated.exe -console