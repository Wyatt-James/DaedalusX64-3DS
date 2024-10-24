## Compiling from Source without Docker, using WSL2

To compile from source on WSL2 without Docker, execute these steps in-order. These steps pertain to Ubuntu Linux and were tested on version 22.04 LTS under WSL2, on Windows 10:
1. Install [WSL2](https://apps.microsoft.com/detail/9pn20msr04dw?rtc=1&hl=en-us&gl=US). An Ubuntu LTS release is recommended.
2. Open your newly installed Ubuntu installation and install `git` by running the command `sudo apt install git`.
3. Install [DevkitPro](https://devkitpro.org/wiki/Getting_Started) and its 3DS development toolchain.
    - Follow the instructions for your distro.
4. Install [PicaGL](https://github.com/masterfeizz/picaGL/tree/revamp). Specifically, you must acquire the linked `revamp` branch.
    - Clone the repository with `git clone -b revamp https://github.com/masterfeizz/picaGL.git`
    - Enter the newly created folder
    - run `make install`
    - Exit the folder with the command `cd ..`
5. Install [imgui-picagl](https://github.com/masterfeizz/imgui-picagl).
    - Clone the repository with `git clone https://github.com/masterfeizz/imgui-picagl.git`
    - Enter the newly created folder
    - run `make install`
    - Exit the folder with the command `cd ..`
6. If building a CIA, install [makerom](https://github.com/3DSGuy/Project_CTR).
7. Clone DaedalusX64 with Git and navigate into the newly-created directory.
8. Run the command `bash ./build_daedalus.sh CTR_RELEASE`
- If the build succeeds, the 3DSX and CIA files can be found in the `daedbuild` folder. Follow the [Usage](/README.md#usage) section to install it to your console.
