function fh
    set command (history | fzf --preview '' | sed 's/^[ \t]*[0-9]*[ \t]*//')
    
    if test -n "$command"
        eval "$command"
    end
end

function fp
    history | fzf --preview ''
end
