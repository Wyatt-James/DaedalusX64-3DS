## Compiling from Source without Docker, using native Ubuntu

To compile from source on Ubuntu, execute these steps in-order. These steps pertain to Ubuntu Linux, but were not tested directly.
1. Install `git` by running the command `sudo apt install git`.
2. Install [DevkitPro](https://devkitpro.org/wiki/Getting_Started) and its 3DS development toolchain.
    - Follow the instructions for your distro.
3. Install [PicaGL](https://github.com/masterfeizz/picaGL/tree/revamp). Specifically, you must acquire the linked `revamp` branch.
    - Clone the repository with `git clone -b revamp https://github.com/masterfeizz/picaGL.git`
    - Enter the newly created folder
    - run `make install`
    - Exit the folder with the command `cd ..`
4. Install [imgui-picagl](https://github.com/masterfeizz/imgui-picagl).
    - Clone the repository with `git clone https://github.com/masterfeizz/imgui-picagl.git`
    - Enter the newly created folder
    - run `make install`
    - Exit the folder with the command `cd ..`
5. If building a CIA, install [makerom](https://github.com/3DSGuy/Project_CTR).
6. Clone DaedalusX64 with Git and navigate into the newly-created directory.
7. Run the command `bash ./build_daedalus.sh CTR_RELEASE`
- If the build succeeds, the 3DSX and CIA files can be found in the `daedbuild` folder. Follow the [Usage](/README.md#usage) section to install it to your console.
