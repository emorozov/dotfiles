function xzsize --wraps='xz --robot -l $argv[1] | grep file | cut -f 5' --description 'alias xzsize=xz --robot -l $argv[1] | grep file | cut -f 5'
  xz --robot -l $argv[1] | grep file | cut -f 5
end
