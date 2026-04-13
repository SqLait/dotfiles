function fish_prompt --description 'Custom prompt'
        set -l last_status $status
    
        # Default colors
        set -l user_color (set_color red)
        set -l host_color (set_color green)
        set -l cwd_color (set_color cyan)
        set -l bracket_color (set_color green)
        set -l status_color (set_color brgreen)
        set -l normal (set_color normal)
        set -l at_sym (set_color yellow)
    
        # Transient prompt (short version after command runs)
        if contains -- --final-rendering $argv
                echo -n (set_color brblack)(prompt_pwd)$normal' ❯ '
                return
        end
    
        # Root detection
        set -l suffix '❯'
        if functions -q fish_is_root_user; and fish_is_root_user
                set suffix '#'
        end
    
        # Error handling
        set -l prompt_status ""
        if test $last_status -ne 0
                set status_color (set_color red)
                set prompt_status $status_color"[$last_status]"$normal
        end
    
        # Build full prompt
        echo -n $bracket_color'['$normal
        echo -n $user_color(whoami)$normal
        echo -n $at_sym'@'$normal
        echo -n $host_color(cat /proc/sys/kernel/hostname)$normal
        echo -n $normal':'$normal
        echo -n $cwd_color(prompt_pwd)$normal
        echo -n $bracket_color']'$normal
    
        # Status (if error)
        echo -n $prompt_status
    
        # New line + prompt symbol
        echo
        echo -n $status_color$suffix' '$normal
end
