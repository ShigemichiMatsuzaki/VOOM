# FROM nvidia/opengl:1.0-glvnd-devel-ubuntu20.04
FROM nvidia/cudagl:11.4.2-devel

ENV NVARCH x86_64

ENV NVIDIA_REQUIRE_CUDA "cuda>=11.1 brand=tesla,driver>=418,driver<419 brand=tesla,driver>=450,driver<451"
# ENV NV_CUDA_CUDART_VERSION 11.1.74-1
# ENV NV_CUDA_COMPAT_PACKAGE cuda-compat-11-1
ARG DEBIAN_FRONTEND=noninteractive

ARG TARGETARCH

WORKDIR /home/work_dir/

LABEL maintainer "NVIDIA CORPORATION <cudatools@nvidia.com>"

# RUN apt-get -o Acquire::http::Timeout="30000" update && apt-get install -y --no-install-recommends \
#     gnupg2 curl ca-certificates && \
#     curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/${NVARCH}/3bf863cc.pub | apt-key add - && \
#     echo "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/${NVARCH} /" > /etc/apt/sources.list.d/cuda.list && \
#     apt-get purge --autoremove -y curl \
#     && rm -rf /var/lib/apt/lists/*

# Install some basic utilities
RUN apt-get update && apt-get install -y \
    mesa-utils \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    cmake \
    && rm -rf /var/lib/apt/lists/*

ENV HOME=/home

# RUN apt-get update && apt-get install -y  \
#     git wget sudo build-essential \
#     python3 python3-setuptools python3-pip python3-dev python3-tk \
#     ffmpeg libsm6 libxext6 \
#     lsb-release curl
# RUN ln -svf /usr/bin/python3 /usr/bin/python
# RUN python -m pip install --upgrade --force pip

# ROS2をインストール
# RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
# RUN apt-get -o Acquire::http::Timeout="30000" update && apt-get install -y ros-${ROS_DISTRO}-desktop-full
# RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null
# RUN apt update && \
#     apt install -y \
#     ros-foxy-desktop \
#     python3-argcomplete \
#     ros-dev-tools \
#     python3-colcon-common-extensions \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*rm 
# 
# # 必要なpython packageをインストール
# RUN pip install \
#     numpy \
#     spatialmath-python \
#     distinctipy \
#     matplotlib==3.4.1 \
#     opencv-contrib-python \
#     pyrealsense2 \
#     pudb

# Install dependencies
RUN apt update \
    && apt install -y \
    libsqlite3-dev \
    libdlib-dev \
    liblapack-dev \
    libopencv-dev \
    libglm-dev \
    libglfw3-dev \
    libglew-dev \
    libpng-dev \
    libjpeg-dev \
    libeigen3-dev \
    libboost-filesystem-dev \
    libboost-program-options-dev \
    protobuf-compiler \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*rm 


# Install Pangolin for visualization of Ellipsoid SLAM
RUN cd /tmp \
    && git clone https://github.com/stevenlovegrove/Pangolin \
    && cd Pangolin \
    && mkdir build \
    && cd build \
    && cmake .. \
    && cmake --build . \
    && make install
