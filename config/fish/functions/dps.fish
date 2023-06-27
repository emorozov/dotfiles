function dps --wraps=docker\ ps\ --format\ \"table\ \{\{.Names\}\}\\t\{\{.Image\}\}\\t\{\{.Status\}\}\\t\{\{.Ports\}\}\" --description alias\ dps=docker\ ps\ --format\ \"table\ \{\{.Names\}\}\\t\{\{.Image\}\}\\t\{\{.Status\}\}\\t\{\{.Ports\}\}\"
  docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}" $argv
        
end
