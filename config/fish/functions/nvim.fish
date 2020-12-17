# Defined in - @ line 1
function nvim --wraps=vim --wraps='nvim -O' --description 'alias nvim nvim -O'
 command nvim -O $argv;
end
