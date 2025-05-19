function ,fm --description "Fix migrations owner"
    fd -I '0[\d]{3}_[\w\d]+\.py' --owner root --newer 1day | xargs -r sudo chown jmv:jmv
end
