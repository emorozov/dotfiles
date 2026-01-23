function df --description 'alias df=df -x tmpfs'
    command df -x squashfs -x tmpfs $argv
end
