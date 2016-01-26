function __machine_docker_machines
    docker-machine ls -q
end

function __machine_needs_command
    set cmd (commandline -opc)

    if test (count $cmd) -eq 1 -a "$cmd[1]" = "machine"
        return 0
    end

    return 1
end

complete -f -c machine \
    -a 'none (__machine_docker_machines)' \
    -n '__machine_needs_command'
