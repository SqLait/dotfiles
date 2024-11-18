function fs
    set command (history | fzf --preview '' | sed 's/^[ \t]*[0-9]*[ \t]*//')
    
    if test -n "$command"
        commandline --replace "$command"
    end
end

function fe
    set command (history | fzf --preview '' | sed 's/^[ \t]*[0-9]*[ \t]*//')
    
    if test -n "$command"
        eval "$command"
    end
end

