function __gsh_needs_command
    set cmd (commandline -opc)

    if test (count $cmd) -eq 1 -a $cmd[1] = 'gsh'
        return 0
    end
    return 1
end

function __gsh_git_branches
  command git branch --no-color -a ^/dev/null | sgrep -v ' -> ' | sed -e 's/^..//' -e 's/^remotes\///'
end


complete -f -c gsh -n '__gsh_needs_command' -a '(__gsh_git_branches)' -d 'Branch'
