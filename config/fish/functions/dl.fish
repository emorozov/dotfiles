function dl
    set -l options (fish_opt -s f -l follow)
    argparse $options -- $argv

    set result (docker ps --format "{{.Names}}" | fzf)

    if set -q _flag_follow
        docker logs -f "$result"
    else
        docker logs "$result"
    end
end

