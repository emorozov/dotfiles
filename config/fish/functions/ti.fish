function ti --argument-names 'remotehost' --description 'Copies current terminal emulator terminfo to the remote host'
    infocmp -x | ssh $remotehost 'cat > $TERM.terminfo'
    ssh $remotehost 'tic -x $TERM.terminfo && rm $TERM.terminfo'
end
