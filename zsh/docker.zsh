function dlogs {
    local CONTAINER=$(docker ps -a | fzf | awk '{print $1}')
    docker logs $CONTAINER
}

function dremove {
	docker ps -a | fzf -m | awk '{print $1}' | xargs docker rm -f
}
