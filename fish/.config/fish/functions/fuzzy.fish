function fs
    set command (history | command fzf --preview '' | sed 's/^[ \t]*[0-9]*[ \t]*//')
    
    if test -n "$command"
        commandline --replace "$command"
    end
end

function fe
    set command (history | command fzf --preview '' | sed 's/^[ \t]*[0-9]*[ \t]*//')
    
    if test -n "$command"
        eval "$command"
    end
end

function _fzf_complete_git
  switch $argv[2]
    case checkout switch
      _fzf_complete --reverse --no-preview -- $argv < (git branch --all --format='%(refname:short)' | psub)

    case add
      function _fzf_complete_git_post
        awk '{print $NF}'
      end
      _fzf_complete --multi --reverse -- $argv < (git status --short | psub)

    case show log diff
      function _fzf_complete_git_post
        awk '{print $1}'
      end
      _fzf_complete --reverse --no-sort --preview='git show --color=always {1}' -- $argv < (git log --oneline | psub)

    case ''
      __fzf_complete_native "$argv[1] " --query=(commandline -t | string escape)

    case '*'
      set -l -- current_token (commandline -t)
      __fzf_complete_native "$argv $current_token" --query=(string escape -- $current_token) --multi
  end

  functions -e _fzf_complete_git_post
end
