function sd --wraps='docker ps -q | xargs -r docker stop' --description 'alias sd=docker ps -q | xargs -r docker stop'
  docker ps -q | xargs -r docker stop
end
