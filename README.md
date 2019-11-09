# Feature
1. Base on ubuntu 18.04
1. Latest version tools
1. Support multiarch

# Install
1. docker pull duckll/ctf-box
1. docker run -idt --name ctf --privileged --security-opt seccomp:unconfined duckll/ctf-box

# Usage
1. docker start ctf
1. docker exec -it ctf tmux

# Include
1. ipython
1. pwntools
1. gef
1. pwn-gdb
1. qemu
1. one_gadget
1. heapinfo
1. seccomp-tools
1. afl
1. binwalk
1. angr
