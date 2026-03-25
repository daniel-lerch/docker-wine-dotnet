FROM tobix/wine:stable

RUN apt-get update -y && apt-get install -y --no-install-recommends wget xdotool unzip cabextract && rm -rf /var/lib/apt/lists/*

RUN set -x \
&& wget --no-verbose https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -O /usr/bin/winetricks \
&& chmod +x /usr/bin/winetricks \
&& wget --no-verbose https://builds.dotnet.microsoft.com/dotnet/Sdk/8.0.418/dotnet-sdk-8.0.418-win-x64.exe -O /tmp/sdk.exe \
&& xvfb-run bash -x -c 'wineboot -u & PID=$!; sleep 10; xdotool key Return; wait $PID; winetricks corefonts; wine /tmp/sdk.exe /install /quiet /norestart; echo Exited with code $?' \
&& rm /tmp/sdk.exe
