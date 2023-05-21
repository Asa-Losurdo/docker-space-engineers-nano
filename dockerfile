FROM steamcmd/steamcmd:windows-core as steamcmd
RUN ./steamcmd.exe +login anonymous +app_update 298740 +quit
FROM mcr.microsoft.com/dotnet/framework/runtime:4.8.1
COPY --from=steamcmd /steamcmd/steamapps/common/SpaceEngineersDedicatedServer/ ./
ADD https://aka.ms/vs/17/release/vc_redist.x64.exe vc_17.exe
ADD https://aka.ms/highdpimfc2013x64enu vc_13.exe
RUN vc_17.exe /install /quiet /norestart /log vc_redist.log \
    & vc_13.exe /install /quiet /norestart /log vc_redist.log \
    & del vc_17.exe  vc_13.exe\
    & mkdir data
ENTRYPOINT /DedicatedServer64/SpaceEngineersDedicated.exe -console -path /data

