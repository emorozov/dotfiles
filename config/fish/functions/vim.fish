# Defined in - @ line 1
function vim --wraps='nvim -O' --description 'alias vim nvim -O'
  nvim -O $argv;
end
