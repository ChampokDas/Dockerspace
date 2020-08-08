FROM ubuntu:20.04
 ARG USER_NAME
 ARG USER_ID
 ARG GROUP_ID
 RUN apt-get update -qq
 RUN DEBIAN_FRONTEND="noninteractive"

 RUN apt-get install -y vim valgrind golang llvm gdb lldb clang-format sudo pip python python-dev python3-dev python3-pip wget cmake g++ g++-9 git clang++-9 linux-tools-generic python3-pip libboost-all-dev

 RUN apt-get -y install
 RUN addgroup --gid $GROUP_ID user; exit 0
 RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID $USER_NAME; exit 0
 RUN echo "$USER_NAME:$USER_NAME" | chpasswd && adduser $USER_NAME sudo
 RUN echo 'root:Docker!' | chpasswd
 ENV TERM screen-256color
 USER $USER_NAME

 RUN gcc --version
 RUN cmake --version
 RUN python3 --version
 RUN pip3 --version
 RUN go version
