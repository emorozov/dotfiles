function ,ds
    set result (docker container ls --format "{{.Names}}" | fzf)

    if count $argv > /dev/null
        docker exec -it "$result" $argv
    else
        # No command - try bash
        docker exec -it "$result" /bin/bash
    end
end

