function dv --description alias\ dv=docker\ inspect\ mounts
    docker inspect --format='{{json .Mounts}}' $argv[1] | jq
end
