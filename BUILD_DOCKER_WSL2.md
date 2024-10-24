## Compiling from Source with Docker and WSL2

To compile from source on WSL2 with Docker, execute these steps in-order. This guide was written for and tested on Ubuntu 22.04 LTS running under WSL2 (Windows Subsystem for Linux 2), on Windows 10.

1. Install [WSL2](https://apps.microsoft.com/detail/9pn20msr04dw?rtc=1&hl=en-us&gl=US). An Ubuntu LTS release is recommended.
2. Install [Docker Desktop](https://docs.docker.com/desktop/wsl/) and enable WSL2 integration.
3. Open your newly installed Ubuntu installation and install `git` by running the command `sudo apt install git`.
4. Clone DaedalusX64 with Git and navigate into the newly-created directory.
5. Run the command `docker build -t <yourname>/dx64-3ds:<yourversion> - < ./Dockerfile` to build the Docker image.
    - Replace <yourname> with your screen name and <yourversion> with anything you'd like. Don't worry, nothing will be uploaded.
6. Run the command `docker run --rm -v $(pwd):/dx64 <yourname>/dx64-3ds:<yourversion> bash ./build_daedalus.sh CTR_RELEASE` to build DaedalusX64-3DS.
- If the build succeeds, the 3DSX and CIA files can be found in the `daedbuild` folder. Follow the [Usage](/README.md#usage) section to install it to your console.
