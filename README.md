# Feature

1. Easy to use
1. Latest version tools
1. Support multiarch
1. tag:small(for beginner)

# Install

1. docker pull duckll/ctf-box
1. docker run -idt --name ctf -P --security-opt seccomp:unconfined duckll/ctf-box

# Usage
1. docker start ctf (if container is stoped)
1. docker attach ctf (use tmux)(recommend)
1. docker exec -it ctf (use window)(for beginner)

# Include

1. common-tools
1. ipython
1. peda-gdb
1. pwn-gdb
1. pwntools
1. qemu(✨)
1. angr(✨)
1. qira(✨)
1. pintools(✨)

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
