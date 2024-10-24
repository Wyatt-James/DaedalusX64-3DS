FROM devkitpro/devkitarm:20240918 AS build

RUN mkdir /docker_logs

# ----- Download library archives -----

WORKDIR /tmp

# CREATES picagl.zip. We use this fork because it fixes a compilation error.
RUN wget https://github.com/masterfeizz/picaGL/archive/a10b1ce1ec2cd38a2ee3adf1033d9c789d103a31.zip \
-O picagl.zip && \
echo F7C8AF063648099432BEBDA13032ADC4927CE7A7A4E03E641FD0F0376AC84FB8  picagl.zip | sha256sum --check

# CREATES imgui-picagl.zip
RUN wget https://github.com/masterfeizz/imgui-picagl/archive/b77470554867235f5a23a16a12388667096b4ecb.zip \
  -O imgui-picagl.zip && \
  echo b401f70f0c59cb1b0db5a39597c294d23eabbbd71a06b181b2619af6e2324c72  imgui-picagl.zip | sha256sum --check

# CREATES makerom.zip
RUN wget https://github.com/3DSGuy/Project_CTR/releases/download/makerom-v0.17/makerom-v0.17-ubuntu_x86_64.zip \
  -O makerom.zip && \
  echo 976c17a78617e157083a8e342836d35c47a45940f9d0209ee8fd210a81ba7bc0  makerom.zip | sha256sum --check

# ----- Extract archives in-place, removing commit-specific container folders -----

# CREATES picagl-temp, picagl
RUN unzip -d ./picagl-temp picagl.zip
RUN mv ./picagl-temp/picaGL-* ./picagl

# CREATES imgui-picagl-temp, imgui-picagl
RUN unzip -d ./imgui-picagl-temp imgui-picagl.zip
RUN mv ./imgui-picagl-temp/imgui-picagl-* ./imgui-picagl

# ----- Install dependencies -----

# Install picaGL
WORKDIR /tmp/picagl
RUN make all install > /docker_logs/make_picagl.txt

# Install imgui-picagl. MUST build after picaGL!
WORKDIR /tmp/imgui-picagl
RUN make install > /docker_logs/make_imgui-picagl.txt

# Install makerom
WORKDIR /tmp
RUN unzip -d /opt/devkitpro/tools/bin/ makerom.zip
RUN chmod +x /opt/devkitpro/tools/bin/makerom

# ----- Clean up temporary folders -----
WORKDIR /tmp
RUN rm imgui-picagl.zip
RUN rm picagl.zip
RUN rm makerom.zip
RUN rm -rf imgui-picagl-temp
RUN rm -rf picagl-temp
RUN rm -rf imgui-picagl
RUN rm -rf picagl

# ----- Set up environment variables -----
ENV PATH="/opt/devkitpro/tools/bin:$PATH"
ENV PATH="/dx64/Tools:$PATH"
ENV DEVKITPRO=/opt/devkitpro
ENV DEVKITARM=/opt/devkitpro/devkitARM

# ----- Navigate to final working directory -----
RUN mkdir /dx64
WORKDIR /dx64

# ----- How to build this Dockerfile -----

# Replace <yourname> with your screen name and <yourversion> with anything you'd like. Don't worry, nothing will be uploaded.

# build docker image: `docker build -t <yourname>/dx64-3ds:<yourversion> - < ./Dockerfile`
# build Daedalusx64-3DS: `docker run --rm -v $(pwd):/dx64 <yourname>/dx64-3ds:<yourversion> bash ./build_daedalus.sh CTR_RELEASE`
