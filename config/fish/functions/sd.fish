function sd --wraps='docker ps | awk "NR>1 {print $1}" | xargs -r docker stop' --description 'alias sd=docker ps | awk "NR>1 {print $1}" | xargs -r docker stop'
  docker ps | awk "NR>1 {print \$1}" | xargs -r docker stop
end
