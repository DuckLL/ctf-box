# Feature
1. Easy to use
1. Latest version tools
1. Support multiarch
1. small
1. mid(✨)
1. latest(✨🏆)

# Install
1. docker pull duckll/ctf-box:[latest, mid, small]
1. docker run -id --name ctf -p 3002:3002 -p 4000:4000 --privileged --security-opt seccomp:unconfined duckll/ctf-box

# Usage
1. docker start ctf
1. docker exec -it ctf script /dev/null -c 'tmux'

# Include
1. common-tools
1. ipython
1. peda-gdb
1. pwn-gdb
1. pwntools
1. qemu(✨)
1. qira(✨)
1. angr(🏆)
1. pintools(🏆)

# Tmux key mapping
|  key  |        function         |
|  ---  |           ---           |
| <C-u> |        bind-key         |
|   c   |     create session      |
|   n   |      next session       |
|   -   |  split-window vertical  |
|   \   | split-window horizontal |
| hjkl  |     move in window      |
|   &   |      kill session       |
|   [   |       select mode       |
|   ]   |          past           |
