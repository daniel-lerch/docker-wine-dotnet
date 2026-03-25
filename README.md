# Run .NET desktop apps in a Docker container

[![](https://img.shields.io/docker/pulls/daniellerch/wine-dotnet.svg)](https://hub.docker.com/r/daniellerch/wine-dotnet)
[![](https://img.shields.io/docker/image-size/daniellerch/wine-dotnet/latest.svg)](https://hub.docker.com/r/daniellerch/wine-dotnet)

This image is built on [tobix/wine](https://github.com/webcomics/wine-docker) which already brings:
- Debian
- Wine stable
- Xvfb (X virtual frame buffer)

This image adds:
- A preconfigured Wine prefix
- .NET SDK 8.0
- Winetricks
- Core fonts

Run .NET CLI from a non-interactive, headless system e.g., CI pipeline (simulates a TTY):

```bash
script -q -e -c "wine dotnet --version" /dev/null
```

Run a graphical application tests e.g. Windows Forms on a headless system

```bash
xvfb-run script -q -e -c "wine MyApp.Tests.UI.exe" /dev/null
```
