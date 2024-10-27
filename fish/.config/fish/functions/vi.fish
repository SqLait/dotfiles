function fish_user_key_bindings
    if status --is-interactive
        function vi_mode
            fish_vi_key_bindings
        end
        vi_mode
    end
end
