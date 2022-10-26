# AndroidStudioInDocker
A Docker image running Android Studio and IDEA(2019.3.5) based on Ubuntu 16.04 with VNC, noVNC, SSH, adb tools and xfce desktop, Chromium, Firefox.

Base image from consol/ubuntu-xfce-vnc:latest.

Pull image from [DockerHub](https://hub.docker.com/r/peacedocker10/androidstudiodocker)

# Usage
```
docker run -d --name YourName --shm-size 2G -P -p 8888:5901 -p 8899:6901 -e VNC_RESOLUTION=1920x1080 -e VNC_PW=ppllmmoo --device /dev/kvm --user $(id -u):$(id -g) peacedocker10/androidstudiodocker:1.5
```

- Connect by vnc client:

```
HOST:8888
```

- Connect by Web browser(HTML Client)

```
http://HOST:8899/vnc.html
```

OR:

```
HOST:8899
```

- Set VNC resolution depth and password

```
-e VNC_COL_DEPTH=24
-e VNC_COL_DEPTH=1920x1080
-e VNC_PW=PASSWD
```

- Run docker as root

```
--user 0
```

# Version

1.0: VNC, AndroidStudio

1.1 & 1.2: Wallpaper & Theme

1.3: Idea ULIMATE 20190305

1.4: ADB bundles

1.5: Layout Master for Idea

# Demo
![](https://github.com/NasdaqGodzilla/AndroidStudioInDocker/blob/new/desktop.png?raw=true)
![](https://github.com/NasdaqGodzilla/AndroidStudioInDocker/blob/new/as.png?raw=true)
![](https://github.com/NasdaqGodzilla/AndroidStudioInDocker/blob/new/layoutmaster.png?raw=true)

# LICENSE
The MIT License (MIT)

Copyright (c) [2022] [Niko Zhong]

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
