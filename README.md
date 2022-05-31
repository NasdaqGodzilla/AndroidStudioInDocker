# AndroidStudioInDocker
Android Studio running in Docker based on Ubuntu 18.04 with VNC, SSH, adb tools and xfce desktop. 

![](https://img.shields.io/static/v1?label=DockerHub&message=DaaS&color=green&logo=docker&url=https://hub.docker.com/repository/docker/peacedocker10/niko-daas/)

# Usage
1. [Pull](https://hub.docker.com/repository/docker/peacedocker10/niko-daas/) from docker hub.
2. Set up.
  `docker run -dit --name PeaceDAASMaker -p 8205:5901 -v ~/project/:/metaworld peacedocker10/niko-daas:1.4`
  - `-p 8205:5901`: Port for VNC. Redirect 8205 of localhost to 5901 of container. The port 5901 is fixed, which is used by VNC.
  - `-v ~/project/:/metaworld`: Sharing folder of localhost to container.
  - `--name PeaceDAASMaker`: Name this container.
3. Enter container by `docker exec -it <your-container-id> /bin/bash`
4. In container, start vnc server.
  `vncserver :1  -geometry=1920x1080  -localhost no`
  - VNC password is 8888 by default.
5. Connecting to container by using VNC client. Connect to IP:PORT, the ip of your host and the port that you define in step on `-p port:port`.
  - In this example, PORT is 8205.

# Details & Reference
[AndroidStudio in Docker: 使用文档](https://nasdaqgodzilla.github.io/2022/05/31/AndroidStudio-in-Docker-%E4%BD%BF%E7%94%A8%E6%96%87%E6%A1%A3/)

[Docker as As DaaS: 在Docker中运行的AndroidStudio](https://nasdaqgodzilla.github.io/2022/05/31/Docker-as-As-DaaS-%E5%9C%A8Docker%E4%B8%AD%E8%BF%90%E8%A1%8C%E7%9A%84AndroidStudio/)

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
