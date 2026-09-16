# ---- DOCKER ----

alias dc='docker compose'
alias dcu='docker compose up -d'
alias dcd='docker compose down'
alias dcr='docker compose restart'
alias dcl='docker compose logs -f'

# ---- CONTAINERS ----

alias dps='docker ps'
alias dpa='docker ps -a'
alias dlogs='docker logs -f'
alias dexec='docker exec -it'
alias drestart='docker restart'
alias dstats='docker stats'
alias dinspect='docker inspect'
alias dprune='docker system prune'

function dstop
    set containers (docker ps -q)

    if test -n "$containers"
        docker stop $containers
        echo "all containers stopped."
    else
        echo "no running containers."
    end
end

function dremove
    set containers (docker ps -q)

    if test -n "$containers"
        docker rm -f $containers
        echo "all containers removed."
    else
        echo "no containers found."
    end
end

# ---- TOOLS ----

alias dl='lazydocker'

function ctop
    set -lx DOCKER_HOST (docker context inspect colima --format '{{.Endpoints.docker.Host}}')
    command ctop $argv
end
