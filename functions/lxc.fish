function lxc --description 'Linux Containers'
	set -l subcmd $argv[1]
    set -l name

	function is_debug
        if test "$__fish_lxc_debug" -eq 1
            return 0
        end

        return 1
    end

	function help_exit
        echo 'Usage: lxc SUBCOMMAND' > /dev/fd/3
        return 1
    end

    function ensure_container_running
        if sudo lxc-info -n $name | grep 'STOPPED'
            echo "lxc-container $name is not running"
            return 1
        end
        return 0
    end

    if test (count $argv) = 0
        help_exit
    end

    if test (count $argv) -gt 1
        set name $argv[2]
        set args "-n $name" $args
    end

    if test (count $argv) -gt 2
        set args $args $argv[2..-1]
    end

    if test $subcmd = 'ssh'
        if test ! ensure_container_running
            return 1
        end

        set -l ip (sudo lxc-info -i -n $name | sed 's/IP:\s*//g')
        is_debug; and echo 'IP: ' $ip
        ssh ubuntu@$ip
    else
        is_debug; and echo eval sudo lxc-$subcmd $args
        eval sudo lxc-$subcmd $args
    end
end
